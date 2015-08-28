//

#define VMON_N A2  // AN8
#define VMON_E A1  // AN4
#define VMON_S A0  // AN2
#define VMON_W A12 // AN6   -- inaccessible 

#define SENSE_I_N A8  // AN9
#define SENSE_I_E A7  // AN5
#define SENSE_I_S A6  // AN3
#define SENSE_I_W A13 // AN7   -- inaccessable

#define SEL_N 35  // RD11
#define SEL_E 42  // RD8
#define SEL_S 43  // RD9
#define SEL_W 44  // RD10

void setup() {
  Serial.begin(57600);
  Serial.println("hello");
}

void loop() {
  int vn = analogRead(VMON_N);
  int ve = analogRead(VMON_E);
  digitalWrite(SEL_N,LOW);
  digitalWrite(SEL_E,LOW);
  int in = analogRead(SENSE_I_N);
  int ie = analogRead(SENSE_I_E);
  Serial.print("voltage: N"); Serial.print(vn);
  Serial.print("voltage: E"); Serial.print(ve);
  digitalWrite(SEL_N,HIGH);
  delay(200);
}




