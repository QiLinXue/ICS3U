float diameter;
float wid;
float hei=-10;
float r = 255;
float g = 0;
float b = 0;
float n = 42.5/2;
float x = 5;
float y = 0;
float i = 1;
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
  strokeWeight(1);
  fill(r,g,b);
  stroke(108,93,93);
  if(r == 255 && b == 0 && hei<200){
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
  ellipse(x, hei, 45,45);
  hei = hei+8.5;
  x = x+(.95/2);
  
  if(hei>600){
  i++;
  hei=-30*i;
  r = 255;
  g = 0;
  b = 0;
  }



}
