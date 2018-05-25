float g, h;

void settings() {
  size(300, 600);
}

void setup() {
  background(0);
  noStroke();
}

void draw() {
  colorMode(HSB,360,100,50,1);
  g = g + 3.3;
  fill(g % 360,100,50,1);
  h = h + 1;
  ellipse(h*0.5, height/2, h*0.1,h*0.1);
  ellipse(width/2, h*2, h*0.4,h*0.4);
  colorMode(RGB,255,255,255);
  
}
