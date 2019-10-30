//boolean dectLock=false;
//void pinEvent(int pin) {
//  try {
//    println("Received interrupt GPIO.RISING p="+pin);
//    if (dectLock)
//      println("people="+people);
//    else
//      println("people="+people++);
//    dectLock=true;
//    json.setInt("people", people);
//    wsc.sendMessage(json.toString());
//    if (bgcolor == color(0, 255, 0)) {
//      bgcolor = color(255, 0, 0);
//    } else {
//      bgcolor = color(0, 255, 0);
//    }
//  }
//  catch(Exception e) {
//    String[] ee={new Date().toString(), e.toString()};
//    saveStrings(month()+"_"+day()+"_"+hour()+"_exception.txt", ee);
//    println(e);
//  }
//} 