float boxMass, staticFriction, kineticFriction, force, originalStaticFriction, originalKineticFriction;
float a, b, c, d;
int forceScaler = 100;

void initializeWallSimulation(float mass, float sFriction, float kFriction) {
  println(sFriction);
  boxMass = mass;
  staticFriction = sFriction;
  kineticFriction = kFriction;
  force = staticFriction*boxMass*10+10;

  originalStaticFriction = staticFriction;
  originalKineticFriction = kineticFriction;

  a = 390;
  b = 390;
  c = (staticFriction*380+200);
  d = (kineticFriction*380+200);

  Fisica.init(this);

  world = new FWorld();
  world.setEdges();
  world.setEdgesRestitution(0);
  world.setGravity(0, 0);

  box = new FBox(120, 120);
  box.setPosition(66, height/6);
  box.setDensity(1);
  box.setNoStroke();
  box.setFill(119, 125, 167);
  box.setGrabbable(false);
  box.setRotatable(false);
  box.setRestitution(0);
  box.setVelocity(0, 0);
  world.add(box);
  //startSimul = true;
}

void wallSimulation() {

  //Setup
  background(255);
  world.step();
  world.draw();

  //Enables and resets Forces
  if (keyPressed) {

    //Enables All Forces
    if (key == ' ') {
      if ((box.getMass()*forceScaler*10)+(-force*staticFriction*forceScaler) > 0) { //Checks if object moves down
        box.addForce(0, box.getMass()*forceScaler*10); //force of gravity

        if (box.getVelocityY() == 0) box.addForce(0, -force*staticFriction*forceScaler); //force of static friction
        else box.addForce(0, -force*kineticFriction*forceScaler); //force of kinetic friction
      }
    }

    //Reset Location
    if (key == 'r'){
        box.setPosition(66, height/6);
        box.setVelocity(0,0);
    }

    //Move Back
    if (keyCode == BACKSPACE) screenMode = previousScreenMode;

  }

  stroke(0);

  //Force Calculation Draggers
  wallForces();

  //Text
  fill(0);
  textSize(18);
  textAlign(LEFT,CENTER);
  text("Static Friction: "+staticFriction, 210, 60, 360, 30);
  text("Kinetic Friction: "+kineticFriction, 210, 90, 360, 30);
  text("Mass: "+box.getMass()+" kg", 210, 120, 360, 30);
  text("Velocity: "+box.getVelocityY()+" m/s", 210, 150, 360, 30);
  text("Applied Force: "+force+" N", 210, 180, 360, 30);

  textAlign(CENTER,CENTER);
  text("Press r to reset",210,470,360,30);
  text("Press SPACE to activate forces",216,492,360,30);
  text("Press BACKSPACE to return",210,522,360,30);



  fill(255);
}

void wallForces(){
    //Applied Force
    rect(210, 240, 360, 12);
    if (mouseX<570 && mouseX>210 && mouseY>234 && mouseY<258 && mousePressed) {
      a=mouseX;
    }
    rect((a-12), 234, 24, 24);
    force = (((boxMass*10)/originalStaticFriction+30)+(a-390)*1.05);
    //println(boxMass,originalStaticFriction);
    //Mass
    rect(210, 300, 360, 12);
    if (mouseX<570 && mouseX>210 && mouseY>294 && mouseY<318 && mousePressed) {
      b=mouseX;
    }
    rect((b-12), 294, 24, 24);
    box.setDensity((boxMass/(100*0.36)+(b-390)*0.0005));

    //staticFriction
    rect(210, 360, 360, 12);
    if (mouseX<570 && mouseX>210 && mouseY>354 && mouseY<378 && mousePressed) {
      c=mouseX;
    }
    rect(c-12, 354, 24, 24);
    staticFriction = (c-200)/380;

    //KineticFriction
    rect(210, 420, 360, 12);
    if (mouseX<570 && mouseX>210 && mouseY>414 && mouseY<438 && mousePressed) {
      d=mouseX;
    }
    rect(d-12, 414, 24, 24);
    kineticFriction = (d-200)/380;
}
