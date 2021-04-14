#ifndef COMM_WIFI_ESP_CLICK_H_
#define COMM_WIFI_ESP_CLICK_H_

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include "wifi_credentials.h"

static const uint32_t WIFI_ESP_CLICK_BAUD_RATE = 115200;
static const char *WIFI_PC_PORT = "8080";

//static int wifi_esp_click_uart_id;

class WifiEspClick {
public:
	WifiEspClick(int uartid);

	bool ready();

	bool connect();

	void send(const char *str);

	void send(const uint8_t* p_source, size_t ilen);

	size_t available();

	size_t read(const uint8_t* p_dest, size_t ilen);

	// UART multiplexing
	void uartEnable();

	void uartDisable();

private:
	int uartId;
	const char *wifiSsid;
	const char *wifiPwd;
	const char *ip;
	const char *port;

	bool connected = false;

	void sendString(const char *command);

	void sendData(const uint8_t *buf, size_t len);

	bool waitString(const char *command);

	void drainBuffers();
};

#endif
