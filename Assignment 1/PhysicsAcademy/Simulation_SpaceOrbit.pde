//Initalize
Planet AnyPlanet;
Star star;

void solarSystemInitialize(float radius, float mass, float perigee, float apogee){
     star = new Star(695700,1.989E30,213,182,10);
     AnyPlanet = new Planet(radius,mass,perigee,apogee,0,0,star.mass);

     //These variables are all declared and shared with the complete sandbox version
     timeticker = 0;
     orbitRadiusScaler = 600000000;
     planetSizeScaler = 600;
     solarSystemZoom = -1;
}

void solarSystemSimulation(){
  //Background Setup
  background(30);
  timeticker++; //global increment that increases each frame

  //Complexity of Planet and Sun
  sphereDetail(10);
  //pointLight(213,182,10, width/2, height/2, 0);

  pushMatrix(); //Begin Transformation
  translate(width/2,height/2); //Sets the center to the middle of the screen
  scale(solarSystemZoom); //Scales it up or down

  //Planet Orbit Line
  AnyPlanet.plotOrbit();

  //Star
  star.plotBody();

  //Planet
  AnyPlanet.plotPlanet();

  popMatrix(); //End Transformation. Anything put beyond this line will not be affected by rotation

  //Warps Time
  if(keyPressed) AnyPlanet.changeTimeWarp();

  //Information
  fill(255);
  textSize(24);
  text("Altitude: "+(AnyPlanet.altitude(AnyPlanet.angle()*2)) +" metres",18,30,540,36);

  //Helpful Description
  textSize(18);
  text("Type . or , to speed and slow down",50,100,900,40); //KERBAL SPACE PROGRAM NOTATION :)
  text("Type . or , to speed and slow down",50,150,900,40); //KERBAL SPACE PROGRAM NOTATION :)

  if(keyPressed && keyCode == BACKSPACE) screenMode = previousScreenMode;
}
