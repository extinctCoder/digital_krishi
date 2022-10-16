int i = 0;
  
  // the setup function runs once when you press reset or power the board
  void setup() {
    // initialize digital pin 13 as an output.
    pinMode(13, OUTPUT);
    Serial.begin(115200);
    while ( !Serial ) {
    }
    digitalWrite(13, HIGH);   // turn the LED on (HIGH is the voltage level)
  }
   
  // the loop function runs over and over again forever
  void loop() {    
    if ( Serial.available() ) {
      if ( i == 0 ) {
        digitalWrite(13, HIGH);   // turn the LED on (HIGH is the voltage level)
        i = 1;
      } else {
        digitalWrite(13, LOW);    // turn the LED off by making the voltage LOW
        i = 0;
      }
      Serial.write( Serial.read() );
    }    
  }
