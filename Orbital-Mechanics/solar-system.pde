void setup(){
  background(30);
  frameRate(100);
}

void settings(){
  size(1500,1500,P3D);
}

int timeticker = 0;
int timewarp = 10000000;
int orbitRadiusScaler = 600000000;
int planetSizeScaler = 400;

//float[] object = {radius (km), mass (kg),periapsis (m), apoapsis (m), longitude of peripasis}
float[] star = {695700,1.989E30};
float[] planet1 = {6371,5.972E24,1.471E11,1.521E11,102.9}; //Earth
float[] planet2 = {3390,6.39E23,2.066E11,2.492E11,336}; //Mars

float angle(float[] object){
  return (timewarp*(timeticker/(6.28*sqrt((pow(object[2],3)/(6.674e-11*star[1])))))) % 360;
}

void plotPlanet(float[] object){
  pushMatrix();
  //translate(width/2,height/2);
  rotate(object[4]);

  /*ellipse(
    cos(radians(angle(object)))*(object[2]/orbitRadiusScaler),
    sin(radians(angle(object)))*(object[3]/orbitRadiusScaler),
    object[0]/planetSizeScaler,
    object[0]/planetSizeScaler
  );*/
  translate(cos(radians(angle(object)))*(object[2]/orbitRadiusScaler),
  sin(radians(angle(object)))*(object[3]/orbitRadiusScaler));
  sphere(object[0]/planetSizeScaler);
  popMatrix();
}

void plotOrbit(float[] object){

  ellipseMode(CENTER);

  pushMatrix();
  //translate(width/2,height/2);
  rotate(object[4]);

  noFill();
  ellipse(
    0,
    0,
    (object[2]/orbitRadiusScaler)*2,
    (object[3]/orbitRadiusScaler)*2
  );

  popMatrix();


}

int mode = 1;

void draw(){

  //time ticker (100 fps)
  timeticker++;
  background(0);
  ellipseMode(CENTER);

  switch(mode){
    //case 0: homescreen(); break;
    case 1: solarSystem(); break;
  //  case 2: planetsystem(); break;
  }

}

void solarSystem(){
  sphereDetail(10);
  //pointLight(213,182,10, width/2, height/2, 0);

  //Orbit Lines (descending order)
  fill(0);
  stroke(255);
  noFill();
  pushMatrix();
  translate(width/2,height/2);
  if(mousePressed){
    if(noClick){
      noClick = false;
      savedPositions[0] = mouseX;
      savedPositions[1] = -mouseY;
      rotateY(savedPositions[2]+radians((mouseX-savedPositions[0])/5.4));
      rotateX(savedPositions[3]+radians((-mouseY-savedPositions[1])/5.4));

    } else{
      rotateY(savedPositions[2]+radians((mouseX-savedPositions[0])/5.4));
      rotateX(savedPositions[3]+radians((-mouseY-savedPositions[1])/5.4));

    }
  } else{
    rotateY(savedPositions[2]);
    rotateX(savedPositions[3]);
  }
  plotOrbit(planet1); //Earth
  plotOrbit(planet2); //Mars


  //Star
  fill(213,182,10);
  //ellipse(0,0,star[0]/10000,star[0]/10000); //Sun
  sphere(star[0]/10000);

  //Planets
  fill(255);
  plotPlanet(planet1); //Earth
  plotPlanet(planet2); //Mars
  popMatrix();

}









boolean noClick = true;
float[] savedPositions = {0,0,0,0};
void mouseReleased(){
  savedPositions[2] = savedPositions[2]+radians((mouseX-savedPositions[0])/5.4);
  savedPositions[3] = savedPositions[3]+radians((-mouseY-savedPositions[1])/5.4);

  noClick = true;
}
