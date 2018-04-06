import fisica.*;
import javax.swing.JOptionPane;

//Sandbox Objects
FWorld world;
FPoly inclinedPlane;
FCircle b;
FBox box;

void setup() {
  size(1000, 1000);
  simulationScreenInitialize();
  
}

int screenMode = 1;
void draw() {
  switch(screenMode) {
    
  case 1: 
    simulationMode();
    break;
    
  case 2: 
  
    drawMode();
    break;
    
  }
}

void drawMode() {
  background(255);
}

void keyPressed() {
  if (screenMode == 1) {
    simulationModeKeyActions();
  } 
}

void mousePressed() {
  println(b.getX());
}
