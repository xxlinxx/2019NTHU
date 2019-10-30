int ellipseR=30;
int ledNums=12;
byte ledValues[]=new byte[ledNums];
void setup() {
  size(500, 100);
}

void draw() {
  updateVals();
  updateLEDs();
}
void updateLEDs() {
  for (int i=0; i<ledNums; i++) {
    //println(ledValues[i]&0xff);
    fill(ledValues[i]&0xff);
    ellipse(ellipseR+i*ellipseR, ellipseR, ellipseR, ellipseR);
  }
}
float theta=0.01;
float period=TWO_PI/3000;
int times=3;
float offset=0;
float peak=12.0;
void updateVals() {
  float t=millis()/1000f;
  for (int i=0; i<ledNums; i++) {
    //ledValues[i]++;
    //ledValues[i]=(byte)(int)(255*0.5*(1+sin(TWO_PI/3000*millis())));
    println(t);
    ledValues[i]=(byte)(int)(255*0.5*(1+sin(TWO_PI*(t))));
    ledValues[i]=(byte)(int)(255*0.5*(1+sin(TWO_PI*(t*times)))); //times per sec
    offset=(float)i/ledNums*peak;
    ledValues[i]=(byte)(int)(255*0.5*(1+sin(TWO_PI*(t*times+offset)))); //times per sec
    
  }
  theta+=0.01;
  //println(ledValues[0]);
}