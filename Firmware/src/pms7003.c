#include "pms7003.h"

#include <stdint.h>

#include <errno.h>
#include <signal.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include "eoss3_hal_uart.h"

#define UART_STRUCTS_VERSION 1
//#define Log_Debug(...)

uint16_t makeWord(uint8_t high, uint8_t low) {
	return (high << 8) | (low);
}
//#define MAKEWORD(x, y) ((y) << 8 | (x))

// By default, this sample is targeted at the MT3620 Reference Development Board (RDB).
// This can be changed using the project property "Target Hardware Definition Directory".
// This #include imports the sample_hardware abstraction from that hardware definition.
//#include <hw/sample_hardware.h>

// File descriptors - initialized to invalid value
static int _pms_uartFd = -1;
static int _pms_epollFd = -1;

/// <summary>
///     Helper function to send a fixed message via the given UART.
/// </summary>
/// <param name="uartFd">The open file descriptor of the UART to write to</param>
/// <param name="dataToSend">The data to send over the UART</param>
static void SendUartMessage(int uartFd, const uint8_t *dataToSend, size_t length)
{
	size_t totalBytesSent = 0;
	size_t totalBytesToSend = length;
	int sendIterations = 0;
	while (totalBytesSent < totalBytesToSend) {
		sendIterations++;

		// Send as much of the remaining data as possible
		size_t bytesLeftToSend = totalBytesToSend - totalBytesSent;
		const uint8_t *remainingMessageToSend = dataToSend + totalBytesSent;
		uart_tx_raw_buf(_pms_uartId, remainingMessageToSend, bytesLeftToSend);
		ssize_t bytesSent = bytesLeftToSend;
		if (bytesSent < 0) {
			Log_Debug("ERROR: Could not write to UART: %s (%d).\n", strerror(errno), errno);
			//terminationRequired = true;
			return;
		}

		totalBytesSent += (size_t)bytesSent;
	}

	Log_Debug("Sent %zu bytes over UART in %d calls.\n", totalBytesSent, sendIterations);
}

/// <summary>
///     Handle UART event: if there is incoming data, print it.
/// </summary>
bool pms_readData(void)
{
	const size_t receiveBufferSize = 256;
	uint8_t receiveBuffer[receiveBufferSize + 1];
	bool read = false;

	for (;;) {
		//size_t bytesRead = Uart_DequeueData(_pms_uartId, receiveBuffer, sizeof(receiveBuffer) - 1);
		size_t rx_avail = uart_rx_available(UART_ID_SSI);

		if (rx_avail == 0) {
			return read;
		}

		read = true;

		size_t to_read = rx_avail > receiveBufferSize - 1 ? receiveBufferSize - 1 : rx_avail;
		uart_rx_raw_buf(UART_ID_SSI, receiveBuffer, to_read);

		// Null terminate the buffer to make it a valid string, and print it
		receiveBuffer[to_read] = 0;
		//dbg_str_int("pms7003 UART received", to_read);

		// process sensor data
		for (int i = 0; i < to_read; ++i) {
			pms_processData(receiveBuffer[i]);
		}
	}
}

void pms_init(int uartId)
{
	_pms_uartFd = uartId;
	_pms_data.PM_SP_UG_1_0 = 0xFFFF;
}

// Standby mode. For low power consumption and prolong the life of the sensor.
void pms_sleep()
{
	uint8_t command[] = { 0x42, 0x4D, 0xE4, 0x00, 0x00, 0x01, 0x73 };
	SendUartMessage(_pms_uartFd, command, sizeof(command));
	//_stream->write(command, sizeof(command));
}

// Operating mode. Stable data should be got at least 30 seconds after the sensor wakeup from the sleep mode because of the fan's performance.
void pms_wakeUp()
{
	uint8_t command[] = { 0x42, 0x4D, 0xE4, 0x00, 0x01, 0x01, 0x74 };
	SendUartMessage(_pms_uartFd, command, sizeof(command));
	//_stream->write(command, sizeof(command));
}

// Active mode. Default mode after power up. In this mode sensor would send serial data to the host automatically.
void pms_activeMode()
{
	uint8_t command[] = { 0x42, 0x4D, 0xE1, 0x00, 0x01, 0x01, 0x71 };
	SendUartMessage(_pms_uartFd, command, sizeof(command));
	//_stream->write(command, sizeof(command));
	_pms_mode = MODE_ACTIVE;
}

// Passive mode. In this mode sensor would send serial data to the host only for request.
void pms_passiveMode()
{
	uint8_t command[] = { 0x42, 0x4D, 0xE1, 0x00, 0x00, 0x01, 0x70 };
	SendUartMessage(_pms_uartFd, command, sizeof(command));
	//_stream->write(command, sizeof(command));
	_pms_mode = MODE_PASSIVE;
}

// Request read in Passive Mode.
void pms_requestRead()
{
	if (_pms_mode == MODE_PASSIVE)
	{
		uint8_t command[] = { 0x42, 0x4D, 0xE2, 0x00, 0x00, 0x01, 0x71 };
		SendUartMessage(_pms_uartFd, command, sizeof(command));
		//_stream->write(command, sizeof(command));
	}
}

// Non-blocking function for parse response.
bool pms_read(DATA *data)
{
	//_pms_data = data;
	//pms_loop();

	return _pms_status == STATUS_OK;
}

// Blocking function for parse response. Default timeout is 1s.
bool pms_readUntil(DATA *data, uint16_t timeout)
{
	//_pms_data = data;
	//uint32_t start = millis();
	int cnt = 0;
	do
	{
		pms_loop();
		if (_pms_status == STATUS_OK) break;
	} while (cnt++ < 1000 /*millis() - start < timeout*/);

	return _pms_status == STATUS_OK;
}

DATA pms_getData() {
	return _pms_data;
}

void pms_loop()
{
	_pms_status = STATUS_WAITING;

	const struct timespec sleepTime = { 0, 100000000 };
	for (int i = 0; i < 10; i++) {
		if (_pms_status == STATUS_OK) {
			return;
		}
		//nanosleep(&sleepTime, NULL);
	}
	//if (_stream->available())
	//{
	//	processData(_stream->read())
	//}
}

void pms_resetState() {
    _pms_index = 0;
}

void pms_processData(uint8_t ch) {
	{
		switch (_pms_index)
		{
		case 0:
			if (ch != 0x42)
			{
				return;
			}
			_pms_calculatedChecksum = ch;
			break;

		case 1:
			if (ch != 0x4D)
			{
				_pms_index = 0;
				return;
			}
			_pms_calculatedChecksum += ch;
			break;

		case 2:
			_pms_calculatedChecksum += ch;
			_pms_frameLen = ch << 8;
			break;

		case 3:
			_pms_frameLen = ch;
			// Unsupported sensor, different frame length, transmission error e.t.c.
			if (_pms_frameLen != 2 * 9 + 2 && _pms_frameLen != 2 * 13 + 2)
			{
				_pms_index = 0;
				return;
			}
			_pms_calculatedChecksum += ch;
			break;

		default:
			if (_pms_index == _pms_frameLen + 2)
			{
				_pms_checksum = ch << 8;
			}
			else if (_pms_index == _pms_frameLen + 2 + 1)
			{
				_pms_checksum |= ch;

				if (_pms_calculatedChecksum == _pms_checksum)
				{
					// Standard Particles, CF=1.
					//if (_pms_data != NULL) {
					_pms_data.PM_SP_UG_1_0 = makeWord(_pms_payload[0], _pms_payload[1]);
					_pms_data.PM_SP_UG_2_5 = makeWord(_pms_payload[2], _pms_payload[3]);
					_pms_data.PM_SP_UG_10_0 = makeWord(_pms_payload[4], _pms_payload[5]);

					// Atmospheric Environment.
					_pms_data.PM_AE_UG_1_0 = makeWord(_pms_payload[6], _pms_payload[7]);
					_pms_data.PM_AE_UG_2_5 = makeWord(_pms_payload[8], _pms_payload[9]);
					_pms_data.PM_AE_UG_10_0 = makeWord(_pms_payload[10], _pms_payload[11]);

					_pms_data.CNT_0_3 = makeWord(_pms_payload[12], _pms_payload[13]);
					_pms_data.CNT_0_5 = makeWord(_pms_payload[14], _pms_payload[15]);
					_pms_data.CNT_1_0 = makeWord(_pms_payload[16], _pms_payload[17]);
					_pms_data.CNT_2_5 = makeWord(_pms_payload[18], _pms_payload[19]);
					_pms_data.CNT_5_0 = makeWord(_pms_payload[20], _pms_payload[21]);
					_pms_data.CNT_10_0 = makeWord(_pms_payload[22], _pms_payload[23]);
					//}

					_pms_status = STATUS_OK;
				}

				_pms_index = 0;
				return;
			}
			else
			{
				_pms_calculatedChecksum += ch;
				uint8_t payloadIndex = _pms_index - 4;

				// Payload is common to all sensors (first 2x6 bytes).
				if (payloadIndex < sizeof(_pms_payload))
				{
					_pms_payload[payloadIndex] = ch;
				}
			}

			break;
		}

		_pms_index++;
	}
}
