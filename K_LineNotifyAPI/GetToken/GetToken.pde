import http.requests.*;
PostRequest post;
String chatRoomToken="";
String chatRoomSecretToken="";
public void setup() 
{
  size(400, 400);
  getchatRoomSecretToken();
  //sendMessagetoChatRoom();
}
void getchatRoomSecretToken(){
  post = new PostRequest("https://notify-bot.line.me/oauth/token");
  post.addData("code",chatRoomToken);
  post.addData("grant_type","authorization_code");
  post.addData("redirect_uri","http://urdomain.tw/line/index.php");
  post.addData("client_id","x");
  post.addData("client_secret","x");
  post.send();
  System.out.println("Reponse Content: " + post.getContent());
  System.out.println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));
}
void sendMessagetoChatRoom() {
  post = new PostRequest("https://notify-api.line.me/api/notify");
  post.addHeader("Authorization", "Bearer "+chatRoomSecretToken);//flora
  post.addData("message", "TIME: "+new java.util.Date()+ "hello LINE");
  post.send();
  System.out.println("dReponse Content: " + post.getContent());
  System.out.println("dReponse Content-Length Header: " + post.getHeader("Content-Length"));
}
void DECADE_AI(){

}
