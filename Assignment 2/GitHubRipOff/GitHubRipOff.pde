void setup(){
    homeScreenImage = loadImage("GitHubFullScreen.png");
    loginScreenImage = loadImage("GitHubLoginScreen.png");
}

void settings(){
  size(949,529);
}

int hsShift = 0;
int screenMode = 1;
void draw(){
    //text("asfd",200,200,600,200);
    switch(screenMode){
      case 0: showHomeScreen(); break;
      case 1: showLoginScreen(); break;
    }
}

void mousePressed(){
  // println(mouseX,mouseY);
  // if(keyPressed){
  //     if(keyPressed & keyCode == DOWN) hsShift-=height/100;
  //     if(keyPressed & keyCode == UP && hsShift < -1) hsShift+=height/100;
  //     if(Character.isDigit(key) || Character.isLetter(key)) username+=key;
  // }
  println(mouseX,mouseY,hsShift);
}

void keyPressed(){
  //username
  switch(screenMode){
      case 0: keyRegisterScreen(); break;
      case 1: keyLoginScreen(); break;
  }
  if(key == ' '){
    screenMode = (screenMode + 1) % 2;
  }
}
