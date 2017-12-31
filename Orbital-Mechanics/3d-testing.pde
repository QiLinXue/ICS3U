void setup()  {
  size(1000, 1000, P3D);
}
int i;
void draw()  {
  strokeWeight(10);
  stroke(255);
  noFill();
  background(0);


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

  ellipse(0,0,200,400);
  fill(150,0,150);
  strokeWeight(2);
  sphereDetail(15);
  sphere(100);
  popMatrix();

}



boolean noClick = true;
float[] savedPositions = {0,0,0,0};
void mouseReleased(){
  savedPositions[2] = savedPositions[2]+radians((mouseX-savedPositions[0])/5.4);
  savedPositions[3] = savedPositions[3]+radians((-mouseY-savedPositions[1])/5.4);

  noClick = true;
}
