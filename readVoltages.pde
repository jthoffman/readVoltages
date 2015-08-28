#define VMON_N A2  // AN8
#define VMON_E A1  // AN4
#define VMON_S A0  // AN2
#define VMON_W A12 // AN6

#define SENSE_I_N A8  // AN9
#define SENSE_I_E A7  // AN5
#define SENSE_I_S A6  // AN3
#define SENSE_I_W A13 // AN7

#define SEL_N 35  // RD11
#define SEL_E 42  // RD8
#define SEL_S 43  // RD9
#define SEL_W 44  // RD10

#define NORTH 0
#define EAST 1
#define SOUTH 2
#define WEST 3

int VMON[] = {VMON_N, VMON_E, VMON_S, VMON_W};
int SENSE_I[] = {SENSE_I_N, SENSE_I_E, SENSE_I_S, SENSE_I_W};
int SEL[] = {SEL_N, SEL_E, SEL_S, SEL_W};
String DIRS[] = {"North","East","South","West"};

void setup() {
  Serial.begin(57600);
  Serial.println("Read voltages and short-circuit currents");
}

void loop() {
  for (int i = 0; i<4; i++) { // loop through the four directions
    int vmon = analogRead(VMON[i]); // read voltage monitor
    digitalWrite(SEL[i],HIGH); // turn on 20-ohm resistor!
    int sense_i = analogRead(SENSE_I[i]); // short-circuit current
    digitalWrite(SEL[i],LOW); // turn off 20-ohm resistor!
    Serial.print(DIRS[i]); // print the word for the direction
    Serial.print(" V:");
    Serial.print(vmon);
    Serial.print(" C:");
    Serial.print(sense_i);
    Serial.print("  ");
  }
  Serial.println(); // print a newline
  delay(250); // limit the rate of serial printing
}
