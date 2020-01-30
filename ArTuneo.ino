const int ledCount=13;

int ledPins[]={
  2,3,4,5,6,7,8,9,10,11,12,13,14
};

void setup() {
  //int Freq = Serial.read();
  //int level = map(Freq, 0, 180, 2, 14);
    //pinMode(level, OUTPUT);
    for(int thisLed = 0; thisLed<ledCount; thisLed++){
    pinMode(ledPins[thisLed], OUTPUT);
    pinMode(14,255);
    }
    Serial.begin(9600);
  
}
void loop() {
  
  int Freq = Serial.read();
  int level = map(Freq, 25, 260, 2, 14);
  digitalWrite(level, HIGH);
    if(Freq!=0){
      delay(20);
        if(Freq!=0){
          for(int thisLed = 0; thisLed<ledCount; thisLed++){
          digitalWrite(ledPins[thisLed], LOW);
          }
        }
      }
    
}

         // if(Freq=Freq){
           // delay(40);{
        //if(Freq=Freq){
    //if(level>140&&level<162){
      //delay(200);
     // if(level>140&&level<162){
      //  digitalWrite(7,HIGH);
       // delay(90);
       // digitalWrite(7,LOW);
      //  delay(50);
      //  digitalWrite(7,HIGH);
      //  delay(90);
       // digitalWrite(7,LOW);
      //  delay(50);
    //}
  //}
