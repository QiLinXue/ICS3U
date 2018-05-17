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
  println(mouseX,mouseY);
}

void keyPressed(){
  //username
}
