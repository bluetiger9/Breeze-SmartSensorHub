#include "delay.h"

void delay(unsigned long millis) {
	HAL_DelayUSec(1000*millis);
}

