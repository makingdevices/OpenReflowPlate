EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Open Reflow Plate"
Date "2024-01-04"
Rev "V0.1"
Comp "MakingDevices"
Comment1 "Rubén G. S."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32L4:STM32L476RGTx U1
U 1 1 659695D1
P 9150 2800
F 0 "U1" H 9150 911 50  0000 C CNN
F 1 "STM32L476RGTx" H 9150 820 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 8550 1100 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00108832.pdf" H 9150 2800 50  0001 C CNN
	1    9150 2800
	1    0    0    -1  
$EndComp
Text GLabel 9950 2300 2    50   Input ~ 0
USB_D-
Text GLabel 9950 2400 2    50   Input ~ 0
USB_D+
Text GLabel 10000 2500 2    50   Input ~ 0
SWDIO
Text GLabel 10000 2600 2    50   Input ~ 0
SWCLK
Wire Wire Line
	9950 2300 9850 2300
Wire Wire Line
	9850 2400 9950 2400
Wire Wire Line
	9850 2500 10000 2500
Wire Wire Line
	9850 2600 10000 2600
NoConn ~ 8450 2400
NoConn ~ 8450 2500
$Comp
L power:+3.3V #PWR0101
U 1 1 6596EBA1
P 9200 800
F 0 "#PWR0101" H 9200 650 50  0001 C CNN
F 1 "+3.3V" H 9215 973 50  0000 C CNN
F 2 "" H 9200 800 50  0001 C CNN
F 3 "" H 9200 800 50  0001 C CNN
	1    9200 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1000 9450 900 
Wire Wire Line
	9450 900  9350 900 
Wire Wire Line
	8950 900  8950 1000
Wire Wire Line
	9050 1000 9050 900 
Connection ~ 9050 900 
Wire Wire Line
	9050 900  8950 900 
Wire Wire Line
	9150 1000 9150 900 
Connection ~ 9150 900 
Wire Wire Line
	9150 900  9050 900 
Wire Wire Line
	9250 1000 9250 900 
Connection ~ 9250 900 
Wire Wire Line
	9250 900  9200 900 
Wire Wire Line
	9350 1000 9350 900 
Connection ~ 9350 900 
Wire Wire Line
	9350 900  9250 900 
Wire Wire Line
	9200 900  9200 800 
Connection ~ 9200 900 
Wire Wire Line
	9200 900  9150 900 
Wire Wire Line
	8950 4600 8950 4700
Wire Wire Line
	8950 4700 9050 4700
Wire Wire Line
	9050 4600 9050 4700
$Comp
L power:GND #PWR0102
U 1 1 65970FF5
P 9150 4850
F 0 "#PWR0102" H 9150 4600 50  0001 C CNN
F 1 "GND" H 9155 4677 50  0000 C CNN
F 2 "" H 9150 4850 50  0001 C CNN
F 3 "" H 9150 4850 50  0001 C CNN
	1    9150 4850
	1    0    0    -1  
$EndComp
Connection ~ 9050 4700
Wire Wire Line
	9150 4700 9150 4850
Wire Wire Line
	9050 4700 9150 4700
Wire Wire Line
	9150 4700 9250 4700
Connection ~ 9150 4700
Wire Wire Line
	9150 4600 9150 4700
Wire Wire Line
	9250 4700 9350 4700
Connection ~ 9250 4700
Wire Wire Line
	9250 4600 9250 4700
Wire Wire Line
	9350 4700 9350 4600
$Comp
L power:+3.3V #PWR0103
U 1 1 659794A4
P 7050 750
F 0 "#PWR0103" H 7050 600 50  0001 C CNN
F 1 "+3.3V" H 7065 923 50  0000 C CNN
F 2 "" H 7050 750 50  0001 C CNN
F 3 "" H 7050 750 50  0001 C CNN
	1    7050 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 65979AA7
P 7050 1450
F 0 "#PWR0104" H 7050 1200 50  0001 C CNN
F 1 "GND" H 7055 1277 50  0000 C CNN
F 2 "" H 7050 1450 50  0001 C CNN
F 3 "" H 7050 1450 50  0001 C CNN
	1    7050 1450
	1    0    0    -1  
$EndComp
$Comp
L Library_Loader:C0805C475M8RACTU C1
U 1 1 6597DF52
P 6500 1350
F 0 "C1" V 6796 1222 50  0000 R CNN
F 1 "4u7" V 6705 1222 50  0000 R CNN
F 2 "CAPC2012X140N" H 6850 1400 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA8/2444426.pdf" H 6850 1300 50  0001 L CNN
F 4 "Cap Ceramic 4.7uF 10V X7R 20% Pad SMD 0805 125C T/R" H 6850 1200 50  0001 L CNN "Description"
F 5 "1.4" H 6850 1100 50  0001 L CNN "Height"
F 6 "Kemet" H 6850 800 50  0001 L CNN "Manufacturer_Name"
F 7 "C0805C475M8RACTU" H 6850 700 50  0001 L CNN "Manufacturer_Part_Number"
	1    6500 1350
	0    -1   -1   0   
$EndComp
$Comp
L Library_Loader:C0805C475M8RACTU C2
U 1 1 65980EE7
P 6900 1350
F 0 "C2" V 7196 1222 50  0000 R CNN
F 1 "100nF" V 7105 1222 50  0000 R CNN
F 2 "CAPC2012X140N" H 7250 1400 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA8/2444426.pdf" H 7250 1300 50  0001 L CNN
F 4 "Cap Ceramic 4.7uF 10V X7R 20% Pad SMD 0805 125C T/R" H 7250 1200 50  0001 L CNN "Description"
F 5 "1.4" H 7250 1100 50  0001 L CNN "Height"
F 6 "Kemet" H 7250 800 50  0001 L CNN "Manufacturer_Name"
F 7 "C0805C475M8RACTU" H 7250 700 50  0001 L CNN "Manufacturer_Part_Number"
	1    6900 1350
	0    -1   -1   0   
$EndComp
$Comp
L Library_Loader:C0805C475M8RACTU C3
U 1 1 65987469
P 7200 1350
F 0 "C3" V 7496 1222 50  0000 R CNN
F 1 "100nF" V 7405 1222 50  0000 R CNN
F 2 "CAPC2012X140N" H 7550 1400 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA8/2444426.pdf" H 7550 1300 50  0001 L CNN
F 4 "Cap Ceramic 4.7uF 10V X7R 20% Pad SMD 0805 125C T/R" H 7550 1200 50  0001 L CNN "Description"
F 5 "1.4" H 7550 1100 50  0001 L CNN "Height"
F 6 "Kemet" H 7550 800 50  0001 L CNN "Manufacturer_Name"
F 7 "C0805C475M8RACTU" H 7550 700 50  0001 L CNN "Manufacturer_Part_Number"
	1    7200 1350
	0    -1   -1   0   
$EndComp
$Comp
L Library_Loader:C0805C475M8RACTU C4
U 1 1 65987B94
P 7650 1350
F 0 "C4" V 7946 1222 50  0000 R CNN
F 1 "100nF" V 7855 1222 50  0000 R CNN
F 2 "CAPC2012X140N" H 8000 1400 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA8/2444426.pdf" H 8000 1300 50  0001 L CNN
F 4 "Cap Ceramic 4.7uF 10V X7R 20% Pad SMD 0805 125C T/R" H 8000 1200 50  0001 L CNN "Description"
F 5 "1.4" H 8000 1100 50  0001 L CNN "Height"
F 6 "Kemet" H 8000 800 50  0001 L CNN "Manufacturer_Name"
F 7 "C0805C475M8RACTU" H 8000 700 50  0001 L CNN "Manufacturer_Part_Number"
	1    7650 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 750  7050 800 
Wire Wire Line
	7050 800  7200 800 
Wire Wire Line
	7650 800  7650 850 
Wire Wire Line
	7050 800  6900 800 
Wire Wire Line
	6500 800  6500 850 
Connection ~ 7050 800 
Wire Wire Line
	6900 850  6900 800 
Connection ~ 6900 800 
Wire Wire Line
	6900 800  6500 800 
Wire Wire Line
	7200 850  7200 800 
Connection ~ 7200 800 
Wire Wire Line
	7200 800  7650 800 
Wire Wire Line
	7050 1450 7050 1400
Wire Wire Line
	7050 1400 7200 1400
Wire Wire Line
	7650 1400 7650 1350
Wire Wire Line
	7050 1400 6900 1400
Wire Wire Line
	6500 1400 6500 1350
Connection ~ 7050 1400
Wire Wire Line
	6900 1350 6900 1400
Connection ~ 6900 1400
Wire Wire Line
	6900 1400 6500 1400
Wire Wire Line
	7200 1350 7200 1400
Connection ~ 7200 1400
Wire Wire Line
	7200 1400 7650 1400
NoConn ~ 8450 1200
$Comp
L Library_Loader:ERJP6WF1303V R1
U 1 1 65991F78
P 8150 2150
F 0 "R1" V 8546 2072 50  0000 R CNN
F 1 "10K" V 8455 2072 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8700 2200 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/7708607P" H 8700 2100 50  0001 L CNN
F 4 "Panasonic ERJP6W Series Thick Film Surface Mount Fixed Resistor 0805 Case 130k +/-1% 0.5W +/-200ppm/C" H 8700 2000 50  0001 L CNN "Description"
F 5 "0.75" H 8700 1900 50  0001 L CNN "Height"
F 6 "7708607P" H 8700 1800 50  0001 L CNN "RS Part Number"
F 7 "http://uk.rs-online.com/web/p/products/7708607P" H 8700 1700 50  0001 L CNN "RS Price/Stock"
F 8 "Panasonic" H 8700 1600 50  0001 L CNN "Manufacturer_Name"
F 9 "ERJP6WF1303V" H 8700 1500 50  0001 L CNN "Manufacturer_Part_Number"
	1    8150 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 1400 8150 1400
Wire Wire Line
	8150 1400 8150 1450
$Comp
L power:GND #PWR0105
U 1 1 65994367
P 8150 2200
F 0 "#PWR0105" H 8150 1950 50  0001 C CNN
F 1 "GND" H 8155 2027 50  0000 C CNN
F 2 "" H 8150 2200 50  0001 C CNN
F 3 "" H 8150 2200 50  0001 C CNN
	1    8150 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2200 8150 2150
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 6599638D
P 8150 1250
F 0 "JP1" V 8104 1318 50  0000 L CNN
F 1 "SolderJumper_2_Open" V 8195 1318 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 8150 1250 50  0001 C CNN
F 3 "~" H 8150 1250 50  0001 C CNN
	1    8150 1250
	0    1    1    0   
$EndComp
Connection ~ 8150 1400
$Comp
L power:+3.3V #PWR0106
U 1 1 65996FB5
P 8150 1100
F 0 "#PWR0106" H 8150 950 50  0001 C CNN
F 1 "+3.3V" H 8165 1273 50  0000 C CNN
F 2 "" H 8150 1100 50  0001 C CNN
F 3 "" H 8150 1100 50  0001 C CNN
	1    8150 1100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
