void settings() {
  size(320,600);
}
void setup(){
  background(0);
}

void draw() {
  fill(mouseX,mouseY,255);
  stroke(100);
  ellipse(mouseX,mouseY,50,50);
}
