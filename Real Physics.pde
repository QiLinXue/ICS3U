import fisica.*;
import javax.swing.JOptionPane;


FWorld world;
FPoly polyButton;
//FPoly myFoly;

int ballCount = 2;

void setup() {
  size(1000, 1000);
  smooth();

  Fisica.init(this);

  world = new FWorld();
  world.setEdges();
  world.setEdgesRestitution(0);
  world.setGravity(0, 1000);
  //world.setGrabbable(false);

  polyButton = new FPoly();
  polyButton.vertex(100, 994);
  polyButton.vertex(700, 994);
  polyButton.vertex(100, 600);
  polyButton.setDensity(10000);
  polyButton.setFill(207, 92, 54);
  polyButton.setNoStroke();
  polyButton.setRestitution(0);

  FCircle b = new FCircle(100);
  b.setPosition(width/4, height/6);
  b.setRestitution(0);
  b.setNoStroke();
  b.setFill(119, 125, 167);
  b.setGrabbable(true);
  world.add(b);
  //world.add(polyButton);
}

int screenMode = 1;
void draw() {
  switch(screenMode) {
  case 1: 
    simulationMode();
    break;
  case 2: 
    drawMode();
  }
}

void simulationMode() {
  background(255);
  world.step();
  world.draw();
}

void drawMode() {
  background(255);
}

int x1, y1, x2, y2, x3, y3;
String[] defaultTriangle = {"100", "994", "700", "994", "100", "600"};

void keyPressed() {
  if (screenMode == 1) {

    if (keyCode == TAB) 

    {

      String[] newObjectSettings = {"vertices"};
      newObjectSettings[0] = JOptionPane.showInputDialog("How many vertices?", "3");
      int[] newObjectLocation = new int[Integer.parseInt(newObjectSettings[0])*2];
      for (int i = 0; i < newObjectLocation.length; i+=2) {

        if (newObjectLocation.length == 6) //If object is a triangle (this is for testing)
        {
          String tempCoordinate = JOptionPane.showInputDialog("Please enter x" + Integer.toString(1+i/2) + ", y" + Integer.toString(1+i/2) + " (seperated by a space)", defaultTriangle[i] + " " + defaultTriangle[i+1]);
          newObjectLocation[i] = Integer.parseInt(tempCoordinate.split(" ")[0]);
          newObjectLocation[i+1] = Integer.parseInt(tempCoordinate.split(" ")[1]);
        } else //If object is not a triangle
        {
          String tempCoordinate = JOptionPane.showInputDialog("Please enter x" + Integer.toString(1+i+1) + ", y" + Integer.toString(1+i+1) + " (seperated by a space)", Float.toString(random(0,1000)) + " " + Float.toString(random(0,1000)));
          newObjectLocation[i] = Integer.parseInt(tempCoordinate.split(" ")[0]);
          newObjectLocation[i+1] = Integer.parseInt(tempCoordinate.split(" ")[1]);        }
      }

      FPoly myPoly = new FPoly();
      for (int i=0; i<newObjectLocation.length; i+=2) {
        myPoly.vertex(newObjectLocation[i], newObjectLocation[i+1]);
      }
      myPoly.setDensity(10000);
      myPoly.setFill(100);
      myPoly.setNoStroke();
      world.add(myPoly);
    }
  } //Screenmode ends
}
