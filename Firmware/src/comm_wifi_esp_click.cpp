#include "comm_wifi_esp_click.h"

#include "eoss3_hal_uart.h"
#include <string.h>
#include <stdio.h>
#include "dbg_uart.h"
#include "delay.h"

WifiEspClick::WifiEspClick(int uartid) {
	this->uartId = uartid;
	this->wifiSsid = WIFI_SSID;
	this->wifiPwd = WIFI_PASSWD;
	this->ip = WIFI_PC_IP;
	this->port = WIFI_PC_PORT;
}

bool WifiEspClick::ready() {
	drainBuffers();
	//this->sendString("\r\n");
	this->sendString("AT\r\n");
	this->connected = this->waitString("OK");
	return this->connected;
}

bool WifiEspClick::connect() {
	char command[100];
	sprintf(command, "AT+CIPSTART=\"TCP\",\"%s\",%s", this->ip, this->port);
	drainBuffers();
	this->sendString(command);
	this->sendString("\r\n");
	this->connected = this->waitString("OK");
	return this->connected;
}

void WifiEspClick::send(const char *str) {
	this->send((uint8_t*) str, strlen(str));
}

void WifiEspClick::send(const uint8_t* p_source, size_t len) {
	char command[100];
	sprintf(command, "AT+CIPSEND=%d", len);
	this->sendString(command);
	this->sendString("\r\n");
	if (this->waitString(">")) {;
		this->sendData(p_source, len);
		this->sendString("\r\n");
	}
}

size_t WifiEspClick::available() {
	return 0;
}

size_t WifiEspClick::read(const uint8_t* p_dest, size_t len) {
	return 0;
}

void WifiEspClick::sendString(const char *command) {
	//dbg_str_str("sends", command);
	this->sendData((uint8_t*) command, strlen(command));
}

void WifiEspClick::sendData(const uint8_t *data, size_t len) {
	dbg_str_int("send", len);
	size_t cpos = 0;
	while (cpos < len) {
	    size_t slen = len - cpos > 4 ? 4 : len - cpos;
	    uart_tx_raw_buf(this->uartId, data + cpos, slen);
	    cpos += slen;
	}

}

bool WifiEspClick::waitString(const char *str) {
	uint8_t buf[256];
	size_t bufPos = 0;
	size_t length = strlen(str);
	int steps = 0;
	while (bufPos < 255 && steps < 25000) {
	    steps++;
		int av = uart_rx_available(this->uartId);
		if (av <= 0) {
			continue;
		}
		int toRead = av > 255 - bufPos ? 255 - bufPos : av;
//		if (toRead + bufPos < 5) {
//			continue;
//		}
		toRead = toRead > 4 ? 4 : toRead;
		uart_rx_raw_buf(this->uartId, buf + bufPos, toRead);
		bufPos += toRead;
		buf[bufPos] = 0;
		//dbg_str_int("wifi rcv", bufPos);
		//dbg_str_str("dt", (const char*) buf + bufPos - toRead);
		for (int  t = 0; t <= bufPos - length; ++t) {
			if (strncmp((char*)(buf + t), str, length) == 0) {
			    //dbg_str_int("wait_true", steps);
				dbg_str_str("wt_true", str);
				return true;
			}
		}
	}
	dbg_str_str("wait_false", str);
	return false;
}

void WifiEspClick::uartEnable() {
	this->drainBuffers();
	uart_new_baudrate(this->uartId, WIFI_ESP_CLICK_BAUD_RATE);
	this->drainBuffers();
}

void WifiEspClick::uartDisable() {
	// drain buffers
	this->drainBuffers();
	uart_new_baudrate(this->uartId, 9600);
	this->drainBuffers();
}

void WifiEspClick::drainBuffers() {
	uint8_t buf[256];
	for (int i = 0; i < 1000; i++) {
		int av = uart_rx_available(this->uartId);
		if (av <= 0) {
			//dbg_str_int("drain", i);
			return;
		}
		uart_rx_raw_buf(this->uartId, buf, av > 255 ? 255 : av);
	}
}

