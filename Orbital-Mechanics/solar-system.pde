planet planet1;
planet planet2;
CenterBody sun;

void setup(){
  background(30);
  frameRate(100);

  sun = new CenterBody(695700,1.989E30,213,182,10);
  planet1 = new planet(6371,5.972E24,1.471E11,1.521E11,102.9,7.155,sun.mass);
  planet2 = new planet(3390,6.39E23,2.066E11,2.492E11,336,5.65,sun.mass);
}

void settings(){
  size(1500,1500,P3D);}



//Settings to adjust the dimension of the planets
int timeticker = 0;
int timewarp = 10000000;
int orbitRadiusScaler = 600000000;
int planetSizeScaler = 400;

//The Actual Planets
//float[] object = {plaet radius (km), mass (kg),periapsis (m), apoapsis (m), longitude of peripasis,orbital inclination}
float[] center1 = {695700,1.989E30};

//0=homescreen, 1=solarSystem, 2=planetSystem
int mode = 1;

void draw(){

  //time ticker (100 fps)
  timeticker++; //global increment that increases each frame
  background(30);

  switch(mode){
    //case 0: homescreen(); break;
    case 1: solarSystem(); break;
    //case 2: planetsystem(); break;
  }

}

void solarSystem(){
  sphereDetail(10);
  //pointLight(213,182,10, width/2, height/2, 0);

  pushMatrix(); //Begin Transformation
  translate(width/2,height/2); //Sets the center to the middle of the screen
  scale(zoom);

  enableRotation();

  //Planet Orbit Lines
  planet1.plotOrbit(); //Earth
  planet2.plotOrbit(); //Mars

  //Plane of Reference
  fill(100);
  noStroke();
  ellipse(0,0,175,175);
  stroke(200);
  strokeWeight(1);

  //Star
  sun.plotBody();

  //Planets
  planet1.plotplanet();
  planet2.plotplanet();

  popMatrix(); //End Transformation. Anything put beyond this line will not be affected by rotation
}









boolean noClick = true; //The mouse is not being clicked down
float[] savedPositions = {0,0,0,0}; //{x-position,y-position,x-angle,y-angle}

//Function that allows everything to be rotated
void enableRotation(){
  //Conditions:
    //A translate function setting the origin to 500,500
    //Must be wrapped in pushMatrix() and popMatrix()

  if(mousePressed){

    //Since there are no booleans that differentiates between mouseClicked and mousePressed, here is a workaround with the global variable noClick
    if(noClick){ //Checks if the mouse is clicking (and not being held down)
      noClick = false; //the mouse is no longer clicking, it's being held down

      //Gives reference point to original position of mouse
      savedPositions[0] = mouseX;
      savedPositions[1] = -mouseY;
    }

    //Rotates EVERYTHING around the x and y axis by the current x and y position of the mouse
    rotateY(savedPositions[2]+radians((mouseX-savedPositions[0])/10.8)); //the 10.8 ensures it takes longer to rotate along y-axis
    rotateX(savedPositions[3]+radians((-mouseY-savedPositions[1])/5.4)); //the 5.4 ensures it's easier to rotate along x-axis to see orbital inclination

  } else{

    //Rotates EVERYTHING according to the last saved angle
    rotateY(savedPositions[2]);
    rotateX(savedPositions[3]);
  }
}

void mouseReleased(){
  //Saves positions when rotation is enabled
  if(noClick == false){ //Ensures this will only be called after rotation
    savedPositions[2] = savedPositions[2]+radians((mouseX-savedPositions[0])/10.8);
    savedPositions[3] = savedPositions[3]+radians((-mouseY-savedPositions[1])/5.4);

    noClick = true;
  }
}

float zoom = -1;
float isScroll;
void mouseWheel(MouseEvent event) {
  if(mode==1){
    isScroll = event.getCount();
    zoom = zoom + (isScroll/20);
    if(zoom>0){
      zoom = zoom - (isScroll/20);
    }
  }
}

void keyPressed(){
  planet2.displayFacts();
}
