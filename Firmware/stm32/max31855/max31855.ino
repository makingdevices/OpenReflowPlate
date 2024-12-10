#define TIMER_INTERRUPT_DEBUG         0
#define _TIMERINTERRUPT_LOGLEVEL_     0

#include "STM32TimerInterrupt.h"
#include "STM32_ISR_Timer.h"
// inslude the SPI library:
#include <SPI.h>
#include <SoftwareSerial.h>

#define TIMER_INTERVAL_MS         100
#define HW_TIMER_INTERVAL_MS      50

// Init STM32 timer TIM1
STM32Timer ITimer(TIM1);

// Init STM32_ISR_Timer
// Each STM32_ISR_Timer can service 16 different ISR-based timers
STM32_ISR_Timer ISR_Timer;

#define TIMER_INTERVAL_0_50mS         1L
#define TIMER_INTERVAL_0_5S           500L
#define TIMER_INTERVAL_1S             1000L
#define TIMER_INTERVAL_1_5S           1500L
#define DELAYVAL 500

//For display:
int digit_display = 0; //Display digit at the moment 
char const vector[] = {0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,0b01111101,0b00000111,0b01111111,0b01100111,0b001000000,0b01111001}; //Numbers 8-segment codification
char const vector_menu[3][4] = {{0b01101101,0b00111111,0b00111000,0b00111111},{0b01110111,0b00011100,0b00110001,0b00111111},{0b01000000,0b01110011,0b00111001,0b01000000}};  // SOLO, AUTO, PC
int number_display[] = {0,0,0,0}; //Number Storage
int temperature = 0;

// set pin 10 as the slave select for the digital pot:
const int slaveSelectPin = PA4;
const int led_life = PC2;
const int bt_left = PC9;
const int bt_right = PC10;
const int bt_back = PC12;
const int bt_enter = PC11;
const int displayPins[] = {PB4,PB5,PB6,PB7,PB8,PB9,PB10,PB11};
int mode = 0; // 0 = menu, 1 = activated
int menu = 0; // 0 = FIX, 1 = AUTO, 2 = PC.
int menu_lvl = 0; // 0 first lvl, 1 to set temperature

void TimerHandler()
{
  ISR_Timer.run();
}

void inttotemp(int temp){
  number_display[3] = temp % 10;
  number_display[2] = (temp / 10) % 10;
  number_display[1] = (temp / 100) % 10;
  number_display[0] = (temp / 1000) % 10;
}

int nr_digit(int digit){
  		switch(digit){  //Print the numbers over the display
			case 3:		//we light the correct display
				digitalWrite(PB0, LOW);
        digitalWrite(PB1, LOW);
        digitalWrite(PB2, LOW);
        digitalWrite(PB3, HIGH);
				digit = 0;
				break;
			case 0:
				digitalWrite(PB0, HIGH);
        digitalWrite(PB1, LOW);
        digitalWrite(PB2, LOW);
        digitalWrite(PB3, LOW);
				digit = 1;
				break;
			case 1:
				digitalWrite(PB0, LOW);
        digitalWrite(PB1, HIGH);
        digitalWrite(PB2, LOW);
        digitalWrite(PB3, LOW);
				digit = 2;
				break;
			case 2:
				digitalWrite(PB0, LOW);
        digitalWrite(PB1, LOW);
        digitalWrite(PB2, HIGH);
        digitalWrite(PB3, LOW);
				digit = 3;
				break;
			default:
				break;
		}
    return digit;
}

void print_display(int number){
  for(int i=0;i<8;i++) {
    digitalWrite(displayPins[i], (vector[number]&(0b00000001<<i))>>i);
  }
}

void print_menu_display(int number){
  for(int i=0;i<8;i++) {
    digitalWrite(displayPins[i], (vector_menu[menu-1][number]&(0b00000001<<i))>>i);
  }
}

int buttonstate = 0;  // variable for reading the pushbutton status
void TimerInterrupt()
{
  if(mode==1 || (mode==0 && menu == 0)){
    inttotemp(temperature);
    print_display(number_display[digit_display]);
  } else {
    print_menu_display(digit_display);
  }
  digit_display = nr_digit(digit_display);

  if(digitalRead(bt_right) == LOW && buttonstate==0){
    buttonstate=1;
    if(menu_lvl==0 && menu < 3) menu++;
    else if(menu_lvl==0) menu = 0;
  }
  if(digitalRead(bt_left) == LOW && buttonstate==0){
    buttonstate=1;
    if(menu_lvl==0 && menu > 0) menu--;
    else if(menu_lvl==0) menu = 3;
  }
  if(digitalRead(bt_back) == LOW && buttonstate==0){
    buttonstate=1;
    menu = 0;
  }
  if(digitalRead(bt_right) == HIGH && digitalRead(bt_left) == HIGH && digitalRead(bt_back) == HIGH){
    buttonstate=0;
  }
}
// Create a new SPI port with:
// Pin 2 = MOSI,
// Pin 3 = MISO,
// Pin 4 = SCK
// Set up a new SoftwareSerial object
void setup() {
  // open the serial port at 9600 bps:
  //Serial.begin(9600);
  
  SPI.begin();
  // set the slaveSelectPin as an output:
  pinMode(slaveSelectPin, OUTPUT);
  pinMode(PB0, OUTPUT);
  pinMode(PB1, OUTPUT);
  pinMode(PB2, OUTPUT);
  pinMode(PB3, OUTPUT);
  pinMode(PB14, OUTPUT);
  pinMode(PB15, OUTPUT);

  pinMode(bt_left, INPUT);
  pinMode(bt_right, INPUT);
  pinMode(bt_back, INPUT);
  pinMode(bt_enter, INPUT);
  
  for(int i=0;i<8;i++) {
    pinMode(displayPins[i], OUTPUT);
  }
  pinMode(led_life, OUTPUT);
  // Interval in microsecs
  if (ITimer.attachInterruptInterval(HW_TIMER_INTERVAL_MS * 100, TimerHandler))
  {
    
  }

  // Just to demonstrate, don't use too many ISR Timers if not absolutely necessary
  // You can use up to 16 timer for each ISR_Timer
  ISR_Timer.setInterval(TIMER_INTERVAL_0_50mS,  TimerInterrupt);
}

int incomingByte = 0;
void loop() {
  // go through the six channels of the digital pot:
  temperature = MAX31855K();
  delay(DELAYVAL);
  digitalWrite(led_life, !digitalRead(led_life));
  digitalWrite(PB14, HIGH);
  digitalWrite(PB15, HIGH);
  //Serial.print(" External_temp: ");
  //Serial.println(temperature);
}

int MAX31855K(void) {
  int var1=0, var2=0, var3=0, var4=0, var5= 0;
  double external_temp = 0;
  double internal_temp = 0;

  // take the SS pin low to select the chip:
  digitalWrite(slaveSelectPin, LOW);
  delay(500);
  var1 = SPI.transfer(0xFF);
  var2 = SPI.transfer(0xFF);
  var3 = SPI.transfer(0xFF);
  var4 = SPI.transfer(0xFF);
  var5 = SPI.transfer(0xFF);
  // take the SS pin high to de-select the chip:
  digitalWrite(slaveSelectPin, HIGH);
  /*
  Serial.println("Let's begin");
  Serial.println(var1);
  Serial.println(var2);
  Serial.println(var3);
  Serial.println(var4);
  Serial.println(var5);
*/
  internal_temp = (var3<<4) | (var4&0xF0)>>4;
  internal_temp = internal_temp*0.0625;
  external_temp = var1<<6 | (var2&0b11111100)>>2;
  external_temp = external_temp * 0.25;

  return external_temp;
}
