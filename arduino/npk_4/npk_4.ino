#include <SoftwareSerial.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
 
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);
 
#define RE 8
#define DE 7
 

const byte nitro[] = {0x01,0x03, 0x00, 0x1e, 0x00, 0x01, 0xe4, 0x0c};
const byte phos[] = {0x01,0x03, 0x00, 0x1f, 0x00, 0x01, 0xb5, 0xcc};
const byte pota[] = {0x01,0x03, 0x00, 0x20, 0x00, 0x01, 0x85, 0xc0};

int i = 0; 
byte values[11];
SoftwareSerial mod(2,3);


void setup() {
  Serial.begin(115200);
  mod.begin(9600);

  pinMode(RE, OUTPUT);
  pinMode(DE, OUTPUT);

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  delay(9);

  display.clearDisplay();
  display.setCursor(25, 10);
  display.setTextSize(2);
  display.setTextColor(WHITE);

  display.println("NPK PoC");

  display.setCursor(25, 35);
  display.setTextSize(1);

  display.print("Initializing");
  display.display();

  delay(9);

  while ( !Serial ) {}
  }
void loop() {
  if ( Serial.available() ) {
    byte val1,val2,val3;
    int i = Serial.read() - 48;
    display.clearDisplay();
    if ( i == 1 ) {
      display.setCursor(25, 15);
      display.setTextSize(1);
      display.setTextColor(WHITE);
      display.println("SENDING ...");
      display.setCursor(25, 35);
      display.setTextSize(1);
      display.println("NITROGEN");
      display.display();
      delay(250);
      val1 = nitrogen();
      Serial.print("Nitrogen: ");
      Serial.println(val1);
    }
    if ( i == 2 ) {
      display.setCursor(25, 15);
      display.setTextSize(1);
      display.setTextColor(WHITE);
      display.println("SENDING ...");
      display.setCursor(25, 35);
      display.setTextSize(1);
      display.println("PHOSPHOROUS");
      display.display();
      delay(250);
      val2 = phosphorous();
      Serial.print("Phosphorous: ");
      Serial.println(val2);
    }
    if ( i == 3 ) {
      display.setCursor(25, 15);
      display.setTextSize(1);
      display.setTextColor(WHITE);
      display.println("SENDING ...");
      display.setCursor(25, 35);
      display.setTextSize(1);
      display.println("POTASSIUM");
      display.display();
      delay(250);
      val3 = potassium();
      Serial.print("Potassium: ");
      Serial.println(val3);
    }
    i = 0;    
  }
}

byte nitrogen(){
  digitalWrite(DE,HIGH);
  digitalWrite(RE,HIGH);
  delay(10);
  if(mod.write(nitro,sizeof(nitro))==8){
    digitalWrite(DE,LOW);
    digitalWrite(RE,LOW);
    for(byte i=0;i<7;i++){
    // Serial.print(mod.read(),HEX);
    values[i] = mod.read();
    // Serial.print(values[i],HEX);
    }
    Serial.println();
  }
  return values[4];
}
 
byte phosphorous(){
  digitalWrite(DE,HIGH);
  digitalWrite(RE,HIGH);
  delay(10);
  if(mod.write(phos,sizeof(phos))==8){
    digitalWrite(DE,LOW);
    digitalWrite(RE,LOW);
    for(byte i=0;i<7;i++){
    // Serial.print(mod.read(),HEX);
    values[i] = mod.read();
    // Serial.print(values[i],HEX);
    }
    Serial.println();
  }
  return values[4];
}
 
byte potassium(){
  digitalWrite(DE,HIGH);
  digitalWrite(RE,HIGH);
  delay(10);
  if(mod.write(pota,sizeof(pota))==8){
    digitalWrite(DE,LOW);
    digitalWrite(RE,LOW);
    for(byte i=0;i<7;i++){
    // Serial.print(mod.read(),HEX);
    values[i] = mod.read();
    // Serial.print(values[i],HEX);
    }
    Serial.println();
  }
  return values[4];
}