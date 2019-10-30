import http.requests.*;
PostRequest post;
public void setup() 
{
  size(400, 400);
  post = new PostRequest("https://notify-api.line.me/api/notify");
}
void draw() {
  post.addHeader("Authorization", "Bearer yyy");

  post.addData("message", "M"+new java.util.Date());
  post.send();
  System.out.println("Reponse Content: " + post.getContent());
  System.out.println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));
}
