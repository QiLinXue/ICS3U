float angle_triangle(float x1, float y1, float x2, float y2, float x3, float y3) { //Top Left, Bottom Left, Bottom Right
  return atan((y2-y1)/(x3-x2));
}

float angle_IP(){
  float rise = (inclinedPlaneCoordinates[1][1]-inclinedPlaneCoordinates[0][1]);
  float run = (inclinedPlaneCoordinates[2][0]-inclinedPlaneCoordinates[1][0]);
  return atan(rise/run);
}

float minCoFriction_IP(float radians){
  return tan(radians);
}
