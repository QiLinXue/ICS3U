void settings() {
  size(320,600);
}
void setup(){
  background(0);
}
float valuea=120;
float valueb=100;
float valuec=250;
float inca=-3;
float incb=2;
float incc=-1;
void draw() {
  fill(valuea,valueb,valuec);
  strokeWeight(0);
  ellipse(mouseX,mouseY,43,43);
}

void mouseMoved() {
  valuea = valuea + inca;
  valueb = valueb + incb;
  valuec = valuec + incc;
  if (valuea == 160 || valuea == 0) {
    inca = inca*-1;
  }
  if (valueb == 260 || valueb == 0) {
    incb = incb*-1;
  }
  if (valuec == 260 || valuec == 0) {
    incc = incc*-1;
  }

}
