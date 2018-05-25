float y=0;
float x=0;

void settings(){
    size(320,600);
}

void setup(){
    background(0);
    colorMode(HSB, 500,99,99);
    stroke(0,0,50);
}

void draw(){
  colorMode(HSB, 500,99,99);
  stroke(0,0,50);
  fill(y+x,99,99);

  y+=7;
  x+=0.55;

  ellipse(x,y,50,50);
  if(y>height){
    y=0;
    x-=5;
  }
  colorMode(RGB,255,255,255);
}
