

void settings() {
  size(320,600);
}
void setup(){
  colorMode(HSB, 255, 99, 99);
}
int xcircles = 0;
int ycircles = 0;
int i=-5;
int j=-5;

void draw() {
  colorMode(HSB, 255, 99, 99);

  xcircles = mouseX/10;
  ycircles = mouseY/10;
  fill(255);
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

  colorMode(RGB, 255, 255, 255);

}
