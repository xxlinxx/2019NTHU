//void setupJSON() {

//  try {
//    myip = InetAddress.getLocalHost();
//  }
//  catch (Exception e) {
//    println("get my ip exception");
//  }
//  hostnameX=myip.getHostName();

//  System.out.println("NOW="+sdFormat.format(current));
//  System.out.println("Current IP address : " + myip.getHostAddress());

//  json = new JSONObject();
//  json.setInt("id", 88);
//  json.setString("name", "PI_INPUT");
//  json.setString("hostnameX", hostnameX);
//  json.setString("ip", myip.getHostAddress());
//  json.setBoolean("IR", false);
//  json.setInt("people", people);
//  saveJSONObject(json, "/home/pi/JSON.txt");
//}