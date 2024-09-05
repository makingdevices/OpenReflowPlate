/*
  Blink

  Turns an LED on for one second, then off for one second, repeatedly.

  Most Arduinos have an on-board LED you can control. On the UNO, MEGA and ZERO
  it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN is set to
  the correct LED pin independent of which board is used.
  If you want to know what pin the on-board LED is connected to on your Arduino
  model, check the Technical Specs of your board at:
  https://www.arduino.cc/en/Main/Products

  modified 8 May 2014
  by Scott Fitzgerald
  modified 2 Sep 2016
  by Arturo Guadalupi
  modified 8 Sep 2016
  by Colby Newman

  This example code is in the public domain.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/Blink
*/

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(PC0, OUTPUT);
  pinMode(PC1, OUTPUT);
  pinMode(PC2, OUTPUT);
  pinMode(PC13, OUTPUT);
  pinMode(PC9, INPUT);
  pinMode(PC10, INPUT);
  pinMode(PC12, INPUT);
}

int buttonState_left = 0;
int buttonState_right = 0;
int buttonState_back = 0;

// the loop function runs over and over again forever
void loop() {
  buttonState_left = digitalRead(PC9);
  buttonState_right = digitalRead(PC10);
  buttonState_back = digitalRead(PC12);
  if(buttonState_left == LOW){
    digitalWrite(PC0, HIGH);  // turn the LED on (HIGH is the voltage level)
  } else {
     digitalWrite(PC0, LOW); 
  }
  if(buttonState_right == LOW){
    digitalWrite(PC1, HIGH);  // turn the LED on (HIGH is the voltage level)
  } else {
     digitalWrite(PC1, LOW); 
  }
  if(buttonState_back == LOW){
    digitalWrite(PC13, HIGH);  // turn the LED on (HIGH is the voltage level)
  } else {
     digitalWrite(PC13, LOW); 
  }
  digitalWrite(PC2, HIGH);  // turn the LED on (HIGH is the voltage level)
  delay(100); 
  
  buttonState_left = digitalRead(PC9);
  if(buttonState_left == LOW){
    digitalWrite(PC0, HIGH);  // turn the LED on (HIGH is the voltage level)
  } else {
     digitalWrite(PC0, LOW); 
  }
    if(buttonState_right == LOW){
    digitalWrite(PC1, HIGH);  // turn the LED on (HIGH is the voltage level)
  } else {
     digitalWrite(PC1, LOW); 
  }            // wait for a second
  if(buttonState_back == LOW){
    digitalWrite(PC13, HIGH);  // turn the LED on (HIGH is the voltage level)
  } else {
     digitalWrite(PC13, LOW); 
  }
  digitalWrite(PC2, LOW);   // turn the LED off by making the voltage LOW
  delay(100);                      // wait for a second
}
