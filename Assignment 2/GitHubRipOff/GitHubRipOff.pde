PImage homeScreen;
void setup(){
  homeScreen = loadImage("everything.jpeg");
}

void settings(){
  size(949,529);
}

String username = "blablabla";
int hsShift = 0;
void draw(){
  image(homeScreen,0,hsShift);
  fill(255);
  noStroke();
  rect(595,186,242,33);
  if(keyPressed & keyCode == DOWN) hsShift-=height/100;
  if(keyPressed & keyCode == UP && hsShift < -1) hsShift+=height/100;
  fill(0);
  textAlign(LEFT,CENTER);
  textSize(10);
  text(username,595,186,242,33);
}

void mousePressed(){
  println(mouseX,mouseY);
}

void keyPressed(){
  if(Character.isDigit(key) || Character.isLetter(key)) username+=key;
  //username
}
