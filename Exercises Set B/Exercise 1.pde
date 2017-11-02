int mouseClicked = 0;
int xcircles = 0;
int ycircles = 0;

void settings() {
  size(320,600);
}
void setup(){
  colorMode(HSB, 255, 99, 99);
}
int i=-5;
int j=-5;

void draw() {
  xcircles = mouseX/10;
  ycircles = mouseY/10;
  if(mouseClicked == 1){
  fill(255,255,255);
  //rect(0,0,320,608);
  background(255);

  while(i<ycircles){
      while(j<xcircles){
        fill((i*j*100) % 255,99,99);
        ellipse((j*10)+5,(i*10)+5,10,10);
        j++;
      }
      j = -5;
      i++;
    }
    i = -5;

  };

  }
void mousePressed() {
    mouseClicked = 1;
};

void mouseReleased() {
    mouseClicked = 0;
}
