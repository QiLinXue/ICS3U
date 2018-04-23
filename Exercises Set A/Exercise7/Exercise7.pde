void settings() {
  size(320, 630);
}

void setup() {
  colorMode(HSB, 360, 100, 100);
  background(360);
}

void draw() {

  noStroke();
  colorMode(HSB, 360, 100, 100);
  for (float i = width; i>0; i--) {
    fill (i, 100, 100);
    ellipse(width/2, 500, i/1.5, i/1.5);

  }

  stroke(1);
  for (int x = 10; x<width; x+=20) {
    for (int y = 10; y<360; y+=20) {
      fill(y%360, 100, 100);
      ellipse(x, y, 20, 20);
    }
  }
}
