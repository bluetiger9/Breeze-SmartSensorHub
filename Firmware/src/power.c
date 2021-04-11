#include "power.h"

#include "Fw_global_config.h"
#include "eoss3_hal_gpio.h"
#include "hal_fpga_gpioctrl.h"

/* power */
void power(Device device, bool enable) {
	switch (device) {
	case AQ:
		HAL_GPIO_Write(GPIO_PWR_AQ, enable);
		break;
	case UV:
		HAL_GPIO_Write(GPIO_PWR_UV, enable);
		break;
	case LH:
	    hal_fpga_gpioctrl_set_output(FGPIO_PWR_LH, enable);
		break;
	case COM:
		hal_fpga_gpioctrl_set_output(FGPIO_PWR_COM, enable);
		break;
	default:
		return;
	}
}

/* chip select */
void cs(Device device, bool enable) {
	switch (device) {
	case AQ:
		HAL_GPIO_Write(GPIO_CS_AQ, enable);
		break;
	case UV:
		HAL_GPIO_Write(GPIO_CS_UV, enable);
		break;
	case COM:
		HAL_GPIO_Write(GPIO_CS_COM, enable);
		break;
	case LH:
	default:
		return;
	}
}
