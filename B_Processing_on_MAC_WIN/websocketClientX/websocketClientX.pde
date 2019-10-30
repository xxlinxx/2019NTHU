import websockets.*;
import hypermedia.net.*;
WebsocketClient wsc;
UDP udp;
JSONObject rx_json;
long now=0;
java.util.Timer timer1000ms = new java.util.Timer(true);
void setup() {
  size(500, 500);
  setupWave();
  udp = new UDP( this, 7000 );
  udp.log( false );
  udp.listen( true );
  wsc= new WebsocketClient(this, "ws://scube.decade.tw:7777/tnua_class_decade_tw");
  //timer1000ms.schedule(task1000, 0, 999);
}
color c=0;
void draw() {

  drawWave();
}
void receive(byte[] what) {
  String RXString = new String(what).trim();
  println("<<<UDP<<<"+RXString);
}
void webSocketEvent(String msg) {
  println(msg);


  try {
    rx_json = parseJSONObject(msg);
  }
  catch(Exception e) {
    println("[][X][JSon]"+msg);
  }
  int id = rx_json.getInt("id");
  if (id==7213) {
    String cmd=rx_json.getString("text");

    println("[WebControl]"+cmd);
    if (cmd.startsWith("/cue/pc/color")) {
      c=(int)random(255);
      println("[O][WebControl]:action=color");
    } else if (cmd.startsWith("/cue/pc/say")) {
      String x=cmd.split("/")[4];
      exec("/usr/bin/say", x);
      //launch("~/gtalk.sh "+cmd.split("/")[4]);
      println("[O][WebControl]:action=say");
    }else if (cmd.startsWith("/cue/sliderX")) {
      amplitude=int(cmd.split("/")[3]);
    }
  } 
}
void xlinxSay() {
  Process p = exec("/usr/bin/say", "waiting until done");
  try {
    int result = p.waitFor();
    println("the process returned " + result);
  } 
  catch (InterruptedException e) {
  }
}
java.util.TimerTask task1000 = new java.util.TimerTask() {
  public void run() {
    udp.send("{\"id\":0,\"name\":\"MACMINI\"}", "scube.decade.tw", 7000 );
  }
}; 
//#!/bin/bash
//say() { local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$*&tl=zh"; }
//say $*