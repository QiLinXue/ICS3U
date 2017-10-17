int mouseClicked = 0;
int xcircles = 0;
int ycircles = 0;
FloatList colorsx;
FloatList colorsy;

void settings() {
  size(320,600);
}
void setup(){
  colorsy = new FloatList();
  colorsx = new FloatList();

  background(252,252,252);
  for(int z=1;z<height;z++){
    colorsx = new FloatList();
    for(int y=1;y<width;y++){
      colorsx.append(random(255));
    }
    colorsy.append(colorsx);
  }
  println(colorsy.get(3));
}


void draw() {
  xcircles = mouseX/10;
  ycircles = mouseY/10;
  if(mouseClicked == 1){
  fill(255,255,255);
  rect(0,0,320,608);
  for(int i=1;i<ycircles;i++){
    for(int j=1;j<xcircles;j++){
    if(i==1 | j==1){
    fill(255,0,0);
    } else{
     fill(colorsy.get(i*j),colorsy.get((i*j)+1),colorsy.get((i*j)+2));
    }
    ellipse((j*10),(i*10),10,10);
  }
  };

}
}
void mousePressed() {
    mouseClicked = 1;
};

void mouseReleased() {
    mouseClicked = 0;
}

