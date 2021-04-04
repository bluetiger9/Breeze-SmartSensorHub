EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR02
U 1 1 5F9A43C0
P 1400 3450
F 0 "#PWR02" H 1400 3200 50  0001 C CNN
F 1 "GND" H 1405 3277 50  0000 C CNN
F 2 "" H 1400 3450 50  0001 C CNN
F 3 "" H 1400 3450 50  0001 C CNN
	1    1400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3250 1400 3250
Wire Wire Line
	1400 3250 1400 3450
Wire Wire Line
	1500 2050 1400 2050
Connection ~ 1400 3250
Wire Wire Line
	2900 850  3050 850 
Wire Wire Line
	3050 850  3050 1700
$Comp
L power:GND #PWR03
U 1 1 5F9A5EDD
P 3050 1700
F 0 "#PWR03" H 3050 1450 50  0001 C CNN
F 1 "GND" H 3055 1527 50  0000 C CNN
F 2 "" H 3050 1700 50  0001 C CNN
F 3 "" H 3050 1700 50  0001 C CNN
	1    3050 1700
	1    0    0    -1  
$EndComp
NoConn ~ 2900 950 
NoConn ~ 2900 1050
NoConn ~ 2900 1550
NoConn ~ 1500 950 
NoConn ~ 1500 1050
NoConn ~ 1500 1750
NoConn ~ 1500 1950
NoConn ~ 1500 2150
NoConn ~ 1500 2250
NoConn ~ 1500 2650
NoConn ~ 2900 2650
NoConn ~ 2900 2750
NoConn ~ 2900 2950
NoConn ~ 2900 3050
$Comp
L Mechanical:MountingHole H1
U 1 1 5FAACA21
P 6250 7400
F 0 "H1" H 6350 7446 50  0000 L CNN
F 1 "MountingHole" H 6350 7355 50  0000 L CNN
F 2 "" H 6250 7400 50  0001 C CNN
F 3 "~" H 6250 7400 50  0001 C CNN
	1    6250 7400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5FAA78E4
P 6250 7150
F 0 "H2" H 6350 7196 50  0000 L CNN
F 1 "MountingHole" H 6350 7105 50  0000 L CNN
F 2 "" H 6250 7150 50  0001 C CNN
F 3 "~" H 6250 7150 50  0001 C CNN
	1    6250 7150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5FAAD684
P 6250 6900
F 0 "H3" H 6350 6946 50  0000 L CNN
F 1 "MountingHole" H 6350 6855 50  0000 L CNN
F 2 "" H 6250 6900 50  0001 C CNN
F 3 "~" H 6250 6900 50  0001 C CNN
	1    6250 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5FAB3473
P 6250 6650
F 0 "H4" H 6350 6696 50  0000 L CNN
F 1 "MountingHole" H 6350 6605 50  0000 L CNN
F 2 "" H 6250 6650 50  0001 C CNN
F 3 "~" H 6250 6650 50  0001 C CNN
	1    6250 6650
	1    0    0    -1  
$EndComp
Text Label 3500 3150 2    50   ~ 0
I2C_SCL_0
Wire Wire Line
	2900 3250 3500 3250
Text Label 3500 3250 2    50   ~ 0
I2C_SDA_0
NoConn ~ 1500 850 
Wire Wire Line
	900  3150 1500 3150
Text Label 900  3050 0    50   ~ 0
UART_RX
Text Label 900  2850 0    50   ~ 0
SPI_MOSI
Wire Wire Line
	900  2850 1500 2850
Text Label 900  2950 0    50   ~ 0
SPI_MISO
Wire Wire Line
	900  2950 1500 2950
Text Label 900  2750 0    50   ~ 0
SPI_CLK
Wire Wire Line
	900  2750 1500 2750
$Comp
L QuickFeather-Enviroment-Monitor:MikroBUS-Click J3
U 1 1 6047FB97
P 6150 2450
F 0 "J3" H 6350 1450 50  0000 C CNN
F 1 "Communication Module" H 6250 2550 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:MikroBUS-Medium" H 6150 2450 50  0001 C CNN
F 3 "" H 6150 2450 50  0001 C CNN
	1    6150 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6047FB9D
P 5800 3500
F 0 "#PWR0101" H 5800 3250 50  0001 C CNN
F 1 "GND" H 5805 3327 50  0000 C CNN
F 2 "" H 5800 3500 50  0001 C CNN
F 3 "" H 5800 3500 50  0001 C CNN
	1    5800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3300 5800 3500
Wire Wire Line
	5850 3300 5800 3300
$Comp
L power:GND #PWR0102
U 1 1 6047FBA5
P 6700 3500
F 0 "#PWR0102" H 6700 3250 50  0001 C CNN
F 1 "GND" H 6705 3327 50  0000 C CNN
F 2 "" H 6700 3500 50  0001 C CNN
F 3 "" H 6700 3500 50  0001 C CNN
	1    6700 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3300 6700 3500
Wire Wire Line
	6650 3300 6700 3300
NoConn ~ 6650 2600
NoConn ~ 5850 2600
$Comp
L QuickFeather-Enviroment-Monitor:MikroBUS-Click J4
U 1 1 60484152
P 9600 850
F 0 "J4" H 9800 -150 50  0000 C CNN
F 1 "Air Quality" H 9700 924 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:MikroBUS-Small" H 9600 850 50  0001 C CNN
F 3 "" H 9600 850 50  0001 C CNN
	1    9600 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60484158
P 9250 1900
F 0 "#PWR0103" H 9250 1650 50  0001 C CNN
F 1 "GND" H 9255 1727 50  0000 C CNN
F 2 "" H 9250 1900 50  0001 C CNN
F 3 "" H 9250 1900 50  0001 C CNN
	1    9250 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 1700 9250 1900
Wire Wire Line
	9300 1700 9250 1700
$Comp
L power:GND #PWR0104
U 1 1 60484160
P 10150 1900
F 0 "#PWR0104" H 10150 1650 50  0001 C CNN
F 1 "GND" H 10155 1727 50  0000 C CNN
F 2 "" H 10150 1900 50  0001 C CNN
F 3 "" H 10150 1900 50  0001 C CNN
	1    10150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1700 10150 1900
Wire Wire Line
	10100 1700 10150 1700
NoConn ~ 10100 1000
NoConn ~ 9300 1000
$Comp
L QuickFeather-Enviroment-Monitor:CJMCU-3935 J5
U 1 1 6049D376
P 9650 4000
F 0 "J5" H 10428 4042 50  0000 L CNN
F 1 "CJMCU-3935" H 10428 3951 50  0000 L CNN
F 2 "QuickFeather-Enviroment-Monitor:CJMCU-3935" H 9650 4000 50  0001 C CNN
F 3 "~" H 9650 4000 50  0001 C CNN
	1    9650 4000
	1    0    0    -1  
$EndComp
$Comp
L QuickFeather-Enviroment-Monitor:FPF1107 U1
U 1 1 604DF6E1
P 8800 4550
F 0 "U1" H 8900 4400 50  0000 C CNN
F 1 "FPF1107" H 8600 4400 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:BGA4C40P2X2_84X84X60N" H 8750 5100 50  0001 C CNN
F 3 "" H 8650 4650 50  0001 C CNN
	1    8800 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 604E0B94
P 9250 4750
F 0 "#PWR0105" H 9250 4500 50  0001 C CNN
F 1 "GND" H 9255 4577 50  0000 C CNN
F 2 "" H 9250 4750 50  0001 C CNN
F 3 "" H 9250 4750 50  0001 C CNN
	1    9250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 4600 9250 4600
Wire Wire Line
	9250 4600 9250 4750
Wire Wire Line
	9250 4600 9250 4400
Wire Wire Line
	9250 4400 9450 4400
Connection ~ 9250 4600
Wire Wire Line
	9450 3800 9200 3800
Text Label 9200 3800 2    50   ~ 0
INT_Lightning
Wire Wire Line
	9250 4400 9250 4000
Wire Wire Line
	9250 4000 9450 4000
Connection ~ 9250 4400
Wire Wire Line
	9450 4200 9200 4200
Text Label 9200 4200 2    50   ~ 0
SDA_Lightning
Wire Wire Line
	9450 4300 9200 4300
Text Label 9200 4300 2    50   ~ 0
SCL_Lightning
Wire Wire Line
	9350 3600 9350 3900
Wire Wire Line
	9350 3900 9450 3900
Wire Wire Line
	9350 3600 9450 3600
NoConn ~ 9450 3700
NoConn ~ 9450 4100
Text Label 8300 4600 2    50   ~ 0
PWR_Lightning
Wire Wire Line
	8500 4600 8300 4600
Wire Wire Line
	8300 4500 8500 4500
Wire Wire Line
	8300 4450 8300 4500
Connection ~ 5800 1700
Wire Wire Line
	5800 1700 5450 1700
Wire Wire Line
	5850 1600 5450 1600
Wire Wire Line
	4650 1550 4650 1600
Wire Wire Line
	4650 1600 4850 1600
Wire Wire Line
	4850 1700 4650 1700
Text Label 4650 1700 2    50   ~ 0
PWR_Click_UV
$Comp
L QuickFeather-Enviroment-Monitor:FPF1107 U3
U 1 1 6057E83D
P 5150 1650
F 0 "U3" H 5250 1500 50  0000 C CNN
F 1 "FPF1107" H 4950 1500 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:BGA4C40P2X2_84X84X60N" H 5100 2200 50  0001 C CNN
F 3 "" H 5000 1750 50  0001 C CNN
	1    5150 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1500 7150 1500
Wire Wire Line
	6650 1400 7150 1400
Wire Wire Line
	6650 1200 7150 1200
Wire Wire Line
	6650 1300 7150 1300
Wire Wire Line
	6650 1100 7150 1100
Wire Wire Line
	5650 1100 5850 1100
Text Label 5650 1100 2    50   ~ 0
RST_Click
Text Label 7150 1500 2    50   ~ 0
SDA_Click_UV
Text Label 7150 1400 2    50   ~ 0
SCL_Click_UV
Text Label 7150 1300 2    50   ~ 0
TX_Click_UV
Text Label 7150 1200 2    50   ~ 0
RX_Click_UV
Text Label 7150 1100 2    50   ~ 0
INT_Click_UV
NoConn ~ 5850 1000
NoConn ~ 6650 1000
Wire Wire Line
	6650 1700 6700 1700
Wire Wire Line
	6700 1700 6700 1900
$Comp
L power:GND #PWR04
U 1 1 6045449F
P 6700 1900
F 0 "#PWR04" H 6700 1650 50  0001 C CNN
F 1 "GND" H 6705 1727 50  0000 C CNN
F 2 "" H 6700 1900 50  0001 C CNN
F 3 "" H 6700 1900 50  0001 C CNN
	1    6700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1700 5800 1700
Wire Wire Line
	5800 1700 5800 1900
$Comp
L power:GND #PWR01
U 1 1 604538C1
P 5800 1900
F 0 "#PWR01" H 5800 1650 50  0001 C CNN
F 1 "GND" H 5805 1727 50  0000 C CNN
F 2 "" H 5800 1900 50  0001 C CNN
F 3 "" H 5800 1900 50  0001 C CNN
	1    5800 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 1700 8900 1700
Wire Wire Line
	9300 1600 9050 1600
Wire Wire Line
	8100 1600 8300 1600
Wire Wire Line
	8300 1700 8100 1700
Text Label 8100 1700 2    50   ~ 0
PWR_Click_AQ
$Comp
L QuickFeather-Enviroment-Monitor:FPF1107 U4
U 1 1 605AE53D
P 8600 1650
F 0 "U4" H 8700 1500 50  0000 C CNN
F 1 "FPF1107" H 8400 1500 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:BGA4C40P2X2_84X84X60N" H 8550 2200 50  0001 C CNN
F 3 "" H 8450 1750 50  0001 C CNN
	1    8600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1100 9300 1100
Text Label 9100 1100 2    50   ~ 0
RST_Click
Connection ~ 9250 1700
Wire Wire Line
	10100 1500 10600 1500
Wire Wire Line
	10100 1400 10600 1400
Wire Wire Line
	10100 1200 10600 1200
Wire Wire Line
	10100 1300 10600 1300
Wire Wire Line
	10100 1100 10600 1100
Text Label 10600 1500 2    50   ~ 0
SDA_Click_AQ
Text Label 10600 1400 2    50   ~ 0
SCL_Click_AQ
Text Label 10600 1300 2    50   ~ 0
TX_Click_AQ
Text Label 10600 1200 2    50   ~ 0
RX_Click_AQ
Text Label 10600 1100 2    50   ~ 0
INT_Click_AQ
Wire Wire Line
	5800 3300 5450 3300
Wire Wire Line
	5850 3200 5450 3200
Wire Wire Line
	4650 3150 4650 3200
Wire Wire Line
	4650 3200 4850 3200
Wire Wire Line
	4850 3300 4650 3300
Text Label 4650 3300 2    50   ~ 0
PWR_Click_COM
$Comp
L QuickFeather-Enviroment-Monitor:FPF1107 U5
U 1 1 605EAC6C
P 5150 3250
F 0 "U5" H 5250 3100 50  0000 C CNN
F 1 "FPF1107" H 4950 3100 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:BGA4C40P2X2_84X84X60N" H 5100 3800 50  0001 C CNN
F 3 "" H 5000 3350 50  0001 C CNN
	1    5150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2700 5850 2700
Text Label 5650 2700 2    50   ~ 0
RST_Click
Text Label 7250 3100 2    50   ~ 0
SDA_Click_COM
Text Label 7250 3000 2    50   ~ 0
SCL_Click_COM
Text Label 7250 2900 2    50   ~ 0
TX_Click_COM
Text Label 7250 2800 2    50   ~ 0
RX_Click_COM
Text Label 7250 2700 2    50   ~ 0
INT_Click_COM
Wire Wire Line
	6650 2700 7250 2700
Wire Wire Line
	6650 2800 7250 2800
Wire Wire Line
	6650 2900 7250 2900
Wire Wire Line
	6650 3000 7250 3000
Wire Wire Line
	6650 3100 7250 3100
Connection ~ 5800 3300
Wire Wire Line
	900  3050 1500 3050
Text Label 3500 2450 2    50   ~ 0
I2C_SCL_1
Wire Wire Line
	2900 2450 3500 2450
Text Label 3500 2350 2    50   ~ 0
I2C_SDA_1
Wire Wire Line
	3500 2350 2900 2350
Text Label 5250 1400 0    50   ~ 0
SPI_MISO
Wire Wire Line
	5250 1400 5850 1400
Text Label 5250 1500 0    50   ~ 0
SPI_MOSI
Wire Wire Line
	5250 1500 5850 1500
Text Label 5250 1300 0    50   ~ 0
SPI_CLK
Wire Wire Line
	5250 1300 5850 1300
Text Label 5250 1200 0    50   ~ 0
CS_Click_UV
Wire Wire Line
	5850 1200 5250 1200
Text Label 8700 1400 0    50   ~ 0
SPI_MISO
Wire Wire Line
	8700 1400 9300 1400
Text Label 8700 1500 0    50   ~ 0
SPI_MOSI
Wire Wire Line
	8700 1500 9300 1500
Text Label 8700 1300 0    50   ~ 0
SPI_CLK
Wire Wire Line
	8700 1300 9300 1300
Text Label 8700 1200 0    50   ~ 0
CS_Click_AQ
Wire Wire Line
	9300 1200 8700 1200
Text Label 5250 3000 0    50   ~ 0
SPI_MISO
Wire Wire Line
	5250 3000 5850 3000
Text Label 5250 3100 0    50   ~ 0
SPI_MOSI
Wire Wire Line
	5250 3100 5850 3100
Text Label 5250 2900 0    50   ~ 0
SPI_CLK
Wire Wire Line
	5250 2900 5850 2900
Text Label 5250 2800 0    50   ~ 0
CS_Click_COM
Wire Wire Line
	5850 2800 5250 2800
Wire Wire Line
	3500 3150 2900 3150
$Comp
L power:+3.3V #PWR0108
U 1 1 607F3FDF
P 4650 1550
F 0 "#PWR0108" H 4650 1400 50  0001 C CNN
F 1 "+3.3V" H 4665 1723 50  0000 C CNN
F 2 "" H 4650 1550 50  0001 C CNN
F 3 "" H 4650 1550 50  0001 C CNN
	1    4650 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 607F521C
P 8100 1600
F 0 "#PWR0109" H 8100 1450 50  0001 C CNN
F 1 "+3.3V" H 8115 1773 50  0000 C CNN
F 2 "" H 8100 1600 50  0001 C CNN
F 3 "" H 8100 1600 50  0001 C CNN
	1    8100 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 60802416
P 4650 3150
F 0 "#PWR0110" H 4650 3000 50  0001 C CNN
F 1 "+3.3V" H 4665 3323 50  0000 C CNN
F 2 "" H 4650 3150 50  0001 C CNN
F 3 "" H 4650 3150 50  0001 C CNN
	1    4650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1600 10250 1600
Wire Wire Line
	10250 1600 10250 1800
Wire Wire Line
	10250 1800 10350 1800
$Comp
L Regulator_Switching:TPS613222ADBV U2
U 1 1 6082C615
P 9700 2500
F 0 "U2" H 9700 2867 50  0000 C CNN
F 1 "TPS613222ADBV" H 9700 2776 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 9700 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61322.pdf" H 9700 2350 50  0001 C CNN
	1    9700 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L1
U 1 1 608415E3
P 9100 2400
F 0 "L1" V 9285 2400 50  0000 C CNN
F 1 "4.7uH" V 9194 2400 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 9100 2400 50  0001 C CNN
F 3 "~" H 9100 2400 50  0001 C CNN
	1    9100 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 2400 9250 2400
$Comp
L Device:C_Small C1
U 1 1 608512EC
P 10200 2600
F 0 "C1" H 10292 2646 50  0000 L CNN
F 1 "1u" H 10292 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10200 2600 50  0001 C CNN
F 3 "~" H 10200 2600 50  0001 C CNN
	1    10200 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 608552E0
P 9700 3000
F 0 "#PWR0115" H 9700 2750 50  0001 C CNN
F 1 "GND" H 9705 2827 50  0000 C CNN
F 2 "" H 9700 3000 50  0001 C CNN
F 3 "" H 9700 3000 50  0001 C CNN
	1    9700 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2800 9700 2900
Wire Wire Line
	9700 2900 10200 2900
Connection ~ 9700 2900
Wire Wire Line
	9700 2900 9700 3000
Wire Wire Line
	10200 2300 10200 2400
Text Label 900  3150 0    50   ~ 0
UART_TX
NoConn ~ 1500 1150
$Comp
L power:+BATT #PWR0119
U 1 1 60A343B9
P 3350 2050
F 0 "#PWR0119" H 3350 1900 50  0001 C CNN
F 1 "+BATT" H 3365 2223 50  0000 C CNN
F 2 "" H 3350 2050 50  0001 C CNN
F 3 "" H 3350 2050 50  0001 C CNN
	1    3350 2050
	1    0    0    -1  
$EndComp
$Comp
L QuickFeather-Enviroment-Monitor:QuickFeather J1
U 1 1 5F99F9F5
P 1600 3350
F 0 "J1" H 2550 3300 50  0000 C CNN
F 1 "QuickFeather" H 2200 6024 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:quickfeather" H 2200 6050 50  0001 C CNN
F 3 "" H 2200 6050 50  0001 C CNN
	1    1600 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2050 3350 2150
Wire Wire Line
	3350 2150 2900 2150
Text Label 900  2350 0    50   ~ 0
CS_Click_UV
Wire Wire Line
	1500 2350 900  2350
Text Label 3800 1350 2    50   ~ 0
CS_Click_AQ
Text Label 3800 1450 2    50   ~ 0
CS_Click_COM
Text Label 850  2450 0    50   ~ 0
INT_Click_UV
Wire Wire Line
	1400 2050 1400 3250
Text Label 850  2550 0    50   ~ 0
INT_Click_AQ
Wire Wire Line
	850  2550 1500 2550
Wire Wire Line
	850  2450 1500 2450
Text Label 3500 2250 2    50   ~ 0
INT_Click_COM
Wire Wire Line
	2900 2250 3500 2250
NoConn ~ 2900 2550
NoConn ~ 2900 2850
Text Label 3200 1250 0    50   ~ 0
INT_Lightning
Wire Wire Line
	3200 1250 2900 1250
Wire Wire Line
	2900 1350 3800 1350
Wire Wire Line
	2900 1450 3800 1450
Text Label 1200 1550 2    50   ~ 0
PWR_Click_COM
Text Label 1200 1450 2    50   ~ 0
PWR_Click_AQ
Text Label 1200 1350 2    50   ~ 0
PWR_Click_UV
Text Label 1200 1250 2    50   ~ 0
PWR_Lightning
Wire Wire Line
	1500 1250 1200 1250
Wire Wire Line
	1200 1350 1500 1350
Wire Wire Line
	1500 1450 1200 1450
Wire Wire Line
	1200 1550 1500 1550
$Comp
L QuickFeather-Enviroment-Monitor:MikroBUS-Click J2
U 1 1 60C1BB51
P 6150 850
F 0 "J2" H 6250 1015 50  0000 C CNN
F 1 "UV CLick 3" H 6250 924 50  0000 C CNN
F 2 "QuickFeather-Enviroment-Monitor:MikroBUS-Small" H 6150 850 50  0001 C CNN
F 3 "" H 6150 850 50  0001 C CNN
	1    6150 850 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 60C262BC
P 9250 2500
F 0 "#FLG0103" H 9250 2575 50  0001 C CNN
F 1 "PWR_FLAG" H 9300 2650 50  0000 C CNN
F 2 "" H 9250 2500 50  0001 C CNN
F 3 "~" H 9250 2500 50  0001 C CNN
	1    9250 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9250 2500 9250 2400
Connection ~ 9250 2400
Wire Wire Line
	9250 2400 9300 2400
Wire Wire Line
	2900 1150 3200 1150
Text Label 3200 1150 0    50   ~ 0
RST_Click
Wire Wire Line
	1500 1850 1000 1850
Wire Wire Line
	1000 1850 1000 1800
$Comp
L power:+3.3V #PWR0120
U 1 1 6128B2A9
P 1000 1800
F 0 "#PWR0120" H 1000 1650 50  0001 C CNN
F 1 "+3.3V" H 1015 1973 50  0000 C CNN
F 2 "" H 1000 1800 50  0001 C CNN
F 3 "" H 1000 1800 50  0001 C CNN
	1    1000 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 6129DA4D
P 8300 4450
F 0 "#PWR0107" H 8300 4300 50  0001 C CNN
F 1 "+3.3V" H 8315 4623 50  0000 C CNN
F 2 "" H 8300 4450 50  0001 C CNN
F 3 "" H 8300 4450 50  0001 C CNN
	1    8300 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2400 10200 2400
Connection ~ 10200 2400
Wire Wire Line
	10200 2500 10200 2400
Wire Wire Line
	10200 2700 10200 2900
Wire Wire Line
	9100 4500 9350 4500
Wire Wire Line
	9450 3500 9350 3500
Wire Wire Line
	9350 3500 9350 3600
Connection ~ 9350 3600
Wire Wire Line
	9350 3900 9350 4500
Connection ~ 9350 3900
Connection ~ 9350 4500
Wire Wire Line
	9350 4500 9450 4500
Wire Wire Line
	9000 2400 8900 2400
Wire Wire Line
	8900 2400 8900 1950
Wire Wire Line
	8900 1950 9050 1950
Wire Wire Line
	9050 1950 9050 1600
Connection ~ 9050 1600
Wire Wire Line
	9050 1600 8900 1600
Wire Wire Line
	10200 2300 10350 2300
Wire Wire Line
	10350 2300 10350 1800
NoConn ~ 6650 3200
NoConn ~ 6650 1600
$Comp
L Mechanical:MountingHole H6
U 1 1 610F6A49
P 6250 6400
F 0 "H6" H 6350 6446 50  0000 L CNN
F 1 "MountingHole" H 6350 6355 50  0000 L CNN
F 2 "" H 6250 6400 50  0001 C CNN
F 3 "~" H 6250 6400 50  0001 C CNN
	1    6250 6400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 610F6A4F
P 6250 6150
F 0 "H5" H 6350 6196 50  0000 L CNN
F 1 "MountingHole" H 6350 6105 50  0000 L CNN
F 2 "" H 6250 6150 50  0001 C CNN
F 3 "~" H 6250 6150 50  0001 C CNN
	1    6250 6150
	1    0    0    -1  
$EndComp
$Comp
L Graphic:Logo_Open_Hardware_Small #LOGO?
U 1 1 6110E994
P 7300 6850
F 0 "#LOGO?" H 7300 7125 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 7300 6625 50  0001 C CNN
F 2 "" H 7300 6850 50  0001 C CNN
F 3 "~" H 7300 6850 50  0001 C CNN
	1    7300 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 6800 3500 6900
Connection ~ 3500 6800
Wire Wire Line
	2900 6800 3500 6800
Wire Wire Line
	2900 6700 2900 6800
Wire Wire Line
	3500 6600 3500 6800
Wire Wire Line
	3750 7050 3950 7050
Wire Wire Line
	3750 6800 3750 7050
Wire Wire Line
	3900 6800 3750 6800
Wire Wire Line
	3900 6400 3900 6800
Wire Wire Line
	2900 6400 2900 6500
Wire Wire Line
	3100 6400 2900 6400
Connection ~ 1950 6700
Wire Wire Line
	1800 6700 1800 6800
Wire Wire Line
	2350 6700 2350 6600
Wire Wire Line
	1950 6700 2350 6700
Connection ~ 1800 6700
Wire Wire Line
	1950 6700 1950 6600
Wire Wire Line
	1800 6700 1950 6700
Wire Wire Line
	1700 6700 1800 6700
Connection ~ 1700 6700
Wire Wire Line
	1700 6600 1700 6700
Wire Wire Line
	2350 6200 2750 6200
Connection ~ 2350 6200
Wire Wire Line
	2350 6400 2350 6200
$Comp
L Device:D_Zener_Small D2
U 1 1 60D77906
P 2350 6500
F 0 "D2" V 2304 6570 50  0000 L CNN
F 1 "6.xV" V 2395 6570 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" V 2350 6500 50  0001 C CNN
F 3 "~" V 2350 6500 50  0001 C CNN
	1    2350 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 5950 3000 6200
Wire Wire Line
	3500 5950 3500 6000
Wire Wire Line
	3500 5950 3000 5950
$Comp
L Battery_Management:MCP73831-2-OT U6
U 1 1 60CF3EB8
P 3500 6300
F 0 "U6" H 3350 6550 50  0000 C CNN
F 1 "MCP73831-2" H 3800 6550 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3550 6050 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 3350 6250 50  0001 C CNN
	1    3500 6300
	1    0    0    -1  
$EndComp
Text Label 2100 6200 0    50   ~ 0
Solar+
$Comp
L power:+BATT #PWR0117
U 1 1 614B98CD
P 4600 7050
F 0 "#PWR0117" H 4600 6900 50  0001 C CNN
F 1 "+BATT" H 4615 7223 50  0000 C CNN
F 2 "" H 4600 7050 50  0001 C CNN
F 3 "" H 4600 7050 50  0001 C CNN
	1    4600 7050
	-1   0    0    -1  
$EndComp
Connection ~ 1950 6200
Wire Wire Line
	1950 6200 2350 6200
Connection ~ 1700 6200
Wire Wire Line
	1950 6200 1700 6200
Wire Wire Line
	1950 6400 1950 6200
Wire Wire Line
	1700 6200 1350 6200
Wire Wire Line
	1700 6400 1700 6200
Wire Wire Line
	1350 6700 1700 6700
Wire Wire Line
	1350 6300 1350 6700
$Comp
L Device:C_Small C5
U 1 1 613D94FB
P 1950 6500
F 0 "C5" H 1858 6546 50  0000 R CNN
F 1 "10u" H 1858 6455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1950 6500 50  0001 C CNN
F 3 "~" H 1950 6500 50  0001 C CNN
	1    1950 6500
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP_Small C4
U 1 1 613C5B89
P 1700 6500
F 0 "C4" H 1500 6550 50  0000 L CNN
F 1 "100u" H 1500 6400 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 1700 6500 50  0001 C CNN
F 3 "~" H 1700 6500 50  0001 C CNN
	1    1700 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 6200 3000 6200
Connection ~ 2750 6200
Wire Wire Line
	2750 6150 2750 6200
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 6124767E
P 2750 6150
F 0 "#FLG0105" H 2750 6225 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 6323 50  0000 C CNN
F 2 "" H 2750 6150 50  0001 C CNN
F 3 "~" H 2750 6150 50  0001 C CNN
	1    2750 6150
	1    0    0    -1  
$EndComp
Connection ~ 4800 6550
Wire Wire Line
	5100 6550 4800 6550
Wire Wire Line
	5100 6750 5100 6550
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 611F4741
P 5100 6750
F 0 "#FLG0102" H 5100 6825 50  0001 C CNN
F 1 "PWR_FLAG" H 5100 6923 50  0000 C CNN
F 2 "" H 5100 6750 50  0001 C CNN
F 3 "~" H 5100 6750 50  0001 C CNN
	1    5100 6750
	-1   0    0    1   
$EndComp
Connection ~ 4800 6200
Wire Wire Line
	4800 6200 4250 6200
$Comp
L power:GND #PWR06
U 1 1 60F4832B
P 1800 6800
F 0 "#PWR06" H 1800 6550 50  0001 C CNN
F 1 "GND" H 1805 6627 50  0000 C CNN
F 2 "" H 1800 6800 50  0001 C CNN
F 3 "" H 1800 6800 50  0001 C CNN
	1    1800 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6450 4250 6500
Connection ~ 4250 6200
Wire Wire Line
	4250 6200 4250 6250
$Comp
L Device:C_Small C3
U 1 1 60E87DC6
P 4250 6350
F 0 "C3" H 4158 6396 50  0000 R CNN
F 1 "10u" H 4158 6305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4250 6350 50  0001 C CNN
F 3 "~" H 4250 6350 50  0001 C CNN
	1    4250 6350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3900 6200 4250 6200
Wire Wire Line
	4250 6150 4250 6200
$Comp
L power:+BATT #PWR08
U 1 1 60E51006
P 4250 6150
F 0 "#PWR08" H 4250 6000 50  0001 C CNN
F 1 "+BATT" H 4265 6323 50  0000 C CNN
F 2 "" H 4250 6150 50  0001 C CNN
F 3 "" H 4250 6150 50  0001 C CNN
	1    4250 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 60E19074
P 4250 6500
F 0 "#PWR09" H 4250 6250 50  0001 C CNN
F 1 "GND" H 4255 6327 50  0000 C CNN
F 2 "" H 4250 6500 50  0001 C CNN
F 3 "" H 4250 6500 50  0001 C CNN
	1    4250 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 60DE4874
P 3500 6900
F 0 "#PWR07" H 3500 6650 50  0001 C CNN
F 1 "GND" H 3505 6727 50  0000 C CNN
F 2 "" H 3500 6900 50  0001 C CNN
F 3 "" H 3500 6900 50  0001 C CNN
	1    3500 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 60DA6A7D
P 2900 6600
F 0 "R5" H 3000 6600 50  0000 C CNN
F 1 "7k" H 3000 6500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2900 6600 50  0001 C CNN
F 3 "~" H 2900 6600 50  0001 C CNN
	1    2900 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 7050 4300 7050
$Comp
L Device:R_Small R3
U 1 1 60D48FBB
P 4050 7050
F 0 "R3" V 3950 6950 50  0000 C CNN
F 1 "220" V 3950 7150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4050 7050 50  0001 C CNN
F 3 "~" H 4050 7050 50  0001 C CNN
	1    4050 7050
	0    -1   1    0   
$EndComp
Wire Wire Line
	4600 7050 4500 7050
$Comp
L Device:LED_Small D1
U 1 1 60CE39F9
P 4400 7050
F 0 "D1" H 4350 6950 50  0000 C CNN
F 1 "LED_Small" H 4400 6934 50  0001 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 4400 7050 50  0001 C CNN
F 3 "~" V 4400 7050 50  0001 C CNN
	1    4400 7050
	1    0    0    1   
$EndComp
Wire Wire Line
	4800 6200 4800 6250
Wire Wire Line
	5200 6200 4800 6200
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 60CA6298
P 5200 6200
F 0 "#FLG0104" H 5200 6275 50  0001 C CNN
F 1 "PWR_FLAG" H 5200 6373 50  0000 C CNN
F 2 "" H 5200 6200 50  0001 C CNN
F 3 "~" H 5200 6200 50  0001 C CNN
	1    5200 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6600 4800 6550
$Comp
L power:GND #PWR0118
U 1 1 60A32762
P 4800 6600
F 0 "#PWR0118" H 4800 6350 50  0001 C CNN
F 1 "GND" H 4805 6427 50  0000 C CNN
F 2 "" H 4800 6600 50  0001 C CNN
F 3 "" H 4800 6600 50  0001 C CNN
	1    4800 6600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 604BF75D
P 1150 6200
F 0 "J6" H 1100 6150 50  0000 R CNN
F 1 "SolarPanel" H 1300 6050 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1150 6200 50  0001 C CNN
F 3 "~" H 1150 6200 50  0001 C CNN
	1    1150 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 60487964
P 4800 6450
F 0 "BT1" H 4918 6546 50  0000 L CNN
F 1 "Battery_Cell" H 4918 6455 50  0000 L CNN
F 2 "Battery:BatteryHolder_Keystone_1042_1x18650" V 4800 6510 50  0001 C CNN
F 3 "~" V 4800 6510 50  0001 C CNN
	1    4800 6450
	1    0    0    -1  
$EndComp
Connection ~ 1950 4500
Wire Wire Line
	1950 4250 2300 4250
Wire Wire Line
	1950 4250 1950 4500
Connection ~ 2100 4600
Wire Wire Line
	2100 4350 2300 4350
Wire Wire Line
	2100 4350 2100 4600
Text Label 2300 4250 0    50   ~ 0
SCL_Lightning
Text Label 2300 4350 0    50   ~ 0
SDA_Lightning
Connection ~ 1800 5000
Wire Wire Line
	1850 5000 1800 5000
Wire Wire Line
	1850 4750 1850 5000
Wire Wire Line
	1700 4750 1850 4750
Wire Wire Line
	1700 4600 1700 4750
Wire Wire Line
	1550 4600 1700 4600
Wire Wire Line
	1800 5000 1800 5150
Connection ~ 1800 4650
Wire Wire Line
	1800 4500 1800 4650
Wire Wire Line
	1550 4500 1800 4500
$Comp
L Device:R_Small R2
U 1 1 606F2200
P 1450 4600
F 0 "R2" V 1550 4600 50  0000 C CNN
F 1 "nc" V 1550 4650 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 1450 4600 50  0001 C CNN
F 3 "~" H 1450 4600 50  0001 C CNN
	1    1450 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 606ED256
P 1450 4500
F 0 "R1" V 1346 4500 50  0000 C CNN
F 1 "nc" V 1345 4500 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 1450 4500 50  0001 C CNN
F 3 "~" H 1450 4500 50  0001 C CNN
	1    1450 4500
	0    1    1    0   
$EndComp
Text Label 1350 4600 2    50   ~ 0
I2C_SDA_1
Text Label 1350 4500 2    50   ~ 0
I2C_SCL_1
Wire Wire Line
	1800 5000 1700 5000
Wire Wire Line
	1700 4900 1800 4900
Wire Wire Line
	1800 4900 1800 4650
Wire Wire Line
	1950 4650 1950 4750
Connection ~ 1950 4650
Wire Wire Line
	1800 4650 1950 4650
Wire Wire Line
	1950 4500 1950 4650
Connection ~ 2100 4850
Wire Wire Line
	2100 4600 2750 4600
Wire Wire Line
	2100 4850 2100 4600
Wire Wire Line
	2100 5150 2850 5150
Connection ~ 2100 5150
Wire Wire Line
	2100 4850 2750 4850
Wire Wire Line
	2100 5150 2100 4850
Wire Wire Line
	1800 5150 2100 5150
Connection ~ 1950 4750
Wire Wire Line
	1950 5050 2850 5050
Wire Wire Line
	1950 4750 1950 5050
Wire Wire Line
	1950 4750 2750 4750
Wire Wire Line
	1950 4500 2750 4500
Text Label 2850 5050 2    50   ~ 0
SCL_Click_COM
Text Label 2850 5150 2    50   ~ 0
SDA_Click_COM
Text Label 2750 4750 2    50   ~ 0
SCL_Click_AQ
Text Label 2750 4850 2    50   ~ 0
SDA_Click_AQ
Text Label 2750 4500 2    50   ~ 0
SCL_Click_UV
Text Label 2750 4600 2    50   ~ 0
SDA_Click_UV
Text Label 1700 5000 2    50   ~ 0
I2C_SDA_0
Text Label 1700 4900 2    50   ~ 0
I2C_SCL_0
Wire Wire Line
	4400 4750 4400 4450
Wire Wire Line
	4400 4750 4900 4750
Connection ~ 4400 4750
Wire Wire Line
	4400 4750 4400 5050
Wire Wire Line
	3500 4750 4400 4750
Wire Wire Line
	4250 4950 5000 4950
Wire Wire Line
	4250 4650 4250 4950
Connection ~ 4250 4650
Wire Wire Line
	4250 4650 4900 4650
Wire Wire Line
	3500 4650 4250 4650
Wire Wire Line
	4250 4350 4900 4350
Wire Wire Line
	4250 4650 4250 4350
Text Label 3500 4750 0    50   ~ 0
UART_TX
Text Label 3500 4650 0    50   ~ 0
UART_RX
Text Label 4900 4350 2    50   ~ 0
RX_Click_UV
Text Label 4900 4450 2    50   ~ 0
TX_Click_UV
Wire Wire Line
	4400 4450 4900 4450
Text Label 4900 4650 2    50   ~ 0
RX_Click_AQ
Text Label 4900 4750 2    50   ~ 0
TX_Click_AQ
Text Label 5000 4950 2    50   ~ 0
RX_Click_COM
Wire Wire Line
	5000 5050 4400 5050
Text Label 5000 5050 2    50   ~ 0
TX_Click_COM
NoConn ~ 9850 5150
$EndSCHEMATC