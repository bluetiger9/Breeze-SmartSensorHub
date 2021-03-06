/** @file ssi_task.c */

/*==========================================================
 * Copyright 2020 QuickLogic Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *==========================================================*/

#include "Fw_global_config.h"

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>

#include "eoss3_hal_uart.h"
#include "dbg_uart.h"
#include "sensor_ssss.h"
#include "RtosTask.h"
#include "ssi_comms.h"
#include "comm_wifi_esp_click.h"
#include "power.h"
#include "delay.h"
#include "eoss3_hal_gpio.h"
#include "pms7003.h"

#define STACK_SIZE_TASK_SSI (256)
#define PRIORITY_TASK_SSI (PRIORITY_NORMAL)
#define SSI_RXBUF_SIZE (128)

xTaskHandle xHandleTaskSSI;
bool        is_ssi_connected          = false;
const char  ssi_connect_string[]      = "connect";
int         ssi_connect_string_len    = sizeof(ssi_connect_string) - 1;
const char  ssi_disconnect_string[]   = "disconnect";
int         ssi_disconnect_string_len = sizeof(ssi_disconnect_string) - 1;

WifiEspClick wifiEspClick(UART_ID_WIFI_ESP_CLICK);

/* Control  task */
void ssiTaskHandler (void *pParameter) {
    int count = 0;
    int json_len = 0;
    int rx_avail = 0;
    int rx_buf_pos = 0;
    char ssi_rxbuf[SSI_RXBUF_SIZE];

    assert(SSI_RXBUF_SIZE >= ssi_connect_string_len);

    memset(ssi_rxbuf, 0, sizeof(ssi_rxbuf));
    json_len = strlen(json_string_sensor_config);
    while (1)
    {
        // Send the JSON string
        vTaskDelay(3000);
        if (is_ssi_connected == false)
        {
            HAL_GPIO_Write(6, false);
            wifiEspClick.uartEnable();
            if (!wifiEspClick.ready())
            {
                dbg_str("wifi not ready\n");
                power(COM, false);
                HAL_GPIO_Write(6, false);
                HAL_GPIO_Write(5, true);
                vTaskDelay(3000);
                HAL_GPIO_Write(5, false);
                power(COM, true);
                continue;
            }

            HAL_GPIO_Write(6, true);
            dbg_str("wifi ready\n");
            vTaskDelay(500);
            bool connected = wifiEspClick.connect();
            if (connected)
            {
                dbg_str("WIFI CONNECTED\n");
                vTaskDelay(500);
                //wifiEspClick.send("testtesttesttesttesttesttesttesttesttesttesttesttesttestte"\
                                "sttesttesttesttesttesttesttesttesttest\n");
                if (wifiEspClick.send(json_string_sensor_config) == 0) {
                    continue;
                }
                HAL_GPIO_Write(6, false);
                HAL_GPIO_Write(5, true);

                is_ssi_connected = true;

            } else {
                HAL_GPIO_Write(6, false);

                power(COM, false);
                vTaskDelay(3000);
                power(COM, true);

            }
            wifiEspClick.uartDisable();
            //uart_tx_raw_buf(UART_ID_SSI, json_string_sensor_config, json_len);
            continue;

        } else {
            // do nothing for now
            continue;
        }
        rx_avail = uart_rx_available(UART_ID_SSI);
        if (rx_avail > 0 && rx_buf_pos <= SSI_RXBUF_SIZE)
        {
            uart_rx_raw_buf(UART_ID_SSI, (uint8_t*) (ssi_rxbuf + rx_buf_pos), rx_avail);
            rx_buf_pos += rx_avail;
            //dbg_str("UART RCV:\n");
            //	for (int i = 0; i < rx_buf_pos; ++i) {
            //		dbg_ch(ssi_rxbuf[i]);
            //	}
            //	dbg_str("\n");
            //}
            //if (rx_avail == ssi_connect_string_len)
            //{
            //    uart_rx_raw_buf(UART_ID_SSI, ssi_rxbuf, ssi_connect_string_len);
            for (int t = 0; t <= rx_buf_pos - ssi_connect_string_len; ++t)
            {

                if (strncmp(ssi_rxbuf + t, ssi_connect_string, ssi_connect_string_len) == 0)
                {
                    dbg_str("connect:\n");
                    rx_buf_pos = 0;

                    is_ssi_connected = true;
#if (SSI_SENSOR_SELECT_SSSS)
                    sensor_ssss_startstop(1);
#endif
#if (SSI_SENSOR_SELECT_AUDIO)
                sensor_audio_add();
                sensor_audio_startstop(1);
#endif
                    break;
                }
            }
        }
        else if (rx_avail == ssi_disconnect_string_len)
        {
            uart_rx_raw_buf(UART_ID_SSI, (uint8_t*) ssi_rxbuf, ssi_disconnect_string_len);
            if (strncmp(ssi_rxbuf, ssi_disconnect_string, ssi_disconnect_string_len) == 0)
            {
                is_ssi_connected = false;
#if (SSI_SENSOR_SELECT_SSSS)
                sensor_ssss_startstop(0);
#endif
#if (SSI_SENSOR_SELECT_AUDIO)
                sensor_audio_startstop(0);
#endif
            }
        }
        else
        {
            continue;
        }
    }
}

static int downSample = 0;

//#define STR_MODE true

void ssi_publish_sensor_data (uint8_t *p_source, int ilen) {
    if (is_ssi_connected)
    {
        //dbg_str_int("nr", nr);
        if (downSample++ % 50 == 0)
        {
            downSample = 1;

            wifiEspClick.uartEnable();
            wifiEspClick.ready();
#ifdef STR_MODE
            char command[100];
            int16_t val1 = *(p_source);
            int16_t val2 = *(p_source + 2);
            int16_t val3 = *(p_source + 4);
            int16_t val4 = *(p_source + 6);
            sprintf(command, "%d,%d,%d,%d\n", val1, val2, val3, val4);
            wifiEspClick.send(command);
#else
            wifiEspClick.send(p_source, ilen);
#endif
            wifiEspClick.uartDisable();
            pms_resetState();

        }
        //uart_tx_raw_buf(UART_ID_SSI, p_source, ilen);
    }
}

void ssi_publish_sensor_results(uint8_t* p_source, int ilen)
{
    dbg_str("pubr\n");
    if (is_ssi_connected)
    {
        //uart_tx_raw_buf(UART_ID_SSI, p_source, ilen);

        if (downSample++ % 50 == 0)
        {
            downSample = 1;

            wifiEspClick.uartEnable();
            wifiEspClick.ready();
#ifdef STR_MODE
            char command[100];
            int16_t val1 = *(p_source);
            int16_t val2 = *(p_source + 2);
            int16_t val3 = *(p_source + 4);
            int16_t val4 = *(p_source + 6);
            sprintf(command, "%d,%d,%d,%d\n", val1, val2, val3, val4);
            wifiEspClick.send(command);
#else
            wifiEspClick.send(p_source, ilen);
#endif
            wifiEspClick.uartDisable();
            pms_resetState();
        }
    }
}

signed portBASE_TYPE StartSimpleStreamingInterfaceTask(
    void)  // to remove warnings      uxPriority not used in the function
{
    static uint8_t ucParameterToPass;
    /* Create SSI Task */
    xTaskCreate(ssiTaskHandler,
                "SSITaskHandler",
                STACK_SIZE_ALLOC(STACK_SIZE_TASK_SSI),
                &ucParameterToPass,
                PRIORITY_TASK_SSI,
                &xHandleTaskSSI);
    configASSERT(xHandleTaskSSI);
    return pdPASS;
}
