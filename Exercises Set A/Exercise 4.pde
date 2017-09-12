float diameter;
float wid;
float hei;
float r = 255;
float g = 0;
float b = 0;
int n = 17;
float diameterb;
void settings() {
  size(300, 600);
}

void setup() {
  diameter = 1;
  wid = 1;
  hei = 0;
  background(0);
}

void draw() {
  strokeWeight(0);
  fill(r,g,b);
  stroke(r,g,b);
  if(r == 255 && b == 0){
    g = g + n;
  } if(g == 255 && b == 0){
    r = r - n;
  } if(r == 0 && g == 255){
    b = b + n;
  } if(r == 0 && b == 255){
    g = g - n;
  } if(g == 0 && b == 255){
    r = r + n;
    } if(r == 255 && g == 0){
      b = b - n;
    }
  ellipse(wid, height/2, diameter,diameter);
  ellipse(width/2, hei, diameterb,diameterb);
  diameter = diameter + .122;
  wid = wid+0.5;
  hei = hei+2.02;
  diameterb = diameterb + .55;


}
