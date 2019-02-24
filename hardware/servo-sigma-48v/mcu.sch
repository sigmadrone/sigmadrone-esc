EESchema Schematic File Version 4
LIBS:servo-sigma-48v-cache
EELAYER 26 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 4 4
Title "Servo Driver 48V"
Date "2018-09-03"
Rev "1.0"
Comp "Sigmadrone"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3700 13550 3    60   ~ 0
LED_WARN
Text Label 3250 15450 1    60   ~ 0
LED_STATUS
$Comp
L servo-sigma-48v-rescue:LED-device D1
U 1 1 5AB8EC78
P 3250 14300
F 0 "D1" H 3250 14400 50  0000 C CNN
F 1 "GREEN" H 3250 14200 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 3250 14300 50  0001 C CNN
F 3 "http://katalog.we-online.de/led/datasheet/150060GS75000.pdf" H 3250 14300 50  0001 C CNN
F 4 "732-4971-1-ND" H 3250 14300 60  0001 C CNN "Part"
F 5 "DigiKey" H 3250 14300 60  0001 C CNN "Provider"
	1    3250 14300
	0    -1   -1   0   
$EndComp
$Comp
L servo-sigma-48v-rescue:LED-device D4
U 1 1 5AB8EC79
P 3700 14300
F 0 "D4" H 3700 14400 50  0000 C CNN
F 1 "RED" H 3700 14200 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 3700 14300 50  0001 C CNN
F 3 "http://katalog.we-online.de/led/datasheet/150060RS75000.pdf" H 3700 14300 50  0001 C CNN
F 4 "732-4978-1-ND" H 3700 14300 60  0001 C CNN "Part"
F 5 "DigiKey" H 3700 14300 60  0001 C CNN "Provider"
	1    3700 14300
	0    -1   -1   0   
$EndComp
$Comp
L servo-sigma-48v-rescue:R-device R4
U 1 1 5AB8EC7A
P 3700 14750
F 0 "R4" V 3780 14750 50  0000 C CNN
F 1 "2.2k" V 3700 14750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3630 14750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 3700 14750 50  0001 C CNN
F 4 "RMCF0603JT2K20CT-ND" V 3700 14750 60  0001 C CNN "Part"
F 5 "DigiKey" V 3700 14750 60  0001 C CNN "Provider"
	1    3700 14750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5AB8EC7B
P 3700 15300
F 0 "#PWR01" H 3700 15050 50  0001 C CNN
F 1 "GND" H 3700 15150 50  0000 C CNN
F 2 "" H 3700 15300 50  0001 C CNN
F 3 "" H 3700 15300 50  0001 C CNN
	1    3700 15300
	1    0    0    -1  
$EndComp
$Comp
L servo-sigma-48v-rescue:CONN_02X05-conn J2
U 1 1 5AB8EC7C
P 2600 1400
F 0 "J2" H 2600 1700 50  0000 C CNN
F 1 "CONN_02X05" H 2600 1050 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical" H 2600 200 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/6220xx21121.pdf" H 2600 200 50  0001 C CNN
F 4 "732-5374-ND" H 2600 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 2600 1400 60  0001 C CNN "Provider"
	1    2600 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 58D0728C
P 1150 1300
F 0 "#PWR02" H 1150 1050 50  0001 C CNN
F 1 "GND" H 1150 1150 50  0000 C CNN
F 2 "" H 1150 1300 50  0001 C CNN
F 3 "" H 1150 1300 50  0001 C CNN
	1    1150 1300
	0    1    1    0   
$EndComp
Text Label 3500 1200 2    60   ~ 0
PA13
Text Label 3900 1200 2    60   ~ 0
SWDIO
Text Label 3500 1300 2    60   ~ 0
PA14
Text Label 3900 1300 2    60   ~ 0
SWCLK
Text Label 3900 1600 2    60   ~ 0
NRST
Text Label 3500 1400 2    60   ~ 0
PB3
Text Notes 1600 1800 0    60   ~ 0
SWD Interface
$Comp
L servo-sigma-48v-rescue:R-device R1
U 1 1 5AB8EC7E
P 3250 14750
F 0 "R1" V 3330 14750 50  0000 C CNN
F 1 "2.2k" V 3250 14750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3180 14750 50  0001 C CNN
F 3 "https://www.seielect.com/Catalog/SEI-RMCF_RMCP.pdf" H 3250 14750 50  0001 C CNN
F 4 "RMCF0603JT2K20CT-ND" V 3250 14750 60  0001 C CNN "Part"
F 5 "DigiKey" V 3250 14750 60  0001 C CNN "Provider"
	1    3250 14750
	-1   0    0    1   
$EndComp
Text Label 17850 5150 2    60   ~ 0
PB0
Text Label 17850 5250 2    60   ~ 0
PB1
Text Label 17850 5350 2    60   ~ 0
PB2
Text Label 17850 5450 2    60   ~ 0
PB3
Text Label 17850 5550 2    60   ~ 0
PB4
Text Label 17850 5650 2    60   ~ 0
PB5
Text Label 17850 5750 2    60   ~ 0
PB6
Text Label 17850 5850 2    60   ~ 0
PB7
Text Label 17850 5950 2    60   ~ 0
PB8
Text Label 17850 6050 2    60   ~ 0
PB9
Text Label 17850 6150 2    60   ~ 0
PB10
Text Label 17850 6350 2    60   ~ 0
PB12
Text Label 17850 6450 2    60   ~ 0
PB13
Text Label 17850 6550 2    60   ~ 0
PB14
Text Label 17850 6650 2    60   ~ 0
PB15
Text Label 17850 3450 2    60   ~ 0
PA0
Text Label 17850 3550 2    60   ~ 0
PA1
Text Label 17850 3650 2    60   ~ 0
PA2
Text Label 17850 3750 2    60   ~ 0
PA3
Text Label 17850 3850 2    60   ~ 0
PA4
Text Label 17850 3950 2    60   ~ 0
PA5
Text Label 17850 4050 2    60   ~ 0
PA6
Text Label 17850 4150 2    60   ~ 0
PA7
Text Label 17850 4250 2    60   ~ 0
PA8
Text Label 17850 4350 2    60   ~ 0
PA9
Text Label 17850 4450 2    60   ~ 0
PA10
Text Label 17850 4550 2    60   ~ 0
PA11
Text Label 17850 4650 2    60   ~ 0
PA12
Text Label 17850 4750 2    60   ~ 0
PA13
Text Label 17850 4850 2    60   ~ 0
PA14
Text Label 17850 4950 2    60   ~ 0
PA15
Text Label 17850 6850 2    60   ~ 0
PC0
Text Label 17850 6950 2    60   ~ 0
PC1
Text Label 17850 7050 2    60   ~ 0
PC2
Text Label 17850 7150 2    60   ~ 0
PC3
Text Label 17850 7250 2    60   ~ 0
PC4
Text Label 17850 7350 2    60   ~ 0
PC5
Text Label 17850 7450 2    60   ~ 0
PC6
Text Label 17850 7550 2    60   ~ 0
PC7
Text Label 17850 7650 2    60   ~ 0
PC8
Text Label 17850 7750 2    60   ~ 0
PC9
Text Label 17850 7850 2    60   ~ 0
PC10
Text Label 17850 7950 2    60   ~ 0
PC11
Text Label 17850 8050 2    60   ~ 0
PC12
Text Label 17850 8150 2    60   ~ 0
PC13
$Comp
L servo-sigma-48v-rescue:Crystal-device Y1
U 1 1 58ED7267
P 6000 5050
F 0 "Y1" H 6000 5200 50  0000 C CNN
F 1 "ABM3-8.000MHZ-D2Y-T" H 6000 4900 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_Abracon_ABM3-2Pin_5.0x3.2mm" H 6000 5050 50  0001 C CNN
F 3 "http://www.abracon.com/Resonators/abm3.pdf" H 6000 5050 50  0001 C CNN
F 4 "535-10630-1-ND" H 6000 5050 60  0001 C CNN "Part"
F 5 "DigiKey" H 6000 5050 60  0001 C CNN "Provider"
	1    6000 5050
	0    1    1    0   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C27
U 1 1 58EFF4C6
P 5500 4850
F 0 "C27" V 5450 4950 50  0000 C CNN
F 1 "27pF/50V/1%" V 5650 4850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5538 4700 50  0001 C CNN
F 3 "http://search.murata.co.jp/Ceramy/image/img/A01X/partnumbering_e_01.pdf" H 5500 4850 50  0001 C CNN
F 4 "490-9719-1-ND" V 5500 4850 60  0001 C CNN "Part"
F 5 "DigiKey" V 5500 4850 60  0001 C CNN "Provider"
	1    5500 4850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5AB8EC81
P 4900 4850
F 0 "#PWR04" H 4900 4600 50  0001 C CNN
F 1 "GND" H 4900 4700 50  0000 C CNN
F 2 "" H 4900 4850 50  0001 C CNN
F 3 "" H 4900 4850 50  0001 C CNN
	1    4900 4850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 58F00797
P 4900 5250
F 0 "#PWR05" H 4900 5000 50  0001 C CNN
F 1 "GND" H 4900 5100 50  0000 C CNN
F 2 "" H 4900 5250 50  0001 C CNN
F 3 "" H 4900 5250 50  0001 C CNN
	1    4900 5250
	0    1    1    0   
$EndComp
Text Label 9300 2100 2    60   ~ 0
NRST
$Comp
L power:GND #PWR010
U 1 1 5AB8EC85
P 7600 2800
F 0 "#PWR010" H 7600 2550 50  0001 C CNN
F 1 "GND" H 7600 2650 50  0000 C CNN
F 2 "" H 7600 2800 50  0001 C CNN
F 3 "" H 7600 2800 50  0001 C CNN
	1    7600 2800
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:R-device R19
U 1 1 58F146B9
P 7600 3200
F 0 "R19" V 7680 3200 50  0000 C CNN
F 1 "10k" V 7600 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7530 3200 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 7600 3200 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 7600 3200 60  0001 C CNN "Part"
F 5 "DigiKey" V 7600 3200 60  0001 C CNN "Provider"
	1    7600 3200
	-1   0    0    1   
$EndComp
$Comp
L sigmadrone:FB_SMT FB1
U 1 1 5AB8EC87
P 5650 3950
F 0 "FB1" H 5650 4050 50  0000 C CNN
F 1 "BEAD/0.6OHM/0.2A/2.2 kOhm @ 100MHz" H 5650 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5650 3850 30  0001 C CNN
F 3 "http://katalog.we-online.de/pbs/datasheet/742792093.pdf" H 5700 3950 60  0001 C CNN
F 4 "0805" H 5650 3950 25  0001 C CNN "SMT"
F 5 "732-1609-1-ND" H 5650 3800 30  0001 C CNN "Part"
F 6 "DigiKey" H 5650 3750 30  0001 C CNN "Provider"
	1    5650 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5AB8EC8B
P 6750 2800
F 0 "#PWR016" H 6750 2550 50  0001 C CNN
F 1 "GND" H 6750 2650 50  0000 C CNN
F 2 "" H 6750 2800 50  0001 C CNN
F 3 "" H 6750 2800 50  0001 C CNN
	1    6750 2800
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C25
U 1 1 5AB8EC8C
P 12350 1400
F 0 "C25" H 12200 1300 50  0000 L CNN
F 1 "100nF 50V" H 11900 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 12388 1250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 12350 1400 50  0001 C CNN
F 4 "490-4779-2-ND" H 12350 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 12350 1400 60  0001 C CNN "Provider"
	1    12350 1400
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C24
U 1 1 58F1C379
P 12900 1400
F 0 "C24" H 12750 1300 50  0000 L CNN
F 1 "100nF 50V" H 12450 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 12938 1250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 12900 1400 50  0001 C CNN
F 4 "490-4779-2-ND" H 12900 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 12900 1400 60  0001 C CNN "Provider"
	1    12900 1400
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C19
U 1 1 58F1C405
P 13450 1400
F 0 "C19" H 13300 1300 50  0000 L CNN
F 1 "100nF 50V" H 13000 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 13488 1250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 13450 1400 50  0001 C CNN
F 4 "490-4779-2-ND" H 13450 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 13450 1400 60  0001 C CNN "Provider"
	1    13450 1400
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C14
U 1 1 5AB8EC8F
P 14050 1400
F 0 "C14" H 13900 1300 50  0000 L CNN
F 1 "100nF 50V" H 13600 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 14088 1250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 14050 1400 50  0001 C CNN
F 4 "490-4779-2-ND" H 14050 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 14050 1400 60  0001 C CNN "Provider"
	1    14050 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5AB8EC92
P 12750 9100
F 0 "#PWR019" H 12750 8850 50  0001 C CNN
F 1 "GND" H 12750 8950 50  0000 C CNN
F 2 "" H 12750 9100 50  0001 C CNN
F 3 "" H 12750 9100 50  0001 C CNN
	1    12750 9100
	1    0    0    -1  
$EndComp
Text Label 8050 7050 0    60   ~ 0
PD2
$Comp
L power:PWR_FLAG #FLG020
U 1 1 58F21458
P 8350 4300
F 0 "#FLG020" H 8350 4375 50  0001 C CNN
F 1 "PWR_FLAG" H 8350 4474 50  0000 C CNN
F 2 "" H 8350 4300 50  0001 C CNN
F 3 "" H 8350 4300 50  0001 C CNN
	1    8350 4300
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG021
U 1 1 58F217D5
P 6750 3850
F 0 "#FLG021" H 6750 3925 50  0001 C CNN
F 1 "PWR_FLAG" H 6750 4024 50  0000 C CNN
F 2 "" H 6750 3850 50  0001 C CNN
F 3 "" H 6750 3850 50  0001 C CNN
	1    6750 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 58F52F40
P 13450 2000
F 0 "#PWR022" H 13450 1750 50  0001 C CNN
F 1 "GND" H 13450 1850 50  0000 C CNN
F 2 "" H 13450 2000 50  0001 C CNN
F 3 "" H 13450 2000 50  0001 C CNN
	1    13450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 14450 3250 14600
Wire Wire Line
	3700 15300 3700 14900
Wire Wire Line
	3700 14600 3700 14450
Wire Wire Line
	3250 14900 3250 15450
Wire Wire Line
	3700 13550 3700 14150
Wire Wire Line
	3250 13750 3250 14150
Wire Wire Line
	2350 1300 1150 1300
Wire Wire Line
	2350 1400 2250 1400
Wire Wire Line
	1150 1600 1950 1600
Wire Wire Line
	1150 1200 2350 1200
Wire Wire Line
	2850 1200 3900 1200
Wire Wire Line
	2850 1300 3900 1300
Wire Wire Line
	2850 1400 2950 1400
Wire Wire Line
	2850 1600 3900 1600
Wire Wire Line
	17850 4750 17450 4750
Wire Wire Line
	17850 4850 17450 4850
Wire Wire Line
	17450 7750 17850 7750
Wire Wire Line
	17450 8150 17850 8150
Wire Wire Line
	5650 4850 6000 4850
Wire Wire Line
	6000 5200 6000 5250
Connection ~ 6000 4850
Connection ~ 6000 5250
Wire Wire Line
	4900 4850 5350 4850
Wire Wire Line
	4900 5250 5350 5250
Wire Wire Line
	8050 3450 8450 3450
Wire Wire Line
	1150 1000 1150 1200
Wire Wire Line
	7600 3650 8450 3650
Wire Wire Line
	7600 3350 7600 3650
Wire Wire Line
	7600 3050 7600 2800
Wire Wire Line
	5650 5250 6000 5250
Wire Wire Line
	6400 5250 6400 4950
Wire Wire Line
	6400 4950 8450 4950
Wire Wire Line
	5850 3950 6150 3950
Wire Wire Line
	4900 3950 5450 3950
Wire Wire Line
	7150 2800 7150 3500
Wire Wire Line
	6750 3050 6750 2800
Wire Wire Line
	6750 3350 6750 3500
Wire Wire Line
	7150 3850 8450 3850
Wire Wire Line
	12350 1550 12350 1800
Wire Wire Line
	11850 1800 12350 1800
Wire Wire Line
	14050 1800 14050 1550
Wire Wire Line
	12900 1550 12900 1800
Connection ~ 12900 1800
Wire Wire Line
	13450 1550 13450 1800
Connection ~ 13450 1800
Wire Wire Line
	12350 1250 12350 950 
Wire Wire Line
	11850 950  12350 950 
Wire Wire Line
	14050 950  14050 1250
Wire Wire Line
	12900 750  12900 950 
Connection ~ 12900 950 
Wire Wire Line
	13450 1250 13450 950 
Connection ~ 13450 950 
Wire Wire Line
	12650 2600 12650 2800
Wire Wire Line
	12650 2800 12750 2800
Wire Wire Line
	12950 2800 12950 2950
Connection ~ 12650 2800
Wire Wire Line
	12750 2950 12750 2800
Connection ~ 12750 2800
Wire Wire Line
	12850 2950 12850 2800
Connection ~ 12850 2800
Wire Wire Line
	12750 8850 12750 9000
Wire Wire Line
	12850 8850 12850 9000
Wire Wire Line
	12750 9000 12850 9000
Connection ~ 12750 9000
Wire Wire Line
	12950 9000 12950 8850
Connection ~ 12850 9000
Wire Wire Line
	13050 9000 13050 8850
Connection ~ 12950 9000
Wire Wire Line
	13150 9000 13150 8850
Connection ~ 13050 9000
Wire Wire Line
	8050 7050 8450 7050
Wire Wire Line
	11850 1250 11850 950 
Connection ~ 12350 950 
Wire Wire Line
	11850 1550 11850 1800
Connection ~ 12350 1800
Text Label 17850 8250 2    60   ~ 0
PC14
Text Label 17850 8350 2    60   ~ 0
PC15
Wire Wire Line
	6000 4900 6000 4850
$Comp
L servo-sigma-48v-rescue:C-device C30
U 1 1 5AB8EC97
P 6150 3200
F 0 "C30" H 6000 3100 50  0000 L CNN
F 1 "100nF 50V" H 6200 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6188 3050 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 6150 3200 50  0001 C CNN
F 4 "490-4779-2-ND" H 6150 3200 60  0001 C CNN "Part"
F 5 "DigiKey" H 6150 3200 60  0001 C CNN "Provider"
	1    6150 3200
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C31
U 1 1 5AB8EC98
P 5450 3200
F 0 "C31" H 5300 3100 50  0000 L CNN
F 1 "1uF 100V" H 5500 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5488 3050 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_soft_en.pdf" H 5450 3200 50  0001 C CNN
F 4 "445-8887-1-ND" H 5450 3200 60  0001 C CNN "Part"
F 5 "DigiKey" H 5450 3200 60  0001 C CNN "Provider"
	1    5450 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	5450 3350 5450 3500
Wire Wire Line
	5450 3500 6150 3500
Wire Wire Line
	6150 3350 6150 3500
Connection ~ 6150 3950
Connection ~ 6150 3500
Wire Wire Line
	5450 3050 5450 2950
Wire Wire Line
	5450 2950 6150 2950
Wire Wire Line
	6150 2800 6150 2950
$Comp
L power:GND #PWR03
U 1 1 5AB8EC99
P 6150 2800
F 0 "#PWR03" H 6150 2550 50  0001 C CNN
F 1 "GND" H 6150 2650 50  0000 C CNN
F 2 "" H 6150 2800 50  0001 C CNN
F 3 "" H 6150 2800 50  0001 C CNN
	1    6150 2800
	1    0    0    1   
$EndComp
Connection ~ 6150 2950
Wire Wire Line
	6750 3500 7150 3500
Connection ~ 7150 3500
$Comp
L servo-sigma-48v-rescue:C-device C32
U 1 1 5AB8ECA0
P 5500 5250
F 0 "C32" V 5450 5350 50  0000 C CNN
F 1 "27pF/50V/1%" V 5650 5250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5538 5100 50  0001 C CNN
F 3 "http://search.murata.co.jp/Ceramy/image/img/A01X/partnumbering_e_01.pdf" H 5500 5250 50  0001 C CNN
F 4 "490-9719-1-ND" V 5500 5250 60  0001 C CNN "Part"
F 5 "DigiKey" V 5500 5250 60  0001 C CNN "Provider"
	1    5500 5250
	0    1    1    0   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C15
U 1 1 5A3A53E5
P 7600 4400
F 0 "C15" V 7550 4200 50  0000 L CNN
F 1 "2.2uF" V 7550 4450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7638 4250 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/G101/ENG/GRM188R61E225KA12-01.pdf" H 7600 4400 50  0001 C CNN
F 4 "490-10731-1-ND" H 7600 4400 60  0001 C CNN "Part"
F 5 "DigiKey" H 7600 4400 60  0001 C CNN "Provider"
	1    7600 4400
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C29
U 1 1 5A3B64F8
P 11850 1400
F 0 "C29" H 11750 1300 50  0000 L CNN
F 1 "4.7uF 25V" H 11450 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 11888 1250 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21A475KACLRNC.jsp" H 11850 1400 50  0001 C CNN
F 4 "1276-2415-1-ND" H 11850 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 11850 1400 60  0001 C CNN "Provider"
	1    11850 1400
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C28
U 1 1 5A540099
P 6750 3200
F 0 "C28" H 6600 3100 50  0000 L CNN
F 1 "1uF 100V" H 6800 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6788 3050 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_soft_en.pdf" H 6750 3200 50  0001 C CNN
F 4 "445-8887-1-ND" H 6750 3200 60  0001 C CNN "Part"
F 5 "DigiKey" H 6750 3200 60  0001 C CNN "Provider"
	1    6750 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	6000 4850 8450 4850
Wire Wire Line
	6000 5250 6400 5250
Wire Wire Line
	12900 1800 13450 1800
Wire Wire Line
	13450 1800 13450 2000
Wire Wire Line
	13450 1800 14050 1800
Wire Wire Line
	12900 950  13450 950 
Wire Wire Line
	12900 950  12900 1250
Wire Wire Line
	13450 950  14050 950 
Wire Wire Line
	12650 2800 12650 2950
Wire Wire Line
	12750 2800 12850 2800
Wire Wire Line
	12850 2800 12950 2800
Wire Wire Line
	12750 9000 12750 9100
Wire Wire Line
	12850 9000 12950 9000
Wire Wire Line
	12950 9000 13050 9000
Wire Wire Line
	13050 9000 13150 9000
Wire Wire Line
	12350 950  12900 950 
Wire Wire Line
	12350 1800 12900 1800
Wire Wire Line
	6150 3950 6750 3950
Wire Wire Line
	6150 3500 6150 3950
Wire Wire Line
	6150 2950 6150 3050
Wire Wire Line
	7150 3500 7150 3850
Text Label 1150 1600 0    60   ~ 0
USART1_TX
Wire Wire Line
	2350 1500 1150 1500
NoConn ~ 2850 1500
Text HLabel 1150 1500 0    60   Output ~ 0
EXT_5V
$Comp
L servo-sigma-48v-rescue:R-device R8
U 1 1 5AB43AFD
P 8450 1800
F 0 "R8" V 8530 1800 50  0000 C CNN
F 1 "10k" V 8450 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8380 1800 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 8450 1800 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 8450 1800 60  0001 C CNN "Part"
F 5 "DigiKey" V 8450 1800 60  0001 C CNN "Provider"
	1    8450 1800
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C3
U 1 1 5AB43EE1
P 8450 2400
F 0 "C3" H 8300 2300 50  0000 L CNN
F 1 "100nF 50V" H 8000 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8488 2250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 8450 2400 50  0001 C CNN
F 4 "490-4779-2-ND" H 8450 2400 60  0001 C CNN "Part"
F 5 "DigiKey" H 8450 2400 60  0001 C CNN "Provider"
	1    8450 2400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5AB442AF
P 8450 2700
F 0 "#PWR07" H 8450 2450 50  0001 C CNN
F 1 "GND" H 8450 2550 50  0000 C CNN
F 2 "" H 8450 2700 50  0001 C CNN
F 3 "" H 8450 2700 50  0001 C CNN
	1    8450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2550 8450 2700
Wire Wire Line
	8450 1650 8450 1550
Wire Wire Line
	8050 3450 8050 2100
$Comp
L power:GND #PWR09
U 1 1 5AB8F240
P 1200 3750
F 0 "#PWR09" H 1200 3500 50  0001 C CNN
F 1 "GND" H 1200 3600 50  0000 C CNN
F 2 "" H 1200 3750 50  0001 C CNN
F 3 "" H 1200 3750 50  0001 C CNN
	1    1200 3750
	1    0    0    -1  
$EndComp
Text Label 3000 3050 2    60   ~ 0
USER_BTN
$Comp
L servo-sigma-48v-rescue:R-device R9
U 1 1 5AB8F249
P 1750 3650
F 0 "R9" V 1830 3650 50  0000 C CNN
F 1 "100" V 1750 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1680 3650 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 1750 3650 50  0001 C CNN
F 4 "311-100HRCT-ND" V 1750 3650 60  0001 C CNN "Part"
F 5 "DigiKey" V 1750 3650 60  0001 C CNN "Provider"
	1    1750 3650
	0    -1   -1   0   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C4
U 1 1 5AB8F252
P 2350 3400
F 0 "C4" H 2200 3300 50  0000 L CNN
F 1 "100nF 50V" H 1900 3500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2388 3250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 2350 3400 50  0001 C CNN
F 4 "490-4779-2-ND" H 2350 3400 60  0001 C CNN "Part"
F 5 "DigiKey" H 2350 3400 60  0001 C CNN "Provider"
	1    2350 3400
	-1   0    0    1   
$EndComp
$Comp
L sigmadrone:SW_PUSH_TACKTILE2 USR1
U 1 1 5AB8F25B
P 1750 3050
F 0 "USR1" H 2100 3150 50  0000 R CNN
F 1 "WURTH_434153017835" H 2100 2850 50  0000 R CNN
F 2 "Sigmadrone:SW_SPST_WURTH_434153017835" H 1750 3050 60  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/434153017835.pdf" H 1750 3050 60  0001 C CNN
F 4 "732-10143-1-ND" H 1750 3050 60  0001 C CNN "Part"
F 5 "DigiKey" H 1750 3050 60  0001 C CNN "Provider"
	1    1750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2550 2350 2650
Wire Wire Line
	2350 2950 2350 3050
Wire Wire Line
	1200 3050 1200 3150
Wire Wire Line
	1200 3650 1600 3650
Wire Wire Line
	2050 3050 2350 3050
Connection ~ 2350 3050
Wire Wire Line
	2350 3550 2350 3650
Wire Wire Line
	2350 3650 1900 3650
Wire Wire Line
	1450 3050 1200 3050
Connection ~ 1200 3650
Wire Wire Line
	1450 3150 1200 3150
Connection ~ 1200 3150
Wire Wire Line
	2350 3150 2050 3150
Connection ~ 2350 3150
$Comp
L servo-sigma-48v-rescue:R-device R10
U 1 1 5AB8F272
P 2350 2800
F 0 "R10" V 2430 2800 50  0000 C CNN
F 1 "10k" V 2350 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2280 2800 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2350 2800 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 2350 2800 60  0001 C CNN "Part"
F 5 "DigiKey" V 2350 2800 60  0001 C CNN "Provider"
	1    2350 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3050 2350 3150
Wire Wire Line
	2350 3050 3000 3050
Wire Wire Line
	1200 3650 1200 3750
Wire Wire Line
	1200 3150 1200 3650
Wire Wire Line
	2350 3150 2350 3250
Text Label 20800 3400 0    60   ~ 0
ENCODER_B
Text Label 20800 3500 0    60   ~ 0
ENCODER_5V
Text Label 20800 3600 0    60   ~ 0
ENCODER_A
Text Label 20800 3700 0    60   ~ 0
ENCODER_Z
Text Label 20800 3800 0    60   ~ 0
ENCODER_GND
Wire Wire Line
	22000 3400 21900 3400
Wire Wire Line
	22000 3500 20800 3500
Wire Wire Line
	22000 3600 21700 3600
Wire Wire Line
	22000 3700 21500 3700
Wire Wire Line
	22000 3800 20800 3800
$Comp
L power:+5V #PWR?
U 1 1 5BB4B839
P 20800 3500
AR Path="/58BF599E/5BB4B839" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5BB4B839" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 20800 3350 50  0001 C CNN
F 1 "+5V" H 20815 3673 50  0000 C CNN
F 2 "" H 20800 3500 50  0001 C CNN
F 3 "" H 20800 3500 50  0001 C CNN
	1    20800 3500
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5BB57B1C
P 20800 3800
F 0 "#PWR0116" H 20800 3550 50  0001 C CNN
F 1 "GND" H 20800 3650 50  0000 C CNN
F 2 "" H 20800 3800 50  0001 C CNN
F 3 "" H 20800 3800 50  0001 C CNN
	1    20800 3800
	0    1    -1   0   
$EndComp
Text Label 19150 3450 2    60   ~ 0
ENCODER_A
Text Label 19150 3550 2    60   ~ 0
ENCODER_B
$Comp
L servo-sigma-48v-rescue:R-device R44
U 1 1 5BDC03FA
P 3100 1400
F 0 "R44" V 3150 1550 50  0000 C CNN
F 1 "21" V 3100 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3030 1400 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 3100 1400 50  0001 C CNN
F 4 "311-21.0HRCT-ND" V 3100 1400 60  0001 C CNN "Part"
F 5 "DigiKey" V 3100 1400 60  0001 C CNN "Provider"
	1    3100 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 1400 3900 1400
$Comp
L servo-sigma-48v-rescue:R-device R2
U 1 1 5BDC074C
P 2100 1400
F 0 "R2" V 2150 1550 50  0000 C CNN
F 1 "21" V 2100 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2030 1400 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2100 1400 50  0001 C CNN
F 4 "311-21.0HRCT-ND" V 2100 1400 60  0001 C CNN "Part"
F 5 "DigiKey" V 2100 1400 60  0001 C CNN "Provider"
	1    2100 1400
	0    -1   -1   0   
$EndComp
$Comp
L servo-sigma-48v-rescue:R-device R3
U 1 1 5BDE0108
P 2100 1600
F 0 "R3" V 2150 1750 50  0000 C CNN
F 1 "21" V 2100 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2030 1600 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2100 1600 50  0001 C CNN
F 4 "311-21.0HRCT-ND" V 2100 1600 60  0001 C CNN "Part"
F 5 "DigiKey" V 2100 1600 60  0001 C CNN "Provider"
	1    2100 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 1600 2350 1600
Wire Wire Line
	17450 4950 17850 4950
Wire Wire Line
	17450 3450 19150 3450
Wire Wire Line
	17450 3550 19150 3550
Text Label 1150 1400 0    60   ~ 0
USART1_RX
Wire Wire Line
	1150 1400 1950 1400
Text Label 3900 1400 2    60   ~ 0
SWO
$Comp
L sigmadrone:629_105_150_921 J6
U 1 1 5BEA08E5
P 1150 14250
F 0 "J6" H 1050 14900 60  0000 C CNN
F 1 "629_105_150_921" H 1100 13600 60  0000 C CNN
F 2 "Sigmadrone:WURTH_629105150921_NO_OVALS" H 1044 15037 60  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/629105150921.pdf" H 1044 14931 60  0001 C CNN
F 4 "732-5961-1-ND" H 1150 14250 50  0001 C CNN "Part"
F 5 "DigiKey" H 1150 14250 50  0001 C CNN "Provider"
	1    1150 14250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5BEB5E6E
P 1800 14900
F 0 "#PWR041" H 1800 14650 50  0001 C CNN
F 1 "GND" H 1800 14750 50  0000 C CNN
F 2 "" H 1800 14900 50  0001 C CNN
F 3 "" H 1800 14900 50  0001 C CNN
	1    1800 14900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 14250 1800 14250
Wire Wire Line
	1800 14250 1800 14350
Wire Wire Line
	1550 14350 1800 14350
Connection ~ 1800 14350
Wire Wire Line
	1800 14350 1800 14450
Wire Wire Line
	1550 14450 1800 14450
Connection ~ 1800 14450
Wire Wire Line
	1800 14450 1800 14550
Wire Wire Line
	1550 14550 1800 14550
Connection ~ 1800 14550
Wire Wire Line
	1800 14550 1800 14650
Wire Wire Line
	1550 14650 1800 14650
Connection ~ 1800 14650
Wire Wire Line
	1800 14650 1800 14750
Wire Wire Line
	1550 14750 1800 14750
Connection ~ 1800 14750
Wire Wire Line
	1800 14750 1800 14900
Wire Wire Line
	1550 14150 1800 14150
Wire Wire Line
	1800 14150 1800 14250
Connection ~ 1800 14250
NoConn ~ 1550 14050
NoConn ~ 1550 13750
Text Label 2600 13850 2    60   ~ 0
USB_DM
Text Label 2600 13950 2    60   ~ 0
USB_DP
Wire Wire Line
	1550 13850 1750 13850
Wire Wire Line
	1550 13950 1750 13950
$Comp
L servo-sigma-48v-rescue:R-device R47
U 1 1 5BF37336
P 1900 13850
F 0 "R47" V 1950 14000 50  0000 C CNN
F 1 "21" V 1900 13850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1830 13850 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 1900 13850 50  0001 C CNN
F 4 "311-21.0HRCT-ND" V 1900 13850 60  0001 C CNN "Part"
F 5 "DigiKey" V 1900 13850 60  0001 C CNN "Provider"
	1    1900 13850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 13850 2600 13850
$Comp
L servo-sigma-48v-rescue:R-device R50
U 1 1 5BF374B9
P 1900 13950
F 0 "R50" V 1950 14100 50  0000 C CNN
F 1 "21" V 1900 13950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1830 13950 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 1900 13950 50  0001 C CNN
F 4 "311-21.0HRCT-ND" V 1900 13950 60  0001 C CNN "Part"
F 5 "DigiKey" V 1900 13950 60  0001 C CNN "Provider"
	1    1900 13950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 13950 2600 13950
Text Label 19150 4550 2    60   ~ 0
USB_DM
Text Label 19150 4650 2    60   ~ 0
USB_DP
Wire Wire Line
	17450 4550 19150 4550
Wire Wire Line
	17450 4650 19150 4650
Text Label 6350 8250 0    60   ~ 0
LED_WARN
Text Label 6350 8350 0    60   ~ 0
LED_STATUS
Wire Wire Line
	17450 5950 17850 5950
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 5C6213BC
P 4600 14300
F 0 "J8" H 4600 14500 50  0000 C CNN
F 1 "Conn_01x03" H 4600 14100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 4600 14300 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705530002_sd.pdf" H 4600 14300 50  0001 C CNN
F 4 "WM4901-ND" H 4600 14300 50  0001 C CNN "Part"
F 5 "DigiKey" H 4600 14300 50  0001 C CNN "Provider"
	1    4600 14300
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5C645EB0
P 5500 14300
AR Path="/58BF599E/5C645EB0" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5C645EB0" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 5500 14150 50  0001 C CNN
F 1 "+5V" V 5500 14500 50  0000 C CNN
F 2 "" H 5500 14300 50  0001 C CNN
F 3 "" H 5500 14300 50  0001 C CNN
	1    5500 14300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR076
U 1 1 5C645EB6
P 5500 14200
F 0 "#PWR076" H 5500 13950 50  0001 C CNN
F 1 "GND" V 5500 14000 50  0000 C CNN
F 2 "" H 5500 14200 50  0001 C CNN
F 3 "" H 5500 14200 50  0001 C CNN
	1    5500 14200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 14200 5500 14200
Wire Wire Line
	4800 14300 5500 14300
Text Label 5550 14400 2    60   ~ 0
SW1
$Comp
L servo-sigma-48v-rescue:R-device R20
U 1 1 5C69BA3F
P 5200 15050
F 0 "R20" V 5280 15050 50  0000 C CNN
F 1 "100" V 5200 15050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5130 15050 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5200 15050 50  0001 C CNN
F 4 "311-100HRCT-ND" V 5200 15050 60  0001 C CNN "Part"
F 5 "DigiKey" V 5200 15050 60  0001 C CNN "Provider"
	1    5200 15050
	1    0    0    -1  
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C51
U 1 1 5C69BA48
P 5200 14650
F 0 "C51" H 5050 14550 50  0000 L CNN
F 1 "100nF 50V" H 4750 14750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5238 14500 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 5200 14650 50  0001 C CNN
F 4 "490-4779-2-ND" H 5200 14650 60  0001 C CNN "Part"
F 5 "DigiKey" H 5200 14650 60  0001 C CNN "Provider"
	1    5200 14650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 14800 5200 14900
$Comp
L power:GND #PWR073
U 1 1 5C70ECD7
P 5200 15300
F 0 "#PWR073" H 5200 15050 50  0001 C CNN
F 1 "GND" H 5200 15150 50  0000 C CNN
F 2 "" H 5200 15300 50  0001 C CNN
F 3 "" H 5200 15300 50  0001 C CNN
	1    5200 15300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 15300 5200 15200
$Comp
L servo-sigma-48v-rescue:R-device R17
U 1 1 5C71BDB8
P 5200 13900
F 0 "R17" V 5280 13900 50  0000 C CNN
F 1 "10k" V 5200 13900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5130 13900 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5200 13900 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 5200 13900 60  0001 C CNN "Part"
F 5 "DigiKey" V 5200 13900 60  0001 C CNN "Provider"
	1    5200 13900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5C71BEBC
P 5200 13600
AR Path="/58BF599E/5C71BEBC" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5C71BEBC" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 5200 13450 50  0001 C CNN
F 1 "+5V" V 5200 13800 50  0000 C CNN
F 2 "" H 5200 13600 50  0001 C CNN
F 3 "" H 5200 13600 50  0001 C CNN
	1    5200 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 13600 5200 13750
$Comp
L power:+5V #PWR?
U 1 1 5C769B40
P 7350 14300
AR Path="/58BF599E/5C769B40" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5C769B40" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 7350 14150 50  0001 C CNN
F 1 "+5V" V 7350 14500 50  0000 C CNN
F 2 "" H 7350 14300 50  0001 C CNN
F 3 "" H 7350 14300 50  0001 C CNN
	1    7350 14300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR084
U 1 1 5C769B46
P 7350 14200
F 0 "#PWR084" H 7350 13950 50  0001 C CNN
F 1 "GND" V 7350 14000 50  0000 C CNN
F 2 "" H 7350 14200 50  0001 C CNN
F 3 "" H 7350 14200 50  0001 C CNN
	1    7350 14200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 14200 7350 14200
Wire Wire Line
	6650 14300 7350 14300
Text Label 7350 14400 2    60   ~ 0
SW2
$Comp
L servo-sigma-48v-rescue:R-device R30
U 1 1 5C769B52
P 7050 15050
F 0 "R30" V 7130 15050 50  0000 C CNN
F 1 "100" V 7050 15050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6980 15050 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 7050 15050 50  0001 C CNN
F 4 "311-100HRCT-ND" V 7050 15050 60  0001 C CNN "Part"
F 5 "DigiKey" V 7050 15050 60  0001 C CNN "Provider"
	1    7050 15050
	1    0    0    -1  
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C52
U 1 1 5C769B5B
P 7050 14650
F 0 "C52" H 6900 14550 50  0000 L CNN
F 1 "100nF 50V" H 6600 14750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7088 14500 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 7050 14650 50  0001 C CNN
F 4 "490-4779-2-ND" H 7050 14650 60  0001 C CNN "Part"
F 5 "DigiKey" H 7050 14650 60  0001 C CNN "Provider"
	1    7050 14650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7050 14800 7050 14900
$Comp
L power:GND #PWR082
U 1 1 5C769B66
P 7050 15300
F 0 "#PWR082" H 7050 15050 50  0001 C CNN
F 1 "GND" H 7050 15150 50  0000 C CNN
F 2 "" H 7050 15300 50  0001 C CNN
F 3 "" H 7050 15300 50  0001 C CNN
	1    7050 15300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 15300 7050 15200
$Comp
L servo-sigma-48v-rescue:R-device R28
U 1 1 5C769B6F
P 7050 13900
F 0 "R28" V 7130 13900 50  0000 C CNN
F 1 "10k" V 7050 13900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6980 13900 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 7050 13900 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 7050 13900 60  0001 C CNN "Part"
F 5 "DigiKey" V 7050 13900 60  0001 C CNN "Provider"
	1    7050 13900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5C769B76
P 7050 13600
AR Path="/58BF599E/5C769B76" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5C769B76" Ref="#PWR081"  Part="1" 
F 0 "#PWR081" H 7050 13450 50  0001 C CNN
F 1 "+5V" V 7050 13800 50  0000 C CNN
F 2 "" H 7050 13600 50  0001 C CNN
F 3 "" H 7050 13600 50  0001 C CNN
	1    7050 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 13600 7050 13750
Wire Wire Line
	17450 5650 17850 5650
Text Label 19150 6450 2    60   ~ 0
SW2
Wire Wire Line
	17450 6450 19150 6450
Wire Wire Line
	17450 6350 19150 6350
$Comp
L Connector_Generic:Conn_01x03 J9
U 1 1 5C86EEED
P 6450 14300
F 0 "J9" H 6450 14500 50  0000 C CNN
F 1 "Conn_01x03" H 6450 14100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 6450 14300 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705530002_sd.pdf" H 6450 14300 50  0001 C CNN
F 4 "WM4901-ND" H 6450 14300 50  0001 C CNN "Part"
F 5 "DigiKey" H 6450 14300 50  0001 C CNN "Provider"
	1    6450 14300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	17450 4050 19450 4050
Text HLabel 19450 3950 2    60   Input ~ 0
IC_FB
Wire Wire Line
	19450 7350 17450 7350
Text HLabel 19450 4150 2    60   Input ~ 0
IA_FB
Text HLabel 19450 4050 2    60   Input ~ 0
IB_FB
Text HLabel 19450 7050 2    60   Input ~ 0
SENSE_A
Text HLabel 19450 6950 2    60   Input ~ 0
SENSE_B
Text HLabel 19450 6850 2    60   Input ~ 0
SENSE_C
Wire Wire Line
	19450 6850 17450 6850
Wire Wire Line
	19450 6950 17450 6950
Wire Wire Line
	19450 7050 17450 7050
Text Label 6350 7950 0    60   ~ 0
USER_BTN
Text HLabel 19450 7350 2    60   Input ~ 0
VBAT_ADC
Wire Wire Line
	17450 3950 19450 3950
Wire Wire Line
	17450 3650 19150 3650
Text Label 19150 5750 2    60   ~ 0
USART1_TX
Text Label 19150 5850 2    60   ~ 0
USART1_RX
Text Label 19150 5450 2    60   ~ 0
SWO
Wire Wire Line
	17450 5450 19150 5450
Wire Wire Line
	17450 5750 19150 5750
Wire Wire Line
	17450 5850 19150 5850
$Comp
L Interface_UART:MAX3485 U12
U 1 1 5CB68FA7
P 2350 8650
AR Path="/58BE2779/5CB68FA7" Ref="U12"  Part="1" 
AR Path="/5CA7E4B7/5CB68FA7" Ref="U?"  Part="1" 
F 0 "U12" H 2450 9100 50  0000 C CNN
F 1 "SN65HVD75DGKR" H 1950 8100 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2350 7950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn65hvd75.pdf" H 2350 8700 50  0001 C CNN
F 4 "296-35070-1-ND" H 2350 8650 50  0001 C CNN "Part"
F 5 "DigiKey" H 2350 8650 50  0001 C CNN "Provider"
	1    2350 8650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR087
U 1 1 5CCDC2CF
P 2350 9400
F 0 "#PWR087" H 2350 9150 50  0001 C CNN
F 1 "GND" H 2350 9250 50  0000 C CNN
F 2 "" H 2350 9400 50  0001 C CNN
F 3 "" H 2350 9400 50  0001 C CNN
	1    2350 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 8150 2350 7800
Wire Wire Line
	2350 9250 2350 9400
Text Label 800  8550 0    60   ~ 0
RS485_RO
Text Label 800  8850 0    60   ~ 0
RS485_DI
Text Label 800  8750 0    60   ~ 0
RS485_DE
Wire Wire Line
	800  8550 1450 8550
Wire Wire Line
	800  8750 1450 8750
Wire Wire Line
	800  8850 1950 8850
Wire Wire Line
	1950 8650 1450 8650
Wire Wire Line
	1450 8650 1450 8750
Connection ~ 1450 8750
Wire Wire Line
	1450 8750 1950 8750
$Comp
L servo-sigma-48v-rescue:C-device C8
U 1 1 5CD3A126
P 1800 8050
F 0 "C8" H 1650 7950 50  0000 L CNN
F 1 "100nF 50V" H 1350 8150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1838 7900 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 1800 8050 50  0001 C CNN
F 4 "490-4779-2-ND" H 1800 8050 60  0001 C CNN "Part"
F 5 "DigiKey" H 1800 8050 60  0001 C CNN "Provider"
	1    1800 8050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 7900 1800 7800
Wire Wire Line
	1800 7800 2350 7800
Connection ~ 2350 7800
Wire Wire Line
	2350 7800 2350 7650
$Comp
L power:GND #PWR085
U 1 1 5CD69F12
P 1800 8250
F 0 "#PWR085" H 1800 8000 50  0001 C CNN
F 1 "GND" H 1800 8100 50  0000 C CNN
F 2 "" H 1800 8250 50  0001 C CNN
F 3 "" H 1800 8250 50  0001 C CNN
	1    1800 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 8250 1800 8200
$Comp
L servo-sigma-48v-rescue:R-device R84
U 1 1 5CD9AA3E
P 1450 8050
F 0 "R84" V 1530 8050 50  0000 C CNN
F 1 "10k" V 1450 8050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1380 8050 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 1450 8050 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 1450 8050 60  0001 C CNN "Part"
F 5 "DigiKey" V 1450 8050 60  0001 C CNN "Provider"
	1    1450 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 7900 1450 7800
Wire Wire Line
	1450 7800 1800 7800
Connection ~ 1800 7800
Wire Wire Line
	1450 8200 1450 8550
Connection ~ 1450 8550
Wire Wire Line
	1450 8550 1950 8550
$Comp
L servo-sigma-48v-rescue:R-device R85
U 1 1 5CDBBD56
P 1450 9150
F 0 "R85" V 1530 9150 50  0000 C CNN
F 1 "10k" V 1450 9150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1380 9150 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 1450 9150 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 1450 9150 60  0001 C CNN "Part"
F 5 "DigiKey" V 1450 9150 60  0001 C CNN "Provider"
	1    1450 9150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR063
U 1 1 5CDCC8E4
P 1450 9400
F 0 "#PWR063" H 1450 9150 50  0001 C CNN
F 1 "GND" H 1450 9250 50  0000 C CNN
F 2 "" H 1450 9400 50  0001 C CNN
F 3 "" H 1450 9400 50  0001 C CNN
	1    1450 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 8750 1450 9000
Wire Wire Line
	1450 9300 1450 9400
$Comp
L servo-sigma-48v-rescue:R-device R88
U 1 1 5CEA24A4
P 3450 9350
F 0 "R88" V 3530 9350 50  0000 C CNN
F 1 "100" V 3450 9350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3380 9350 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 3450 9350 50  0001 C CNN
F 4 "311-100HRCT-ND" V 3450 9350 60  0001 C CNN "Part"
F 5 "DigiKey" V 3450 9350 60  0001 C CNN "Provider"
	1    3450 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 9200 3450 8550
Connection ~ 3450 8550
Wire Wire Line
	3450 10050 4350 10050
Text Label 4350 10050 2    60   ~ 0
B_TERM_R120
Text Label 4350 9850 2    60   ~ 0
A_TERM_R120
Wire Wire Line
	4350 9850 3650 9850
Wire Wire Line
	3650 9850 3650 8850
Connection ~ 3650 8850
$Comp
L Connector_Generic:Conn_01x03 J10
U 1 1 5CFADD45
P 4150 9400
F 0 "J10" H 4150 9600 50  0000 C CNN
F 1 "Conn_01x03" H 4150 9200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 4150 9400 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705530002_sd.pdf" H 4150 9400 50  0001 C CNN
F 4 "WM4901-ND" H 4150 9400 50  0001 C CNN "Part"
F 5 "DigiKey" H 4150 9400 50  0001 C CNN "Provider"
	1    4150 9400
	0    -1   1    0   
$EndComp
Wire Wire Line
	4150 9200 4150 8850
Wire Wire Line
	3650 8850 4150 8850
Wire Wire Line
	4250 8550 4250 9200
Wire Wire Line
	3450 8550 4250 8550
$Comp
L Connector_Generic:Conn_01x03 J11
U 1 1 5D05C4BC
P 4650 9400
F 0 "J11" H 4650 9600 50  0000 C CNN
F 1 "Conn_01x03" H 4650 9200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 4650 9400 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705530002_sd.pdf" H 4650 9400 50  0001 C CNN
F 4 "WM4901-ND" H 4650 9400 50  0001 C CNN "Part"
F 5 "DigiKey" H 4650 9400 50  0001 C CNN "Provider"
	1    4650 9400
	0    -1   1    0   
$EndComp
Wire Wire Line
	4150 8850 4650 8850
Wire Wire Line
	4650 8850 4650 9200
Connection ~ 4150 8850
Wire Wire Line
	4250 8550 4750 8550
Wire Wire Line
	4750 8550 4750 9200
Connection ~ 4250 8550
$Comp
L power:GND #PWR089
U 1 1 5D0BC76A
P 4050 9100
F 0 "#PWR089" H 4050 8850 50  0001 C CNN
F 1 "GND" H 4050 8950 50  0000 C CNN
F 2 "" H 4050 9100 50  0001 C CNN
F 3 "" H 4050 9100 50  0001 C CNN
	1    4050 9100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR090
U 1 1 5D0BC84D
P 4550 9100
F 0 "#PWR090" H 4550 8850 50  0001 C CNN
F 1 "GND" H 4550 8950 50  0000 C CNN
F 2 "" H 4550 9100 50  0001 C CNN
F 3 "" H 4550 9100 50  0001 C CNN
	1    4550 9100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 9200 4050 9100
Wire Wire Line
	4550 9200 4550 9100
$Comp
L Interface_UART:MAX3485 U3
U 1 1 5D0E51D6
P 2300 11750
AR Path="/58BE2779/5D0E51D6" Ref="U3"  Part="1" 
AR Path="/5CA7E4B7/5D0E51D6" Ref="U?"  Part="1" 
F 0 "U3" H 2400 12200 50  0000 C CNN
F 1 "SN65HVD75DGKR" H 1900 11200 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2300 11050 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX3483-MAX3491.pdf" H 2300 11800 50  0001 C CNN
F 4 "296-35070-1-ND" H 2300 11750 50  0001 C CNN "Part"
F 5 "DigiKey" H 2300 11750 50  0001 C CNN "Provider"
	1    2300 11750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR050
U 1 1 5D0E51DD
P 2300 12500
F 0 "#PWR050" H 2300 12250 50  0001 C CNN
F 1 "GND" H 2300 12350 50  0000 C CNN
F 2 "" H 2300 12500 50  0001 C CNN
F 3 "" H 2300 12500 50  0001 C CNN
	1    2300 12500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 11250 2300 10900
Wire Wire Line
	2300 12350 2300 12500
Wire Wire Line
	750  11650 1400 11650
Wire Wire Line
	750  11850 1400 11850
Wire Wire Line
	750  11950 1900 11950
Wire Wire Line
	1900 11750 1400 11750
Wire Wire Line
	1400 11750 1400 11850
Connection ~ 1400 11850
Wire Wire Line
	1400 11850 1900 11850
$Comp
L servo-sigma-48v-rescue:C-device C5
U 1 1 5D0E51F7
P 1750 11150
F 0 "C5" H 1600 11050 50  0000 L CNN
F 1 "100nF 50V" H 1300 11250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1788 11000 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 1750 11150 50  0001 C CNN
F 4 "490-4779-2-ND" H 1750 11150 60  0001 C CNN "Part"
F 5 "DigiKey" H 1750 11150 60  0001 C CNN "Provider"
	1    1750 11150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 11000 1750 10900
Wire Wire Line
	1750 10900 2300 10900
Connection ~ 2300 10900
Wire Wire Line
	2300 10900 2300 10750
$Comp
L power:GND #PWR046
U 1 1 5D0E5202
P 1750 11350
F 0 "#PWR046" H 1750 11100 50  0001 C CNN
F 1 "GND" H 1750 11200 50  0000 C CNN
F 2 "" H 1750 11350 50  0001 C CNN
F 3 "" H 1750 11350 50  0001 C CNN
	1    1750 11350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 11350 1750 11300
$Comp
L servo-sigma-48v-rescue:R-device R14
U 1 1 5D0E520B
P 1400 11150
F 0 "R14" V 1480 11150 50  0000 C CNN
F 1 "10k" V 1400 11150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1330 11150 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 1400 11150 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 1400 11150 60  0001 C CNN "Part"
F 5 "DigiKey" V 1400 11150 60  0001 C CNN "Provider"
	1    1400 11150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 11000 1400 10900
Wire Wire Line
	1400 10900 1750 10900
Connection ~ 1750 10900
Wire Wire Line
	1400 11300 1400 11650
Connection ~ 1400 11650
Wire Wire Line
	1400 11650 1900 11650
$Comp
L servo-sigma-48v-rescue:R-device R15
U 1 1 5D0E521A
P 1400 12250
F 0 "R15" V 1480 12250 50  0000 C CNN
F 1 "10k" V 1400 12250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1330 12250 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 1400 12250 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 1400 12250 60  0001 C CNN "Part"
F 5 "DigiKey" V 1400 12250 60  0001 C CNN "Provider"
	1    1400 12250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5D0E5221
P 1400 12500
F 0 "#PWR044" H 1400 12250 50  0001 C CNN
F 1 "GND" H 1400 12350 50  0000 C CNN
F 2 "" H 1400 12500 50  0001 C CNN
F 3 "" H 1400 12500 50  0001 C CNN
	1    1400 12500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 11850 1400 12100
Wire Wire Line
	1400 12400 1400 12500
$Comp
L servo-sigma-48v-rescue:R-device R81
U 1 1 5D0E522D
P 3400 12150
F 0 "R81" V 3480 12150 50  0000 C CNN
F 1 "100" V 3400 12150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3330 12150 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 3400 12150 50  0001 C CNN
F 4 "311-100HRCT-ND" V 3400 12150 60  0001 C CNN "Part"
F 5 "DigiKey" V 3400 12150 60  0001 C CNN "Provider"
	1    3400 12150
	1    0    0    -1  
$EndComp
$Comp
L servo-sigma-48v-rescue:R-device R83
U 1 1 5D0E5236
P 3400 12500
F 0 "R83" V 3450 12650 50  0000 C CNN
F 1 "21" V 3400 12500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3330 12500 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 3400 12500 50  0001 C CNN
F 4 "311-21.0HRCT-ND" V 3400 12500 60  0001 C CNN "Part"
F 5 "DigiKey" V 3400 12500 60  0001 C CNN "Provider"
	1    3400 12500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 12300 3400 12350
Wire Wire Line
	3400 12000 3400 11650
Wire Wire Line
	3600 12700 3600 11950
Connection ~ 3600 11950
Wire Wire Line
	3600 12700 3400 12700
Wire Wire Line
	3400 12650 3400 12700
Text Label 750  11950 0    60   ~ 0
ENCODER_DI
Text Label 750  11650 0    60   ~ 0
ENCODER_RO
Text Label 750  11850 0    60   ~ 0
ENCODER_DE
Text Label 4300 11550 0    60   ~ 0
ENCODER_RS485_MCLR
$Comp
L Connector_Generic:Conn_01x05 J5
U 1 1 5D40B2A6
P 22200 3600
F 0 "J5" H 22200 3900 50  0000 C CNN
F 1 "Conn_01x05" H 22200 3300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Horizontal" H 22200 3600 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705530002_sd.pdf" H 22200 3600 50  0001 C CNN
F 4 "WM4903-ND" H 22200 3600 50  0001 C CNN "Part"
F 5 "DigiKey" H 22200 3600 50  0001 C CNN "Provider"
	1    22200 3600
	1    0    0    -1  
$EndComp
NoConn ~ 8450 5750
NoConn ~ 8450 5650
Text Label 8050 3650 0    60   ~ 0
BOOT0
$Comp
L STM32LEGACY:STM32F405VGTx U5
U 1 1 5C640644
P 12950 5950
F 0 "U5" H 17000 8800 50  0000 C CNN
F 1 "STM32F405VGTx" H 16850 3200 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 17250 8725 50  0001 R TNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/ef/92/76/6d/bb/c2/4f/f7/DM00037051.pdf/files/DM00037051.pdf/jcr:content/translations/en.DM00037051.pdf" H 12950 5950 50  0001 C CNN
F 4 "497-17435-ND" H 12950 5950 50  0001 C CNN "Part"
F 5 "DigiKey" H 12950 5950 50  0001 C CNN "Provider"
	1    12950 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3850 6750 3950
Connection ~ 6750 3950
Wire Wire Line
	6750 3950 8450 3950
$Comp
L servo-sigma-48v-rescue:C-device C10
U 1 1 5C82DAED
P 7150 4400
F 0 "C10" V 7100 4200 50  0000 L CNN
F 1 "2.2uF" V 7100 4450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7188 4250 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/G101/ENG/GRM188R61E225KA12-01.pdf" H 7150 4400 50  0001 C CNN
F 4 "490-10731-1-ND" H 7150 4400 60  0001 C CNN "Part"
F 5 "DigiKey" H 7150 4400 60  0001 C CNN "Provider"
	1    7150 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 4150 8350 4150
Wire Wire Line
	7600 4150 7600 4250
Wire Wire Line
	7150 4250 7150 4050
Wire Wire Line
	7150 4050 7950 4050
$Comp
L power:GND #PWR0110
U 1 1 5C86B878
P 7600 4650
F 0 "#PWR0110" H 7600 4400 50  0001 C CNN
F 1 "GND" H 7600 4500 50  0000 C CNN
F 2 "" H 7600 4650 50  0001 C CNN
F 3 "" H 7600 4650 50  0001 C CNN
	1    7600 4650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5C86BB43
P 7150 4650
F 0 "#PWR0128" H 7150 4400 50  0001 C CNN
F 1 "GND" H 7150 4500 50  0000 C CNN
F 2 "" H 7150 4650 50  0001 C CNN
F 3 "" H 7150 4650 50  0001 C CNN
	1    7150 4650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7150 4550 7150 4650
Wire Wire Line
	7600 4550 7600 4650
$Comp
L power:PWR_FLAG #FLG0106
U 1 1 5C924B67
P 7950 4300
F 0 "#FLG0106" H 7950 4375 50  0001 C CNN
F 1 "PWR_FLAG" H 7950 4474 50  0000 C CNN
F 2 "" H 7950 4300 50  0001 C CNN
F 3 "" H 7950 4300 50  0001 C CNN
	1    7950 4300
	-1   0    0    1   
$EndComp
Wire Wire Line
	8350 4300 8350 4150
Connection ~ 8350 4150
Wire Wire Line
	8350 4150 7600 4150
Wire Wire Line
	7950 4300 7950 4050
Connection ~ 7950 4050
Wire Wire Line
	7950 4050 8450 4050
Wire Wire Line
	13050 2950 13050 2800
Wire Wire Line
	13050 2800 12950 2800
Connection ~ 12950 2800
Wire Wire Line
	13150 2950 13150 2800
Wire Wire Line
	13150 2800 13050 2800
Connection ~ 13050 2800
Wire Wire Line
	13250 2950 13250 2800
Wire Wire Line
	13250 2800 13150 2800
Connection ~ 13150 2800
$Comp
L servo-sigma-48v-rescue:C-device C53
U 1 1 5CA0207F
P 14600 1400
F 0 "C53" H 14450 1300 50  0000 L CNN
F 1 "100nF 50V" H 14150 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 14638 1250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 14600 1400 50  0001 C CNN
F 4 "490-4779-2-ND" H 14600 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 14600 1400 60  0001 C CNN "Provider"
	1    14600 1400
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:C-device C54
U 1 1 5CA0212F
P 15150 1400
F 0 "C54" H 15000 1300 50  0000 L CNN
F 1 "100nF 50V" H 14700 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 15188 1250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 15150 1400 50  0001 C CNN
F 4 "490-4779-2-ND" H 15150 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 15150 1400 60  0001 C CNN "Provider"
	1    15150 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	14050 950  14600 950 
Wire Wire Line
	14600 950  14600 1250
Connection ~ 14050 950 
Wire Wire Line
	14600 950  15150 950 
Wire Wire Line
	15150 950  15150 1250
Connection ~ 14600 950 
Wire Wire Line
	14600 1550 14600 1800
Wire Wire Line
	14600 1800 14050 1800
Connection ~ 14050 1800
Wire Wire Line
	15150 1550 15150 1800
Wire Wire Line
	15150 1800 14600 1800
Connection ~ 14600 1800
Text Label 8050 7150 0    60   ~ 0
PD3
Text Label 8050 7250 0    60   ~ 0
PD4
Text Label 8050 7350 0    60   ~ 0
PD5
Text Label 8050 7450 0    60   ~ 0
PD6
Text Label 8050 7550 0    60   ~ 0
PD7
Text Label 8050 7650 0    60   ~ 0
PD8
Text Label 8050 7750 0    60   ~ 0
PD9
Text Label 8050 7850 0    60   ~ 0
PD10
Text Label 8050 7950 0    60   ~ 0
PD11
Text Label 8050 8050 0    60   ~ 0
PD12
Text Label 8050 8150 0    60   ~ 0
PD13
Text Label 8050 8250 0    60   ~ 0
PD14
Text Label 8050 8350 0    60   ~ 0
PD15
Text Label 8050 6850 0    60   ~ 0
PD0
Text Label 8050 6950 0    60   ~ 0
PD1
Wire Wire Line
	8050 6950 8450 6950
Wire Wire Line
	8050 7150 8450 7150
Wire Wire Line
	8050 7550 8450 7550
Wire Wire Line
	8050 7850 8450 7850
Text Label 8050 5150 0    60   ~ 0
PE0
Text Label 8050 5250 0    60   ~ 0
PE1
Text Label 8050 5350 0    60   ~ 0
PE2
Text Label 8050 5450 0    60   ~ 0
PE3
Text Label 8050 5550 0    60   ~ 0
PE4
Text Label 8050 5650 0    60   ~ 0
PE5
Text Label 8050 5750 0    60   ~ 0
PE6
Text Label 8050 5850 0    60   ~ 0
PE7
Text Label 8050 5950 0    60   ~ 0
PE8
Text Label 8050 6050 0    60   ~ 0
PE9
Text Label 8050 6150 0    60   ~ 0
PE10
Text Label 8050 6250 0    60   ~ 0
PE11
Text Label 8050 6350 0    60   ~ 0
PE12
Text Label 8050 6450 0    60   ~ 0
PE13
Text Label 8050 6550 0    60   ~ 0
PE14
Text Label 8050 6650 0    60   ~ 0
PE15
Wire Wire Line
	8050 5350 8450 5350
Wire Wire Line
	8050 5450 8450 5450
Wire Wire Line
	8050 5550 8450 5550
Wire Wire Line
	8050 5650 8450 5650
Wire Wire Line
	8050 5750 8450 5750
NoConn ~ 8450 5350
NoConn ~ 8450 5450
NoConn ~ 8450 5550
Text Label 17850 6250 2    60   ~ 0
PB11
NoConn ~ 8450 6850
NoConn ~ 8450 6950
NoConn ~ 8450 7050
NoConn ~ 8450 7150
NoConn ~ 8450 7550
NoConn ~ 8450 7850
NoConn ~ 17450 4950
NoConn ~ 17450 7750
NoConn ~ 17450 8150
NoConn ~ 17450 5650
NoConn ~ 17450 5950
Text HLabel 6050 6050 0    60   Output ~ 0
PWM_AH
Text HLabel 6050 6250 0    60   Output ~ 0
PWM_BH
Text HLabel 6050 6450 0    60   Output ~ 0
PWM_CH
Text Label 6350 6050 0    60   ~ 0
TIM1_CH1_AL
Text Label 6350 6250 0    60   ~ 0
TIM1_CH2_BL
Text Label 6350 6450 0    60   ~ 0
TIM1_CH3_CL
Wire Wire Line
	6050 6050 8450 6050
Wire Wire Line
	6050 6250 8450 6250
Wire Wire Line
	6050 6450 8450 6450
Text Label 6350 5950 0    60   ~ 0
TIM1_CH1N_AL
Text HLabel 6050 5950 0    60   Output ~ 0
PWM_AL
Text HLabel 6050 6150 0    60   Output ~ 0
PWM_BL
Text HLabel 6050 6350 0    60   Output ~ 0
PWM_CL
Text Label 6350 6150 0    60   ~ 0
TIM1_CH2N_BL
Text Label 6350 6350 0    60   ~ 0
TIM1_CH3N_CL
Wire Wire Line
	6050 5950 8450 5950
Wire Wire Line
	6050 6150 8450 6150
Wire Wire Line
	6050 6350 8450 6350
Wire Wire Line
	17450 4250 17850 4250
Wire Wire Line
	17450 4350 17850 4350
Wire Wire Line
	17450 4450 17850 4450
NoConn ~ 17450 4250
NoConn ~ 17450 4350
NoConn ~ 17450 4450
Text Label 19150 3650 2    60   ~ 0
ENCODER_Z
Text Label 19150 6350 2    60   ~ 0
SW1
Text HLabel 6050 5850 0    60   Output ~ 0
AUX_L
Wire Wire Line
	6050 5850 8450 5850
Text HLabel 19450 5350 2    60   Output ~ 0
AUX_H
Wire Wire Line
	17450 5350 19450 5350
Text Label 6350 7450 0    60   ~ 0
RS485_RO
Text Label 6350 7350 0    60   ~ 0
RS485_DI
Text Label 6350 7250 0    60   ~ 0
RS485_DE
Wire Wire Line
	6350 7250 8450 7250
Wire Wire Line
	6350 7350 8450 7350
Wire Wire Line
	6350 7450 8450 7450
$Comp
L servo-sigma-48v-rescue:R-device R92
U 1 1 5CC5ED43
P 21900 3000
F 0 "R92" V 21980 3000 50  0000 C CNN
F 1 "10k" V 21900 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 21830 3000 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 21900 3000 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 21900 3000 60  0001 C CNN "Part"
F 5 "DigiKey" V 21900 3000 60  0001 C CNN "Provider"
	1    21900 3000
	1    0    0    -1  
$EndComp
$Comp
L servo-sigma-48v-rescue:R-device R91
U 1 1 5CC5F3D7
P 21700 3000
F 0 "R91" V 21780 3000 50  0000 C CNN
F 1 "10k" V 21700 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 21630 3000 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 21700 3000 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 21700 3000 60  0001 C CNN "Part"
F 5 "DigiKey" V 21700 3000 60  0001 C CNN "Provider"
	1    21700 3000
	1    0    0    -1  
$EndComp
$Comp
L servo-sigma-48v-rescue:R-device R90
U 1 1 5CC5F477
P 21500 3000
F 0 "R90" V 21580 3000 50  0000 C CNN
F 1 "10k" V 21500 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 21430 3000 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 21500 3000 50  0001 C CNN
F 4 "311-10.0KHRCT-ND" V 21500 3000 60  0001 C CNN "Part"
F 5 "DigiKey" V 21500 3000 60  0001 C CNN "Provider"
	1    21500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	21900 3150 21900 3400
Connection ~ 21900 3400
Wire Wire Line
	21900 3400 20800 3400
Wire Wire Line
	21700 3150 21700 3600
Connection ~ 21700 3600
Wire Wire Line
	21700 3600 20800 3600
Wire Wire Line
	21500 3150 21500 3700
Connection ~ 21500 3700
Wire Wire Line
	21500 3700 20800 3700
Wire Wire Line
	21500 2850 21500 2750
Wire Wire Line
	21500 2750 21700 2750
Wire Wire Line
	21900 2750 21900 2850
Wire Wire Line
	21700 2850 21700 2750
Connection ~ 21700 2750
Wire Wire Line
	21700 2750 21900 2750
Wire Wire Line
	21700 2750 21700 2600
$Comp
L servo-sigma-48v-rescue:R-device R5
U 1 1 5AB437C6
P 8800 2100
F 0 "R5" V 8850 2250 50  0000 C CNN
F 1 "21" V 8800 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8730 2100 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 8800 2100 50  0001 C CNN
F 4 "311-21.0HRCT-ND" V 8800 2100 60  0001 C CNN "Part"
F 5 "DigiKey" V 8800 2100 60  0001 C CNN "Provider"
	1    8800 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 1950 8450 2100
Wire Wire Line
	8650 2100 8450 2100
Connection ~ 8450 2100
Wire Wire Line
	8450 2100 8450 2250
Wire Wire Line
	8050 2100 8450 2100
Wire Wire Line
	8950 2100 9300 2100
Wire Wire Line
	17450 6050 17850 6050
NoConn ~ 17450 6050
Wire Wire Line
	17450 8250 17850 8250
Wire Wire Line
	17450 8350 17850 8350
NoConn ~ 17450 8250
NoConn ~ 17450 8350
Wire Wire Line
	17450 4150 19450 4150
$Comp
L Connector_Generic:Conn_01x05 J12
U 1 1 5D413095
P 5600 11750
F 0 "J12" H 5600 12050 50  0000 C CNN
F 1 "Conn_01x05" H 5600 11450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Horizontal" H 5600 11750 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705530002_sd.pdf" H 5600 11750 50  0001 C CNN
F 4 "WM4903-ND" H 5600 11750 50  0001 C CNN "Part"
F 5 "DigiKey" H 5600 11750 50  0001 C CNN "Provider"
	1    5600 11750
	1    0    0    1   
$EndComp
Wire Wire Line
	3600 11950 4000 11950
$Comp
L power:GND #PWR028
U 1 1 5D4FD9EB
P 4200 11250
F 0 "#PWR028" H 4200 11000 50  0001 C CNN
F 1 "GND" H 4200 11100 50  0000 C CNN
F 2 "" H 4200 11250 50  0001 C CNN
F 3 "" H 4200 11250 50  0001 C CNN
	1    4200 11250
	1    0    0    1   
$EndComp
Wire Wire Line
	5400 11650 4200 11650
Wire Wire Line
	4200 11650 4200 11250
$Comp
L power:+5V #PWR?
U 1 1 5D51FABF
P 4200 12200
AR Path="/58BF599E/5D51FABF" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5D51FABF" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 4200 12050 50  0001 C CNN
F 1 "+5V" V 4200 12400 50  0000 C CNN
F 2 "" H 4200 12200 50  0001 C CNN
F 3 "" H 4200 12200 50  0001 C CNN
	1    4200 12200
	1    0    0    1   
$EndComp
Wire Wire Line
	4200 12200 4200 11950
Wire Wire Line
	4200 11950 5400 11950
Text Label 6350 7650 0    60   ~ 0
ENCODER_DI
Text Label 6350 7750 0    60   ~ 0
ENCODER_RO
Text Label 6350 8050 0    60   ~ 0
ENCODER_DE
Wire Wire Line
	6350 7650 8450 7650
Wire Wire Line
	6350 7750 8450 7750
Wire Wire Line
	6350 8050 8450 8050
Wire Wire Line
	17450 7550 17850 7550
Wire Wire Line
	17450 7650 17850 7650
NoConn ~ 17450 7650
NoConn ~ 17450 7550
Wire Wire Line
	5400 11850 4000 11850
Wire Wire Line
	4000 11850 4000 11950
Connection ~ 3400 11650
Wire Wire Line
	5400 11750 4000 11750
Wire Wire Line
	4000 11750 4000 11650
Wire Wire Line
	3400 11650 4000 11650
Wire Wire Line
	4300 11550 5400 11550
Text Label 6350 8150 0    60   ~ 0
ENCODER_RS485_MCLR
Wire Wire Line
	6350 8150 8450 8150
$Comp
L servo-sigma-48v-rescue:C-device C55
U 1 1 5C675569
P 15750 1400
F 0 "C55" H 15600 1300 50  0000 L CNN
F 1 "100nF 50V" H 15300 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 15788 1250 50  0001 C CNN
F 3 "http://psearch.en.murata.com/capacitor/product/GCM188R71H104KA57%23.pdf" H 15750 1400 50  0001 C CNN
F 4 "490-4779-2-ND" H 15750 1400 60  0001 C CNN "Part"
F 5 "DigiKey" H 15750 1400 60  0001 C CNN "Provider"
	1    15750 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	15150 950  15750 950 
Wire Wire Line
	15750 950  15750 1250
Connection ~ 15150 950 
Wire Wire Line
	15150 1800 15750 1800
Wire Wire Line
	15750 1800 15750 1550
Connection ~ 15150 1800
$Comp
L Switch:SW_DIP_x04 SW1
U 1 1 5C6BDADE
P 13200 11550
F 0 "SW1" H 13200 12017 50  0000 C CNN
F 1 "SW_DIP_x04" H 13200 11926 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx04_Slide_Copal_CHS-04A_W5.08mm_P1.27mm_JPin" H 13200 11550 50  0001 C CNN
F 3 "http://www.grayhill.com/assets/1/7/DIP_Series_97.pdf" H 13200 11550 50  0001 C CNN
F 4 "GH7644CT-ND" H 13200 11550 50  0001 C CNN "Part"
F 5 "DigiKey" H 13200 11550 50  0001 C CNN "Provider"
	1    13200 11550
	1    0    0    -1  
$EndComp
Wire Wire Line
	12900 11550 12100 11550
Text Label 12100 11550 0    60   ~ 0
B_TERM_R120
Text Label 14200 11550 2    60   ~ 0
A_TERM_R120
Wire Wire Line
	14200 11550 13500 11550
Text Label 14200 11650 2    60   ~ 0
BOOT0
Wire Wire Line
	13500 11650 14200 11650
Wire Wire Line
	12100 11650 12900 11650
Wire Wire Line
	12100 11350 12750 11350
Wire Wire Line
	12900 11450 12750 11450
Wire Wire Line
	12750 11450 12750 11350
Connection ~ 12750 11350
Wire Wire Line
	12750 11350 12900 11350
Text Label 14200 11450 2    60   ~ 0
GPIO_CONF_2
Text Label 14200 11350 2    60   ~ 0
GPIO_CONF_1
Text Label 6600 5150 0    60   ~ 0
GPIO_CONF_2
Text Label 6600 5250 0    60   ~ 0
GPIO_CONF_1
Wire Wire Line
	6600 5150 8450 5150
Wire Wire Line
	6600 5250 8450 5250
Wire Wire Line
	13500 11350 14200 11350
Wire Wire Line
	13500 11450 14200 11450
Wire Wire Line
	2750 8550 3050 8550
Wire Wire Line
	2750 8850 3050 8850
Wire Wire Line
	2700 11650 3400 11650
Wire Wire Line
	2700 11950 3600 11950
Wire Wire Line
	2350 7800 3050 7800
Wire Wire Line
	3050 7800 3050 7900
Wire Wire Line
	3050 8200 3050 8550
Connection ~ 3050 8550
Wire Wire Line
	3050 8550 3450 8550
Wire Wire Line
	3050 9000 3050 8850
Connection ~ 3050 8850
Wire Wire Line
	3050 8850 3650 8850
$Comp
L power:GND #PWR0101
U 1 1 5CD706F1
P 3050 9400
F 0 "#PWR0101" H 3050 9150 50  0001 C CNN
F 1 "GND" H 3050 9250 50  0000 C CNN
F 2 "" H 3050 9400 50  0001 C CNN
F 3 "" H 3050 9400 50  0001 C CNN
	1    3050 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 9300 3050 9400
$Comp
L servo-sigma-48v-rescue:R-device R?
U 1 1 5CD9CA26
P 3050 8050
AR Path="/58BF599E/5CD9CA26" Ref="R?"  Part="1" 
AR Path="/58BE2779/5CD9CA26" Ref="R38"  Part="1" 
F 0 "R38" V 3130 8050 50  0000 C CNN
F 1 "N/A" V 3050 8050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2980 8050 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/PYu-RT_1-to-0.01_RoHS_L_7.pdf" H 3050 8050 50  0001 C CNN
F 4 "311-2606-2-ND" V 3050 8050 60  0001 C CNN "Part"
F 5 "DigiKey" V 3050 8050 60  0001 C CNN "Provider"
	1    3050 8050
	-1   0    0    1   
$EndComp
$Comp
L servo-sigma-48v-rescue:R-device R?
U 1 1 5CDC1D18
P 3050 9150
AR Path="/58BF599E/5CDC1D18" Ref="R?"  Part="1" 
AR Path="/58BE2779/5CDC1D18" Ref="R40"  Part="1" 
F 0 "R40" V 3130 9150 50  0000 C CNN
F 1 "N/A" V 3050 9150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2980 9150 50  0001 C CNN
F 3 "http://www.yageo.com/documents/recent/PYu-RT_1-to-0.01_RoHS_L_7.pdf" H 3050 9150 50  0001 C CNN
F 4 "311-2606-2-ND" V 3050 9150 60  0001 C CNN "Part"
F 5 "DigiKey" V 3050 9150 60  0001 C CNN "Provider"
	1    3050 9150
	-1   0    0    1   
$EndComp
Wire Wire Line
	6650 14400 7050 14400
Wire Wire Line
	7050 14050 7050 14400
Connection ~ 7050 14400
Wire Wire Line
	7050 14400 7350 14400
Wire Wire Line
	7050 14400 7050 14500
Wire Wire Line
	4800 14400 5200 14400
Wire Wire Line
	5200 14050 5200 14400
Connection ~ 5200 14400
Wire Wire Line
	5200 14400 5550 14400
Wire Wire Line
	5200 14400 5200 14500
Text Label 2850 6950 2    60   ~ 0
PWM_IN
$Comp
L power:GND #PWR?
U 1 1 5D4ACCCA
P 2850 6750
AR Path="/58BE27E6/5D4ACCCA" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5D4ACCCA" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 2850 6500 50  0001 C CNN
F 1 "GND" V 2850 6550 50  0000 C CNN
F 2 "" H 2850 6750 50  0001 C CNN
F 3 "" H 2850 6750 50  0001 C CNN
	1    2850 6750
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4ACCD0
P 2850 6850
AR Path="/58BE27E6/5D4ACCD0" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5D4ACCD0" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 2850 6700 50  0001 C CNN
F 1 "+5V" V 2850 7050 50  0000 C CNN
F 2 "" H 2850 6850 50  0001 C CNN
F 3 "" H 2850 6850 50  0001 C CNN
	1    2850 6850
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5D4ACCD8
P 1500 6850
AR Path="/58BE2779/5D4ACCD8" Ref="J4"  Part="1" 
AR Path="/58BE27E6/5D4ACCD8" Ref="J?"  Part="1" 
F 0 "J4" H 1500 7050 50  0000 C CNN
F 1 "Conn_01x03" H 1500 6650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 1500 6850 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705530002_sd.pdf" H 1500 6850 50  0001 C CNN
F 4 "WM4901-ND" H 1500 6850 50  0001 C CNN "Part"
F 5 "DigiKey" H 1500 6850 50  0001 C CNN "Provider"
	1    1500 6850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 6950 2850 6950
Wire Wire Line
	1700 6850 2850 6850
Wire Wire Line
	1700 6750 2850 6750
Text Label 19150 5550 2    60   ~ 0
PWM_IN
$Comp
L sigmadrone:FIDUCIAL F?
U 1 1 5D93B74A
P 21950 13950
AR Path="/58BE27E6/5D93B74A" Ref="F?"  Part="1" 
AR Path="/58BE2779/5D93B74A" Ref="F3"  Part="1" 
F 0 "F3" H 22128 14003 60  0000 L CNN
F 1 "FIDUCIAL" H 22128 13897 60  0000 L CNN
F 2 "Fiducials:Fiducial_0.5mm_Dia_1mm_Outer" H 21850 13650 60  0001 C CNN
F 3 "" H 21950 13950 60  0001 C CNN
	1    21950 13950
	1    0    0    -1  
$EndComp
$Comp
L sigmadrone:FIDUCIAL F?
U 1 1 5D93B751
P 21150 14350
AR Path="/58BE27E6/5D93B751" Ref="F?"  Part="1" 
AR Path="/58BE2779/5D93B751" Ref="F2"  Part="1" 
F 0 "F2" H 21328 14403 60  0000 L CNN
F 1 "FIDUCIAL" H 21328 14297 60  0000 L CNN
F 2 "Fiducials:Fiducial_0.5mm_Dia_1mm_Outer" H 21050 14050 60  0001 C CNN
F 3 "" H 21150 14350 60  0001 C CNN
	1    21150 14350
	1    0    0    -1  
$EndComp
$Comp
L sigmadrone:FIDUCIAL F?
U 1 1 5D93B758
P 21150 13950
AR Path="/58BE27E6/5D93B758" Ref="F?"  Part="1" 
AR Path="/58BE2779/5D93B758" Ref="F1"  Part="1" 
F 0 "F1" H 21328 14003 60  0000 L CNN
F 1 "FIDUCIAL" H 21328 13897 60  0000 L CNN
F 2 "Fiducials:Fiducial_0.5mm_Dia_1mm_Outer" H 21050 13650 60  0001 C CNN
F 3 "" H 21150 13950 60  0001 C CNN
	1    21150 13950
	1    0    0    -1  
$EndComp
$Comp
L sigmadrone:FIDUCIAL F?
U 1 1 5D93B75F
P 21950 14350
AR Path="/58BE27E6/5D93B75F" Ref="F?"  Part="1" 
AR Path="/58BE2779/5D93B75F" Ref="F4"  Part="1" 
F 0 "F4" H 22128 14403 60  0000 L CNN
F 1 "FIDUCIAL" H 22128 14297 60  0000 L CNN
F 2 "Fiducials:Fiducial_0.5mm_Dia_1mm_Outer" H 21850 14050 60  0001 C CNN
F 3 "" H 21950 14350 60  0001 C CNN
	1    21950 14350
	1    0    0    -1  
$EndComp
Text HLabel 19450 8050 2    60   Output ~ 0
DRV_SDI
Text HLabel 19450 7950 2    60   Input ~ 0
DRV_SDO
Text HLabel 19450 7850 2    60   Output ~ 0
DRV_CLK
Text HLabel 19450 3750 2    60   Output ~ 0
DRV2_CS
Text HLabel 6050 6650 0    60   Output ~ 0
DRV_CAL
Text HLabel 19450 7250 2    60   Input ~ 0
DRV_FAULT
Text HLabel 6050 6550 0    60   Output ~ 0
GATE_ENABLE
$Comp
L power:+3V3 #PWR?
U 1 1 5C976A74
P 1150 1000
AR Path="/58BE27E6/5C976A74" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5C976A74" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5C976A74" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 1150 850 50  0001 C CNN
F 1 "+3V3" H 1165 1173 50  0000 C CNN
F 2 "" H 1150 1000 50  0001 C CNN
F 3 "" H 1150 1000 50  0001 C CNN
	1    1150 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C9C94D3
P 4900 3950
AR Path="/58BE27E6/5C9C94D3" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5C9C94D3" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5C9C94D3" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 4900 3800 50  0001 C CNN
F 1 "+3V3" H 4915 4123 50  0000 C CNN
F 2 "" H 4900 3950 50  0001 C CNN
F 3 "" H 4900 3950 50  0001 C CNN
	1    4900 3950
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C9F1CC9
P 8450 1550
AR Path="/58BE27E6/5C9F1CC9" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5C9F1CC9" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5C9F1CC9" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 8450 1400 50  0001 C CNN
F 1 "+3V3" H 8465 1723 50  0000 C CNN
F 2 "" H 8450 1550 50  0001 C CNN
F 3 "" H 8450 1550 50  0001 C CNN
	1    8450 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CA1A305
P 12900 750
AR Path="/58BE27E6/5CA1A305" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CA1A305" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CA1A305" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 12900 600 50  0001 C CNN
F 1 "+3V3" H 12915 923 50  0000 C CNN
F 2 "" H 12900 750 50  0001 C CNN
F 3 "" H 12900 750 50  0001 C CNN
	1    12900 750 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CA42A19
P 21700 2600
AR Path="/58BE27E6/5CA42A19" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CA42A19" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CA42A19" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 21700 2450 50  0001 C CNN
F 1 "+3V3" H 21715 2773 50  0000 C CNN
F 2 "" H 21700 2600 50  0001 C CNN
F 3 "" H 21700 2600 50  0001 C CNN
	1    21700 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CA6B24D
P 2300 10750
AR Path="/58BE27E6/5CA6B24D" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CA6B24D" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CA6B24D" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 2300 10600 50  0001 C CNN
F 1 "+3V3" H 2315 10923 50  0000 C CNN
F 2 "" H 2300 10750 50  0001 C CNN
F 3 "" H 2300 10750 50  0001 C CNN
	1    2300 10750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CA93841
P 2350 7650
AR Path="/58BE27E6/5CA93841" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CA93841" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CA93841" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 2350 7500 50  0001 C CNN
F 1 "+3V3" H 2365 7823 50  0000 C CNN
F 2 "" H 2350 7650 50  0001 C CNN
F 3 "" H 2350 7650 50  0001 C CNN
	1    2350 7650
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CABC8DB
P 3250 13750
AR Path="/58BE27E6/5CABC8DB" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CABC8DB" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CABC8DB" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 3250 13600 50  0001 C CNN
F 1 "+3V3" H 3265 13923 50  0000 C CNN
F 2 "" H 3250 13750 50  0001 C CNN
F 3 "" H 3250 13750 50  0001 C CNN
	1    3250 13750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CAE5500
P 12100 11350
AR Path="/58BE27E6/5CAE5500" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CAE5500" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CAE5500" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 12100 11200 50  0001 C CNN
F 1 "+3V3" H 12115 11523 50  0000 C CNN
F 2 "" H 12100 11350 50  0001 C CNN
F 3 "" H 12100 11350 50  0001 C CNN
	1    12100 11350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CB0DCBA
P 12100 11650
AR Path="/58BE27E6/5CB0DCBA" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CB0DCBA" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CB0DCBA" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 12100 11500 50  0001 C CNN
F 1 "+3V3" H 12115 11823 50  0000 C CNN
F 2 "" H 12100 11650 50  0001 C CNN
F 3 "" H 12100 11650 50  0001 C CNN
	1    12100 11650
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CB0EF55
P 12650 2600
AR Path="/58BE27E6/5CB0EF55" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CB0EF55" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CB0EF55" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 12650 2450 50  0001 C CNN
F 1 "+3V3" H 12665 2773 50  0000 C CNN
F 2 "" H 12650 2600 50  0001 C CNN
F 3 "" H 12650 2600 50  0001 C CNN
	1    12650 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CB0F309
P 7150 2800
AR Path="/58BE27E6/5CB0F309" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CB0F309" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CB0F309" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 7150 2650 50  0001 C CNN
F 1 "+3V3" H 7165 2973 50  0000 C CNN
F 2 "" H 7150 2800 50  0001 C CNN
F 3 "" H 7150 2800 50  0001 C CNN
	1    7150 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5CB37A21
P 2350 2550
AR Path="/58BE27E6/5CB37A21" Ref="#PWR?"  Part="1" 
AR Path="/58BF664D/5CB37A21" Ref="#PWR?"  Part="1" 
AR Path="/58BE2779/5CB37A21" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 2350 2400 50  0001 C CNN
F 1 "+3V3" H 2365 2723 50  0000 C CNN
F 2 "" H 2350 2550 50  0001 C CNN
F 3 "" H 2350 2550 50  0001 C CNN
	1    2350 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 8250 8450 8250
Wire Wire Line
	6350 8350 8450 8350
Text HLabel 19450 3850 2    60   Output ~ 0
DRV1_CS
Wire Wire Line
	17450 6250 17850 6250
NoConn ~ 17450 6250
Wire Wire Line
	17450 7250 19450 7250
Wire Wire Line
	17450 3850 19450 3850
Wire Wire Line
	17450 3750 19450 3750
Wire Wire Line
	3450 9500 3450 10050
Wire Wire Line
	17450 5550 19150 5550
Wire Wire Line
	17450 7450 17850 7450
NoConn ~ 17450 7450
Wire Wire Line
	8050 6850 8450 6850
Wire Wire Line
	6050 6650 8450 6650
Wire Wire Line
	6050 6550 8450 6550
Wire Wire Line
	17450 5150 17850 5150
Wire Wire Line
	17450 5250 17850 5250
NoConn ~ 17450 5150
NoConn ~ 17450 5250
Wire Wire Line
	17450 7150 17850 7150
NoConn ~ 17450 7150
Wire Wire Line
	6350 7950 8450 7950
Wire Wire Line
	17450 7950 19450 7950
Wire Wire Line
	17450 8050 19450 8050
Wire Wire Line
	17450 7850 19450 7850
NoConn ~ 17450 6650
NoConn ~ 17450 6550
NoConn ~ 17450 6150
Wire Wire Line
	17450 6150 17850 6150
Wire Wire Line
	17450 6550 17850 6550
Wire Wire Line
	17450 6650 17850 6650
$EndSCHEMATC
