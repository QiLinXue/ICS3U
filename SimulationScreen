int[][] inclinedPlaneCoordinates = {{150,100},{150,994},{500,994}};

void simulationScreenInitialize() {
  Fisica.init(this);

  world = new FWorld();
  world.setEdges();
  world.setEdgesRestitution(0);
  world.setGravity(0, 980);
  //world.setGrabbable(false);

  inclinedPlane = new FPoly();
    
  inclinedPlane.vertex(inclinedPlaneCoordinates[0][0], inclinedPlaneCoordinates[0][1]);
  inclinedPlane.vertex(inclinedPlaneCoordinates[1][0], inclinedPlaneCoordinates[1][1]);
  inclinedPlane.vertex(inclinedPlaneCoordinates[2][0], inclinedPlaneCoordinates[2][1]);
  inclinedPlane.setDensity(10000);
  inclinedPlane.setFill(207, 92, 54);
  inclinedPlane.setFriction(5);
  inclinedPlane.setNoStroke();
  inclinedPlane.setRestitution(0);

  b = new FCircle(100);
  b.setPosition(width/4, height/6);
  b.setRestitution(0);
  b.setNoStroke();
  b.setFill(119, 125, 167);
  b.setGrabbable(true);
  b.setRotatable(true);
  b.setFriction(0.5);


  box = new FBox(100, 100);
  box.setPosition(width/4, height/6);
  box.setRestitution(0);
  box.setNoStroke();
  box.setFill(119, 125, 167);
  box.setGrabbable(true);
  box.setDensity(0.1);
  box.setRotation(angle_IP());
  box.setFriction(1);
  box.setRotatable(false);


  world.add(box);
  world.add(inclinedPlane);
}

void simulationMode() {
  background(255);
  world.step();
  world.draw();
}

int x1, y1, x2, y2, x3, y3;
String[] defaultTriangle = {"100", "994", "700", "994", "100", "600"};

void simulationModeKeyActions() {
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
        String tempCoordinate = JOptionPane.showInputDialog("Please enter x" + Integer.toString(1+i+1) + ", y" + Integer.toString(1+i+1) + " (seperated by a space)", Integer.toString(floor(random(0, 1000))) + " " + Integer.toString(floor(random(0, 1000))));
        newObjectLocation[i] = Integer.parseInt(tempCoordinate.split(" ")[0]);
        newObjectLocation[i+1] = Integer.parseInt(tempCoordinate.split(" ")[1]);
      }
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
}
