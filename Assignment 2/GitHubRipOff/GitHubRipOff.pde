Table userDatabase;
void setup() {
  userDatabase = loadTable("users.csv", "header"); //Initialize name table


  homeScreenImage = loadImage("GitHubFullScreen.png");
  loginScreenImage = loadImage("GitHubLoginScreen.png");
  wikiScreenImage = loadImage("GitHubWikiScreen.png");
  assignmentAImage = loadImage("GitHubExercisesA.png");
  assignmentBImage = loadImage("GitHubExercisesB.png");
  registerScreenImage = loadImage("GitHubRegisterScreen.png");

  exercisesASetup();
  exercisesBSetup();

  println("Welcome to Github Beta! Because of this, only basic features are enabled. Press BACKSPACE to move back screens and press TAB to view clikable buttons. Use arrow keys to scroll when applicable.");
}

void settings() {
  size(949, 529);
}

int sShift = 0;
int screenMode = 0;
void draw() {
  //text("asfd",200,200,600,200);
  switch(screenMode) {
  case 0: showHomeScreen(); break;
  case 1: showLoginScreen(); break;
  case 2: showWikiScreen(); break;
  case 3: showExercisesA(); break;
  case 4: showExercisesB(); break;
  case 10: showRegisterScreen(); break;
  }
}

void mousePressed() {
  //println(mouseX, mouseY, sShift);
  switch(screenMode) {
  case 0: mouseHome(); break;
  case 1: mouseLogin(); break;
  case 2: mouseWiki(); break;
  case 3: mouseExerciseA(); break;
  case 4: mouseExerciseB(); break;
  case 10: mouseRegister(); break;
  }
}

boolean showAllButtons = false;

void keyReleased(){
    showAllButtons = false;
}

void keyPressed() {
  //Show buttons
  if(keyCode == TAB) showAllButtons = true;

  switch(screenMode) {
  case 0: keyRegister(); break;
  case 1: keyLogin(); break;
  case 2: keyWiki(); break;
  case 3: keyExerciseA(); break;
  case 4: keyExerciseB(); break;
  case 10: keyRegister(); break;
  }
  //if (keyCode == TAB) switchScreen((screenMode + 1) % 2);
}
