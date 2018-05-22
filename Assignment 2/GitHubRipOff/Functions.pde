void switchScreen(int newScreenMode){
  userRegisterInputs[1]="";
  userRegisterInputs[2]="";
  userRegisterInputs[3]="";
  userLoginInputs[1]="";
  userLoginInputs[2]="";
  screenMode = newScreenMode;

}

void inputBox(int x1, int y1, int x2, int y2, int originalShift, int screenShift, int localMode, String[] inputArray){
    int inputWidth = x2-x1;
    int inputHeight = y2-y1;
    String text = inputArray[localMode];
    fill(255);
    rect(x1,y1+originalShift+screenShift,inputWidth,inputHeight);

    fill(0);
    stroke(0);
    textSize(10);
    textAlign(LEFT,CENTER);
    text(text,x1+5,y1+originalShift+screenShift,inputWidth,inputHeight);
    if(mousePressed && mouseX>x1 && mouseX<x2 && mouseY>y1+originalShift+hsShift && mouseY<y2+originalShift+hsShift){
        activeMode = localMode;
    }
}
