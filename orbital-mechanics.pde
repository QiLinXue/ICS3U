void setup(){
  background(30);
  frameRate(100);
}

void settings(){
  size(1500,1500);
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
  translate(width/2,height/2);
  rotate(object[4]);

  ellipse(
    cos(radians(angle(object)))*(object[2]/orbitRadiusScaler),
    sin(radians(angle(object)))*(object[3]/orbitRadiusScaler),
    object[0]/planetSizeScaler,
    object[0]/planetSizeScaler
  );
  popMatrix();
}

void plotOrbit(float[] object){

  ellipseMode(CENTER);

  pushMatrix();
  translate(width/2,height/2);
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
  //Orbit Lines (descending order)
  fill(0);
  stroke(255);
  noFill();
  plotOrbit(planet1); //Earth
  plotOrbit(planet2); //Mars


  //Star
  fill(254,246,91);
  ellipse(width/2,height/2,star[0]/10000,star[0]/10000); //Sun

  //Planets
  fill(255);
  plotPlanet(planet1); //Earth
  plotPlanet(planet2); //Mars
}

void keyPressed(){

}
