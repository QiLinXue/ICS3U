void settings() {
  size(1404, 1060);
}
void setup() {

}
void draw() {
  background(119,176,245);


  //Sun
  stroke(0);
  strokeWeight(0);
  fill(252,245,0);
  ellipse(350,530,180,180);

  //Lines
  strokeWeight(5);
  line(0,530,1404,530);
  line(0,0,1403,0);

  //Grass
  strokeWeight(0);
  fill(28, 234, 92);
  rectMode(CORNER); //(x, y) is top left corner
  rect(0, 530, 1404, 530);

  //House
  strokeWeight(2);
  fill(240,97,123);
  rect(948, 290+150, 280, 186);

  //Roof
  fill(0,0,0);
  triangle(928, 289+150, 1083, 183+150, 1238, 289+150 );

  //Door
  fill(255,255,255);
  rect(1055,325+150,64, 130);

  //Doorknob
  fill(0,0,0);
  ellipse(1070,390+150,13,13);

  //
  for(float i=0;i<190;i=i+16.3636364){
  stroke(252,245,0);
  strokeWeight(5);
  line(396-50, 520, 150*cos(radians(i))+396-50, -150*sin(radians(i))+520);

  }
}
