import fisica.*;

//Sandbox Objects
FWorld world;
FPoly inclinedPlane;
FBox box;

void setup() {
  questionfont = createFont("Montserrat-Regular.ttf", 30);

  size(600, 600, P3D);
  println("Welcome back " + activeUser + "! It's nice to see you again.");
  homeScreenInputText = ("Welcome back " + activeUser + "! It's nice to see you again.");

  solarSystemInitialize();
  learnModeInitialize();

  //Temp
  userAccountIntialize();
  screenMode = 0;
}

int screenMode = 0;
int previousScreenMode;

void draw() {
  switch(screenMode) {

  case 0: homeScreenMode(); break;
  case 1: simulationMode(); break;
  case 3: quizMode(); break;
  case 4: solarSystemMode(); break;
  case 5: userAccountMode(); break;
  case 6: helpMode(); break;

  }

}

void drawMode() {
  background(255);
}

void keyPressed() {
  switch(screenMode){
      case 0: homeScreenModeKeyPressed(); break;
      case 3: quizModeKeyPressed(); break;
      case 4: solarSystemModeKeyPressed(); break;
      case 5: userAccountKeyPressed(); break;

  }
}

void mousePressed() {
  switch(screenMode){
      case 0: homeScreenModeMousePressed(); break;
      case 1: simulationModeMousePressed(); break;
      case 3: quizModeMousePressed(); break;
      case 5: userAccountModeMousePressed(); break;
  }
}

void mouseReleased() {
  switch(screenMode){
      case 3: quizModeMouseReleased(); break;
      case 4: solarSystemModeMouseReleased(); break;
 }
}

void mouseWheel(MouseEvent event) {
    switch(screenMode){
        case 4: //Standard Solar System Simulation
            if(spaceMode==1){
              solarSystemIsScroll = event.getCount();
              solarSystemZoom = solarSystemZoom + (solarSystemIsScroll/20);
              if(solarSystemZoom>0){
                solarSystemZoom = solarSystemZoom - (solarSystemIsScroll/20);
              }
            }
            break;
        case 1: //Adjusted Planet Simulation for quiz
            if(simulationType == "SPACE_SIMULATION"){
                solarSystemIsScroll = event.getCount();
                solarSystemZoom = solarSystemZoom + (solarSystemIsScroll/20);
                if(solarSystemZoom>0){
                  solarSystemZoom = solarSystemZoom - (solarSystemIsScroll/20);
                }
            }

   }
}
