void setup(){
  background(30);
  frameRate(100);}
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
float[] satellite1 = {6371,5.972E24,1.471E11,1.521E11,102.9,7.155}; //Earth
float[] satellite2 = {3390,6.39E23,2.066E11,2.492E11,336,5.65}; //Mars

//Gives an accurate depiction of how the angle is changing with respect to time of an astronomical body
float angle(float[] object,float[] center){

  return
          (timewarp* //Speeds everything up
             (timeticker/ //Equation below gives the period, this gives the percentage of the period completed so it can be transformed into an angle

               //Kepler's Third Law (p^2=2*PI*sqrt(a^3/GM))
               (2*PI*
                 sqrt(
                       (pow((object[2]+object[3])/2,3) //Gives the semi-major axis
                       /
                       (6.674e-11*center[1])) //Gives the Standard Gravitational Parameter of the System
                     )
               )

             )
           ) % 360; //Transforms a percentage into an angle
}


//Plots a satellite on the UI
void plotSatellite(float[] object,float[] center){
  fill(255,20,147); //pinkish color

  pushMatrix(); //Begin transformation
  rotateZ(radians(object[4])); //Matches its longitude of periapsis
  rotateX(radians(object[5])); //Matches its orbital inclination

  //Transforms the planet according to the current angle and its orbital properties
  translate(
             cos(radians(angle(object,center)))* //x-component of satellite with respect to center body
             (object[2]/orbitRadiusScaler) //length magnitude of sateliite with respect to center body
             ,
             sin(radians(angle(object,center)))* //y-component of satellite with respect to center body
             (object[3]/orbitRadiusScaler) //Length magnitude of satellite with respect to center body
           );
  //stroke(0); //Gives the stroke color of the sphere details
  sphere(object[0]/planetSizeScaler); //Actual satellite itself
  popMatrix(); //Ends transformation
}

//Plots the orbit lines on the UI
void plotOrbit(float[] object){

  stroke(255); //color of the orbit line
  noFill(); //ensures the ellipse is transparent

  pushMatrix(); //Begin transformation
  rotateZ(radians(object[4])); //Matches its longitude of periapsis
  rotateX(radians(object[5])); //Matches its orbital inclination
  //The actual orbit
  ellipse(
    0,
    0, //Note that there is a transformation under solarSystem() that ensures the center is at 0,0 for convenient rotations
    (object[2]/orbitRadiusScaler)*2, //magnitude of length of periapsis *2
    (object[3]/orbitRadiusScaler)*2  //magnitude of length of apoapsis *2
  );

  popMatrix(); //End transformation
}



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
  plotOrbit(satellite1); //Earth
  plotOrbit(satellite2); //Mars

  //Plane of Reference
  fill(100);
  noStroke();
  ellipse(0,0,175,175);
  stroke(200);
  strokeWeight(1);

  //Star
  fill(213,182,10);
  sphere(center1[0]/10000);

  //Planets
  plotSatellite(satellite1,center1); //Earth
  plotSatellite(satellite2,center1); //Mars

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
