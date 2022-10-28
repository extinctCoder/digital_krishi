int i = 0;
void setup() {
  Serial.begin(115200);
  while ( !Serial ) {}
  }
void loop() {
  if ( Serial.available() ) {
    int i = Serial.read() - 48;
    if ( i == 1 ) {
      Serial.println("Nitrogen: ");
    }
    if ( i == 2 ) {
      Serial.println("Phosphorous: ");
    }
    if ( i == 3 ) {
      Serial.println("Potassium: ");
    }
    i = 0;    
  }
}
