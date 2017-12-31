class Star{
  float objectRadius; //km
  float mass; //kg
  float objectColorR;
  float objectColorG;
  float objectColorB;

  Star(int tempObjectRadius, float tempMass, int tempObjectColorR, int tempObjectColorG, int tempObjectColorB){
    objectRadius = tempObjectRadius;
    mass = tempMass;
    objectColorR = tempObjectColorR;
    objectColorG = tempObjectColorG;
    objectColorB = tempObjectColorB;
  }

  void plotBody(){
    fill(objectColorR,objectColorG,objectColorB);
    sphere(objectRadius/15000);
  }
}
