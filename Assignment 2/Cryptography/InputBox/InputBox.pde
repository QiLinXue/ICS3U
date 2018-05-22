void settings(){
    size(1000,1000);
}

void setup(){}

void draw(){
    inputBox(200,300,900,400,200,1);
    inputBox(200,600,900,700,100,2);

}


void inputBox(int x1, int y1, int x2, int y2, int originalShift, int localMode){
    int inputWidth = x2-x1;
    int inputHeight = y2-y1;

    fill(255);
    rect(x1,y1+originalShift,inputWidth,inputHeight);

    fill(0);
    textSize(50);
    textAlign(LEFT,CENTER);
    text(userInputs[localMode],x1,y1+originalShift,inputWidth,inputHeight);
    if(mousePressed && mouseX>x1 && mouseX<x2 && mouseY>y1+originalShift && mouseY<y2+originalShift)
        activeMode = localMode;
}

int activeMode = 0;
String[] userInputs  = {"","",""}; //NULL - USERNAME - PASSWORD

void keyPressed(){
    if(key != CODED && keyCode != BACKSPACE) userInputs[activeMode]+=key;
    else if(keyCode == BACKSPACE && userInputs[activeMode].length()>0)
        userInputs[activeMode] = userInputs[activeMode].substring(0, userInputs[activeMode].length() - 1);
    if(key == ENTER) login();
}
