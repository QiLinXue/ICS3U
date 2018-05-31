boolean buttonPressed(int x1, int y1, int x2, int y2, boolean showButton) {
  if(showButton){
      int w = x2-x1;
      int h = y2-y1;
      fill(0,100,100); //dark blue
      rect(x1,y1,w,h);

      //Styling
      fill(255);
      textSize(10);
      textAlign(CENTER,CENTER);
      text("Click Me",x1,y1,w,h);
  }

  //Activation
  if (mouseX>x1 && mouseX<x2 && mouseY>y1 && mouseY<y2) {
    return true;
  } else return false;

}

void homeMenuMode(){
    background(0);
    fill(255);

    if(buttonPressed(width/3,height/5,width-width/3,2*(height/5),true) && mousePressed) reset();
}
