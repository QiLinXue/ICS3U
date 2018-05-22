void setup(){
    homeScreenImage = loadImage("GitHubFullScreen.png");
    println(52 % 53);
}

void settings(){
  size(949,529);
}

int hsShift = 0;

void draw(){
    showHomeScreen();
}

void mousePressed(){
  // println(mouseX,mouseY);
  // if(keyPressed){
  //     if(keyPressed & keyCode == DOWN) hsShift-=height/100;
  //     if(keyPressed & keyCode == UP && hsShift < -1) hsShift+=height/100;
  //     if(Character.isDigit(key) || Character.isLetter(key)) username+=key;
  // }
}

void keyPressed(){
  //username
}
