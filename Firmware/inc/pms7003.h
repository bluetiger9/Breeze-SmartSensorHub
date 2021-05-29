#ifndef PMS7003_H_
#define PMS7003_H_

#include <stdint.h>
#include <stdbool.h>


#ifdef __cplusplus
extern "C" {
#endif

#define UART_STRUCTS_VERSION 1

//class PMS
//{
//public:
static const uint16_t SINGLE_RESPONSE_TIME = 1000;
static const uint16_t TOTAL_RESPONSE_TIME = 1000 * 10;
static const uint16_t STEADY_RESPONSE_TIME = 1000 * 30;

static const uint16_t BAUD_RATE = 9600;

typedef struct DATA {
	// Standard Particles, CF=1
	uint16_t PM_SP_UG_1_0;
	uint16_t PM_SP_UG_2_5;
	uint16_t PM_SP_UG_10_0;

	// Atmospheric environment
	uint16_t PM_AE_UG_1_0;
	uint16_t PM_AE_UG_2_5;
	uint16_t PM_AE_UG_10_0;

	// Atmospheric environment
	uint16_t CNT_0_3;
	uint16_t CNT_0_5;
	uint16_t CNT_1_0;
	uint16_t CNT_2_5;
	uint16_t CNT_5_0;
	uint16_t CNT_10_0;

} DATA;

void pms_init(int);
void pms_sleep(void);
void pms_wakeUp(void);
void pms_activeMode(void);
void pms_passiveMode(void);

void pms_requestRead(void);
bool pms_read(DATA *data);
bool pms_readUntil(DATA *data, uint16_t timeout /*= SINGLE_RESPONSE_TIME*/);

DATA pms_getData(void);

void pms_processData(uint8_t ch);

bool pms_readData(void);

void pms_resetState();

//private:
typedef enum STATUS {
	STATUS_WAITING, STATUS_OK
} STATUS;
typedef enum MODE {
	MODE_ACTIVE, MODE_PASSIVE
} MODE;

static uint8_t _pms_payload[26];
static int _pms_uartId;
static DATA _pms_data;
static STATUS _pms_status;
static MODE _pms_mode = MODE_ACTIVE;

static uint8_t _pms_index = 0;
static uint16_t _pms_frameLen;
static uint16_t _pms_checksum;
static uint16_t _pms_calculatedChecksum;

void pms_loop(void);
//};

#ifdef __cplusplus
}
#endif

#endif
