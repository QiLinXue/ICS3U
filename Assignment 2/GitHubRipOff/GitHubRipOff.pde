Table userDatabase;
void setup(){
    userDatabase = loadTable("users.csv", "header"); //Initialize name table


    homeScreenImage = loadImage("GitHubFullScreen.png");
    loginScreenImage = loadImage("GitHubLoginScreen.png");
    wikiScreenImage = loadImage("GitHubWikiScreen.png");
    assignmentAImage = loadImage("GitHubExercisesA.png");
}

void settings(){
  size(949,529);
}

int sShift = 0;
int screenMode = 1;
void draw(){
    //text("asfd",200,200,600,200);
    switch(screenMode){
      case 0: showHomeScreen(); break;
      case 1: showLoginScreen(); break;
      case 2: showWikiScreen(); break;
      case 3: showExercisesA(); break;
    }
}

void mousePressed(){
  println(mouseX,mouseY);
   switch(screenMode){
      case 0: mouseHome(); break;
      case 1: mouseLogin(); break;
      case 2: mouseWiki(); break;
  }
}

void keyPressed(){
  //username
  switch(screenMode){
      case 0: keyRegister(); break;
      case 1: keyLogin(); break;
  }
  if(keyCode == TAB) switchScreen((screenMode + 1) % 2);
}
