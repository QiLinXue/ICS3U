  void settings() {
  size(700,700);
}
void setup() {

}
void draw() {
  background(255,255,255);
  arc(350,350,50,50,radians(45),radians(45));
  ellipseMode(CORNER);
  noFill();
    
  stroke(250,128,128); //red
  strokeWeight(27);
  arc(95,35,430,508,radians(85),radians(268));
  
  stroke(215,250,128); //yellow
  strokeWeight(26);
  arc(55,34,465,514,radians(84),radians(270));
  
  stroke(128,250,128); //green
  strokeWeight(13);
  arc(82,21,460,505,radians(80),radians(260));
  
  stroke(102,143,251); //blue
  strokeWeight(13);
  arc(92,15,427,510,radians(95),radians(260));
  
  stroke(192,128,250); //purple
  strokeWeight(7);
  arc(71,-40,474,500,radians(85),radians(260));

  //Right Side
  stroke(250,128,128); //red
  strokeWeight(27);
  arc(220,262,430,508,radians(-70),radians(100));
  
  stroke(215,250,128); //yellow
  strokeWeight(26);
  arc(183,235,465,500,radians(-73),radians(54));
  
  stroke(128,250,128); //green
  strokeWeight(13);
  arc(148,280,495,490,radians(-85),radians(54));
  
  stroke(102,143,251); //blue
  strokeWeight(13);
  arc(217,235,427,480,radians(-69),radians(54));
  
  stroke(192,128,250); //purple
  strokeWeight(7);
  arc(170,203,474,500,radians(-97),radians(54));


}
