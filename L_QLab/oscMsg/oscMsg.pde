import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",53000);
}


void draw() {
  background(0);  
}
boolean x=false;
void mousePressed() {
  x=!x;
  OscMessage myMessage = new OscMessage("/cue/w1sec/"+(x?"start":"stop"));
  oscP5.send(myMessage, myRemoteLocation); 
}
void oscEvent(OscMessage theOscMessage) {
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
