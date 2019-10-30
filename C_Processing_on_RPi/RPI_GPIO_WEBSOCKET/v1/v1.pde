import processing.io.*;
import hypermedia.net.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;
import websockets.*;

WebsocketClient wsc;
UDP udp;  // define the UDP object

String ourDomain="scube.decade.tw";
String ourWS_URL="ws://"+ourDomain+":7777/tnua_class_decade_tw";
int scubeDomainPort=7000;
boolean led=false;
boolean INPUT_bool=false;
long previousMillis = 0;
long interval = 500;   
JSONArray values;
color bgcolor=color(0);
int people=0;
JSONObject json;
JSONObject rx_json;
SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd_HH");
Date current = new Date();
InetAddress myip;// = InetAddress.getLocalHost();
String hostnameX="rpi";

java.util.Timer timer60000ms = new java.util.Timer(true);
java.util.Timer timer1000ms = new java.util.Timer(true);
java.util.Timer timer500ms = new java.util.Timer(true);

 
java.util.TimerTask task1000 = new java.util.TimerTask() {
  public void run() {
    udp.send(json.toString(), ourDomain, scubeDomainPort);
    if (!INPUT_bool) {
      flipflopLED();
    }
  }
}; 
void flipflopLED() {
  led=!led;
  if (led) {
    GPIO.digitalWrite(4, GPIO.LOW);
  } else {
    GPIO.digitalWrite(4, GPIO.HIGH);
  }
}


void setup() {
  wsc= new WebsocketClient(this, ourWS_URL);
  
  GPIO.pinMode(4, GPIO.OUTPUT);
  GPIO.pinMode(5, GPIO.INPUT);
  GPIO.attachInterrupt(5, this, "pinEvent", GPIO.RISING);

  timer1000ms.schedule(task1000, 0, 1000);
  
}

void webSocketEvent(String msg) {
  println(new Date()+"[RX][WS][Boardcast]"+msg);
  try {
    rx_json = parseJSONObject(msg);
    String cmd=rx_json.getString("text");
    if (cmd.startsWith("/cue/rpi")) {
      flipflopLED();
    }
  }
  catch(Exception e) {
    println("[][X][JSon]"+msg);
  }
}


void draw() {
  background(0);

  INPUT_bool=GPIO.digitalRead(5)== GPIO.HIGH?false:true;
  json.setBoolean("IR", INPUT_bool);
  if (INPUT_bool) {
    fill(0, 255, 255);
  } else {
    fill(255, 0, 255);
  }
  stroke(255);
  ellipse(width/3, height/3, width*0.35, height*0.35);
  fill(bgcolor);
  ellipse(width/3*2, height/3*2, width*0.35, height*0.35);
}