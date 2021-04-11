#ifndef POWER_H_
#define POWER_H_

#include <stdbool.h>


#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	AQ, UV, LH, COM
} Device;

/* power */
void power(Device device, bool enable);

/* chip select */
void cs(Device device, bool enable);

#ifdef __cplusplus
}
#endif

#endif
