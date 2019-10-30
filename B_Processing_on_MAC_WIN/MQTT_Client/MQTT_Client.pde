import mqtt.*;
MQTTClient client;
void setup() {
  frameRate(60);
  client = new MQTTClient(this);
  //client.connect("mqtt://scube.decade.tw", "clientID");
  //send to our self MQTT server by AWS
  client.connect("mqtt://newmedia:tnuapassword@broker.shiftr.io", "imYSLin");
  // got to https://shiftr.io/xlinx/xlinx_public
  client.subscribe("/device/artwork/HB/");
  // client.unsubscribe("/test");
}

void draw() {
  if (frameCount % 60 == 0) {
    thread("heartBeat");
  }
}
void heartBeat() {
  client.publish("/device/artwork/HB", "[id1]"+new java.util.Date());
}

void keyPressed() {
  client.publish("[TOPIC][keypress]", "[keyPressed][KEYCODE]="+keyCode);
}

void messageReceived(String topic, byte[] payload) {
  String in=new String(payload);
  println("new message: " + topic + " - " +in );
  xlinxSay(in);
}
void xlinxSay(String what) {
  Process p = exec("/usr/bin/say", what);
  //common below whole try catch u will get the multi thread with talk
  // or u can handle the say to a queue; then say one by one 
  try {
    int result = p.waitFor();
    println("the process returned " + result);
  } 
  catch (InterruptedException e) {
    println("[DECADE.TW][Err][exception]=");
  }
}
