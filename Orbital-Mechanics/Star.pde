class CenterBody{
  float objectRadius; //km
  float mass; //kg
  float objectColorR;
  float objectColorG;
  float objectColorB;

  CenterBody(float tempObjectRadius, float tempMass, float tempObjectColorR, float tempObjectColorG, float tempObjectColorB){
    objectRadius = tempObjectRadius;
    mass = tempMass;
    objectColorR = tempObjectColorR;
    objectColorG = tempObjectColorG;
    objectColorB = tempObjectColorB;
  }

  void plotBody(){
    fill(objectColorR,objectColorG,objectColorB);
    sphere(objectRadius/10000);
  }
}
