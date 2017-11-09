//General Arrays and Variables
IntList mousepositionx, mousepositiony, xpositiondifference, ypositiondifference;
float sum, placeholdersum, placeholderperimeter, perimeter, horshift, vershift, curmouseX, curmouseY, storedhorshift, storedvershift;
int equationmode1CHANGE, equationmode2CHANGE, equationmode3CHANGE, currentInput;

//Booleans
int mouseDragged = 0;
int startdrag = 1;
int calculate = 0;

//Settings
int mode = 0; // 0=Home, 1=Free Draw, 2=Equation
String functionMode = ""; //'TYPE' 'PLOT'
float scaler = 20;
float zoom = 20;

//Input
String operation1 = "";
String operation2 = "";
String operation3 = "";
String operation4 = "";

//General Setups
void settings() {
  size(600, 600);}
void setup() {
  frameRate(80);
  mousepositionx = new IntList();
  mousepositiony = new IntList();
  xpositiondifference = new IntList();
  ypositiondifference = new IntList();
  background(230, 255, 255);
  fill(0);}
void draw() {

  switch(mode){
    case 3: DonaldTrumpWillHelpTheWorld();
    case 2: graphingCalculator(); break;
    case 1: freehanddraw(); break;
    case 0: homescreen(); break;
  }}

//General Keys For Both Modes

//User Input
void mousePressed(){
  if(startdrag == 1){
    curmouseX = mouseX;
    curmouseY = mouseY;
    startdrag = 0;
  }
  if(mode == 2 && mouseX>20 && mouseX<width/8.33333333 && mouseY>width/20 && mouseY<width/6.66666667){
    equationmode1CHANGE++;
    operation1 = "";
  }
  if(mode == 2 && mouseX>20 && mouseX<width/8.33333333 && mouseY>width/4 && mouseY<width/2.85714286){
    equationmode2CHANGE++;
    operation2 = "";
  }
  if(mode == 2 && mouseX>20 && mouseX<width/8.33333333 && mouseY>width/2.22222222 && mouseY<width/1.81818182){
    equationmode3CHANGE++;
    operation3 = "";
  }

  if(mode == 2 && mouseX>width/8.33333333 && mouseX<width/1.04166667 && mouseY>width/12.5 && mouseY<width/5.55555556){
    currentInput = 1;
  }
  if(mode == 2 && mouseX>width/8.33333333 && mouseX<width/1.04166667 && mouseY>width/3.57142857 && mouseY<width/2.63157895){
    currentInput = 2;
  }
  if(mode == 2 && mouseX>width/8.33333333 && mouseX<width/1.04166667 && mouseY>width/2.08333333 && mouseY<width/1.72413793){
    currentInput = 3;
  }
  if(mode == 0 && mouseX>width/3.33333333 && mouseX<width/1.42857143 && mouseY>width/5 && mouseY<width/3.33333333){
    mode = 2;
    functionMode = "TYPE";
    background(230, 255, 255);
  }
  if(mode == 0 && mouseX>width/3.33333333 && mouseX<width/1.42857143 && mouseY>width/2.5 && mouseY<width/2){
    resetDrawBoard();
  }
  if(mode == 0 && mouseX>width/3.33333333 && mouseX<width/1.42857143 && mouseY>width/1.66666667 && mouseY<width/1.42857143){
    mode = 3;
  }
}
void mouseDragged(){
  mouseDragged = 1;
  if(mode == 2){
    horshift = storedhorshift+mouseX-curmouseX;
    vershift = storedvershift+mouseY-curmouseY;
  }}
void mouseReleased(){
  mouseDragged = 0;
  if(mode == 2){
    startdrag = 1;
    storedhorshift = horshift;
    storedvershift = vershift;
  }
  if(mode == 1){
    for(int i=0;i<(mousepositionx.size()-1);i++){
      xpositiondifference.append((mousepositionx.get(i+1)-mousepositionx.get(i)));} //Diference between first x-coordinate to second x-coordinate}
    for(int k=0;k<mousepositiony.size();k++){
      ypositiondifference.append((height/2)-mousepositiony.get(k));}
    for(int j=0;j<xpositiondifference.size();j++){
      //Area
      sum = sum + (abs(xpositiondifference.get(j))*ypositiondifference.get(j));

      //Perimeter
      perimeter = perimeter + dist(mousepositionx.get(j),mousepositiony.get(j),mousepositionx.get(j+1),mousepositiony.get(j+1));
      //Color
      if(j % 3 == 0){
        fill(255, 77, mousepositiony.get(j)/(height/250));
      } else if(j % 3 == 1){
        fill(204, 0, mousepositiony.get(j)/(height/250));
      } else{
        fill(255, 230, mousepositiony.get(j)/(height/250));
      }
      rect(mousepositionx.get(j),mousepositiony.get(j),xpositiondifference.get(j),ypositiondifference.get(j));
      fill(0);
    }
    sum = (sum/pow((width/100),2))+placeholdersum;
    placeholdersum = sum;
    perimeter = (perimeter/(width/100)) + placeholderperimeter;
    placeholderperimeter = perimeter;
    xpositiondifference.clear();
    ypositiondifference.clear();
    mousepositionx.clear();
    mousepositiony.clear();
    sum = 0;
    perimeter = 0;
    textSize(width/50);
    fill(255);
    strokeWeight(0);
    rect(0,0,width*3/10,width*3/20);
    fill(0);
    text("Area Under Curve: "+placeholdersum,width/200,height/20);
    text("Length of Curve: " + placeholderperimeter,width/200,height*3/40);
  }}
void keyPressed(){
  //When a key is pressed
  //r=reset
  //h=home
  //f=enter function
  //d=freehanddraw
  //rip
  if(mode == 2){
    if(calculate == 0 && calcmode1 == 1 && currentInput == 1 && (key == '.' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == '+' || key == '-' || key == '*' || key == '/' || key == 'x' || key == '(' || key == ')' || key == '^')){
        operation1 = operation1 + key;
    }
    if(calculate == 0 && calcmode1 == 2 && currentInput == 1 && (key == '.' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == 'x' || key == '(' || key == ')' || key == 'c' || key == 'o' || key =='s' || key == 't' || key == 'a' || key == 'n' || key == 'i' || key == 'e')){
        operation1 = operation1 + key;
    }
    if(calculate == 0 && calcmode2 == 1 && currentInput == 2 && (key == '.' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == '+' || key == '-' || key == '*' || key == '/' || key == 'x' || key == '(' || key == ')' || key == '^')){
        operation2 = operation2 + key;
    }
    if(calculate == 0 && calcmode2 == 2 && currentInput == 2 && (key == '.' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == 'x' || key == '(' || key == ')' || key == 'c' || key == 'o' || key =='s' || key == 't' || key == 'a' || key == 'n' || key == 'i' || key == 'e')){
        operation2 = operation2 + key;
    }
    if(calculate == 0 && calcmode3 == 1 && currentInput == 3 && (key == '.' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == '+' || key == '-' || key == '*' || key == '/' || key == 'x' || key == '(' || key == ')' || key == '^')){
        operation3 = operation3 + key;
    }
    if(calculate == 0 && calcmode3 == 2 && currentInput == 3 && (key == '.' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == 'x' || key == '(' || key == ')' || key == 'c' || key == 'o' || key =='s' || key == 't' || key == 'a' || key == 'n' || key == 'i' || key == 'e')){
        operation3 = operation3 + key;
    }
    if(key == 'r'){
      operation1 = "";
      operation2 = "";
      operation3 = "";
      operation4 = "";
      scaler = 20;
      zoom = 20;
    }
    if(key == BACKSPACE && mode == 2 && calculate == 0){
      if(currentInput == 1 && operation1.length() > 0){
        operation1 = operation1.substring(0, operation1.length()-1);
      } else if(currentInput == 2 && operation2.length() > 0){
        operation2 = operation2.substring(0, operation2.length()-1);
      } else if(currentInput == 3 && operation3.length() > 0){
        operation3 = operation3.substring(0, operation3.length()-1);
      }
    }
    if(key == DELETE && mode == 2){
      if(currentInput == 1){
        operation1 = "";
      } else if(currentInput == 2){
        operation2 = "";
      } else if(currentInput == 3){
        operation3 = "";
      }
    }
    if(key == 'c'){
      storedvershift = 0;
      storedhorshift = 0;
      horshift = 0;
      vershift = 0;
    }
  }
  if(key == 'r' || key == 'h' || key == 'd'){
    background(230, 255, 255);
    sum = 0;
    perimeter = 0;
    placeholdersum = 0;
    placeholderperimeter = 0;
    xpositiondifference.clear();
    ypositiondifference.clear();
    mousepositionx.clear();
    mousepositiony.clear();

    //For calculator
    co3 = 0;
    co2 = 0;
    co1 = 0;

    intercept = 0;
    calculate = 0;
    functionMode = "TYPE";
    horshift = 0;
    vershift = 0;
    scaler = 20;
    zoom = 20;

    trigxco = 0;
    trigyco = 0;
    typeTrig = 0;
  }
  if(key == 'h'){
    mode = 0;}
  if(key == 'd' || (key == 'r' && mode == 1)){
    resetDrawBoard();
  }
  if(key == 'f'){
    mode = 2;
    functionMode = "TYPE";
    background(230, 255, 255);
    }
  if(key == ENTER){
    background(230, 255, 255);
    functionMode = "PLOT";
    calculate = 1;
  }
  }
void mouseWheel(MouseEvent event) {

    if(functionMode == "PLOT" && scaler + event.getAmount()/10 > 0){
      scaler = scaler + event.getAmount()/10;
      zoom = zoom - event.getAmount()/5;
    }}

PImage homeImage = loadImage("https://wallpapercave.com/wp/qQnruxx.jpg");
//Work Begins For homescreen
void homescreen(){
  imageMode(CENTER);
  image(homeImage,width/2,height/2);

  noStroke();
  fill(235, 137, 33);
  rect(width/3.33333333,width/5,width/2.5,width/10);
  rect(width/3.33333333,width/2.5,width/2.5,width/10);
  rect(width/3.33333333,width/1.66666667,width/2.5,width/10);

  fill(0);
  textSize(width/20);
  text("Enter Function",width/3.05810398,width/3.66300366);
  text("Draw Function",width/2.98507463,width/2.1141649);
  text("Help",width/2.25769231,width/1.49253731);
  stroke(0);}

//Work Begins for settings
void DonaldTrumpWillHelpTheWorld(){
  background(230, 255, 255);
  textSize(width/10);
  text("Keyboard Shortcuts",width/50,height/10);
}

//Work Begins for Free Hand Drawing
void freehanddraw(){
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  textSize(width/50);
  text("10",width/2+width/11.4942529,height/2-height/100);
  text("-10",width/2-width/8.33333333,height/2-width/100);
  text("10",width/2+width/100,height/2-height/10.5263158);
  text("-10",width/2+width/100,height/2+height/9.52380952);
  for(int z=0;z<width;z=z+width/10){
    ellipse(width/2,z,width/100,width/100);
    ellipse(z,height/2,width/100,width/100);
  }

    //Line Drawing Portion
  if(mouseDragged == 1){
  line(pmouseX,pmouseY,mouseX,mouseY); //Draws the Line
  ellipse(mouseX,mouseY,5,5);
  mousepositionx.append(mouseX);
  mousepositiony.append(mouseY);}}
void resetDrawBoard(){
  mode = 1;
  background(230, 255, 255);
  textSize(width/50);
  fill(255);
  strokeWeight(0);
  rect(0,0,width*3/10,width*3/20);
  fill(0);
  text("Area Under Curve: "+placeholdersum,width/200,height/20);
  text("Length of Curve: " + placeholderperimeter,width/200,height*3/40);
}
//
//
//
//Work begins for Graphing Calculator
//
//
//

//Variables specific to function calculator
float co3 = 0;
float co2 = 0;
float co1 = 0;
float intercept = 0;
float result;

//Variables specific to trig calculator
int typeTrig = 0;
float trigxco = 0;
float trigyco = 0;

//Type of function
int calcmode;
int calcmode1 = 1;
int calcmode2 = 1;
int calcmode3 = 1;

//Overarching Code
void graphingCalculator(){
  if(equationmode1CHANGE % 2 == 1){
    calcmode1 = 2;
  } else{
    calcmode1 = 1;
  }
  if(equationmode2CHANGE % 2 == 1){
    calcmode2 = 2;
  } else{
    calcmode2 = 1;
  }
  if(equationmode3CHANGE % 2 == 1){
    calcmode3 = 2;
  } else{
    calcmode3 = 1;
  }
  if(functionMode == "TYPE"){
    PrepareDrawing();
  }
  if(calculate == 1){
    background(230, 255, 255);
    //Grid Lines
    strokeWeight(1);
    gridLines();
    strokeWeight(3);
    line(0,height/2+vershift,width,height/2+vershift);
    line(width/2+horshift,0,width/2+horshift,height);

    //Draws f(x)
    if(calcmode1 == 1){
        getPolyVariables(operation1);
    }
    if(calcmode1 == 2){
        getTrigVariables(operation1);
    }
    if(operation1 != ""){
      stroke(0);
      calcmode = calcmode1;
      drawTheLine(operation1);
    }

    //Draws g(x)
    if(calcmode2 == 1){
        getPolyVariables(operation2);
    }
    if(calcmode2 == 2){
        getTrigVariables(operation2);
    }
    if(operation2 != ""){
      stroke(0,0,255);
      calcmode = calcmode2;
      drawTheLine(operation2);
      }
    }


    //Draws h(x)
    if(calcmode3 == 1){
        getPolyVariables(operation3);
    }
    if(calcmode3 == 2){
        getTrigVariables(operation3);
    }
    if(operation3 != ""){
      stroke(220,20,60);
      calcmode = calcmode3;
      drawTheLine(operation3);
    }
    stroke(0);

    }

void drawTheLine(String operation){
  for(float i=0+horshift;i<width+horshift;i = i + 0.2){
    if(abs((height/2+vershift-calculateFormula(operation,height/2-i))-(height/2+vershift-calculateFormula(operation,height/2-(i+1)))) < width/1.25 || (height/2+vershift-calculateFormula(operation,height/2-i) > 0 && height/2+vershift-calculateFormula(operation,height/2-(i+1)) > 0)){
      line(width+horshift-i,height/2+vershift-calculateFormula(operation,height/2-i),width+horshift-(i+1),height/2+vershift-calculateFormula(operation,height/2-(i+1)));
    }
  }
}

//Preparation
void PrepareDrawing(){
  background(230, 255, 255);
  strokeWeight(5);
  fill(255);
  rect(width/8.33333333,width/12.5,width/1.19047619,width/10);
  rect(width/8.33333333,width/3.57142857,width/1.19047619,width/10);
  rect(width/8.33333333,width/2.08333333,width/1.19047619,width/10);


  fill(0);
  rect(width/50,width/12.5,width/10,width/10);

  fill(0,0,255);
  rect(width/50,width/3.57142857,width/10,width/10);

  fill(220,20,60);
  rect(width/50,width/2.08333333,width/10,width/10);

  strokeWeight(1);
  fill(255);
  textSize(width/25);
  if(equationmode1CHANGE % 2 == 1){
    text("TRIG",width/41.6666667,width/6.66666667);
  } else{
    text("P0LY",width/41.6666667,width/6.66666667);
  }
  if(equationmode2CHANGE % 2 == 1){
    text("TRIG",width/41.6666667,width/2.85714286);
  } else{
    text("P0LY",width/41.6666667,width/2.85714286);
  }
  if(equationmode3CHANGE % 2 == 1){
    text("TRIG",width/41.6666667,width/1.81818182);
  } else{
    text("P0LY",width/41.6666667,width/1.81818182);
  }

  fill(0);
  textSize(width/20);
  text(operation1,width/7.14285714,width/6.66666667);
  text(operation2,width/7.14285714,width/2.85714286);
  text(operation3,width/7.14285714,width/1.81818182);}

//Calculations
float calculateFormula(String anything, Float xco){

    //polynomial
    if(calcmode == 1)
    {
      result = (co3*pow(xco,3))+(co2*pow(xco,2))+(co1*xco)+(intercept);
    }

    //Trig

    else if(calcmode == 2)
    {
      switch(typeTrig){
        case 1:
          result = trigyco * sin(trigxco * xco);
          break;
        case 2:
          result = trigyco * cos(trigxco * xco);
          break;
        case 3:
          result = trigyco * tan(trigxco * xco);
          break;
        case 4:
          result = trigyco * asin(trigxco * xco);
          break;
        case 5:
          result = trigyco * acos(trigxco * xco);
          break;
        case 6:
          result = trigyco * atan(trigxco * xco);
          break;
        case 7:
          result = trigyco * 1/sin(trigxco * xco);
          break;
        case 8:
          result = trigyco * 1/cos(trigxco * xco);
          break;
        case 9:
          result = trigyco * 1/tan(trigxco * xco);
          break;
      }
    }
    return result;}

//3cos(4x);
void getTrigVariables(String operation){
  for(int i=0;i<=operation.length()-1;i++){ //Loops through string length

    //figures out the type of trig function
    if(operation.charAt(i) == 'a' && operation.charAt(i+1) != 'n'){
      switch(operation.charAt(i+1)){
        case 's': typeTrig = 4; break;
        case 'c': typeTrig = 5; break;
        case 't': typeTrig = 6; break;
      }
      if(i == 0){
        trigyco = 1;
      } else if(operation.charAt(i-1) == '-'){
        trigyco = -1;
      } else{
        trigyco = Float.valueOf(operation.substring(0,i));
      }
    } else if(operation.charAt(i) == 's' && operation.charAt(i+1) == 'i' && operation.charAt(i+2) == 'n'){
        if(i == 0){
          trigyco = 1;
          typeTrig  = 1;
        }
        else if(operation.charAt(i-1) != 'a'){
          typeTrig  = 1;
          if(operation.charAt(i-1) == '-'){
            trigyco = -1;
          } else{
            trigyco = Float.valueOf(operation.substring(0,i));
          }
        }
    } else if(operation.charAt(i) == 'c' && operation.charAt(i+1) == 'o' && operation.charAt(i+2) == 's'){
      if(i == 0){
        trigyco = 1;
        typeTrig  = 2;
      }
      else if(operation.charAt(i-1) != 'a'){
        typeTrig  = 2;
        if(operation.charAt(i-1) == '-'){
          trigyco = -1;
        } else{
          trigyco = Float.valueOf(operation.substring(0,i));
        }
      }
    } else if(operation.charAt(i) == 't' && operation.charAt(i+1) == 'a' && operation.charAt(i+2) == 'n'){
      if(i == 0){
        trigyco = 1;
        typeTrig  = 3;
      } else if(operation.charAt(i-1) != 'a'){
        typeTrig  = 3;
        if(operation.charAt(i-1) == '-'){
          trigyco = -1;
        } else{
          trigyco = Float.valueOf(operation.substring(0,i));
        }
      }
    } else if(operation.charAt(i) == 's' && operation.charAt(i+1) == 'c' && operation.charAt(i+2) == 's'){
      if(i == 0){
        trigyco = 1;
        typeTrig  = 7;
      } else if(operation.charAt(i-1) != 'a'){
        typeTrig  = 7;
        if(operation.charAt(i-1) == '-'){
          trigyco = -1;
        } else{
          trigyco = Float.valueOf(operation.substring(0,i));
        }
      }
    } else if(operation.charAt(i) == 's' && operation.charAt(i+1) == 'e' && operation.charAt(i+2) == 'c'){
      if(i == 0){
        trigyco = 1;
        typeTrig  = 8;
      } else if(operation.charAt(i-1) != 'a'){
        typeTrig  = 8;
        if(operation.charAt(i-1) == '-'){
          trigyco = -1;
        } else{
          trigyco = Float.valueOf(operation.substring(0,i));
        }
      }
    } else if(operation.charAt(i) == 'c' && operation.charAt(i+1) == 'o' && operation.charAt(i+2) == 't'){
      if(i == 0){
        trigyco = 1;
        typeTrig  = 9;
      } else if(operation.charAt(i-1) != 'a'){
        typeTrig  = 9;
        if(operation.charAt(i-1) == '-'){
          trigyco = -1;
        } else{
          trigyco = Float.valueOf(operation.substring(0,i));
        }
      }
    }

    //figures out the coefficient for x
    else if(operation.charAt(i) == 'x'){
      if(operation.charAt(i-1) == '('){
        trigxco = 1;
      } else if(operation.charAt(i-2) == '('){
        trigxco = Float.valueOf(operation.substring(i-1,i));
      }else if(operation.charAt(i-3) == '('){
        trigxco = Float.valueOf(operation.substring(i-2,i));
      }else if(operation.charAt(i-4) == '('){
        trigxco = Float.valueOf(operation.substring(i-3,i));
      }else if(operation.charAt(i-5) == '('){
        trigxco = Float.valueOf(operation.substring(i-4,i));
      }
    }
  }

  trigyco = trigyco * ((height/2)/scaler);
  trigxco = trigxco * (scaler/(height/2));}

//2x^3-3x^2-4x+5
void getPolyVariables(String operation){
  co3 = 0;
  co2 = 0;
  co1 = 0;
  intercept = 0;

  // Gets all the values
  //Form ax^3+bx^2+cx+d

  for(int i=0;i<=operation.length()-1;i++){ //Loops through string length

    //Figures out '^3' variable
    if(operation.charAt(i) == 'x' && i != operation.length()-1 && operation.charAt(i+1) == '^' && operation.charAt(i+2) == '3'){
      if(operation.charAt(0)==operation.charAt(i)){
        co3 = 1;
      } else if(operation.charAt(i-1) == '-'){
        co3 = -1;
      } else{
        co3 = Float.valueOf(operation.substring(0,i));
      }
    }

    //Figures out '^2' variable
    else if(operation.charAt(i) == 'x' && i != operation.length()-1 && operation.charAt(i+1) == '^' && operation.charAt(i+2) == '2'){
        //This happens when there is an ^3 term
        try{
          if(operation.charAt(0) == 'x'){
            co2 = 1;
          } else if(operation.charAt(i-1) == '+'){
            co2 = 1;
          } else if(operation.charAt(i-1) == '-'){
            co2 = -1;
          } else if(operation.charAt(i-2) == '+' || operation.charAt(i-2) == '-'){
            co2 = Integer.valueOf(operation.substring(i-2,i));
          } else if(operation.charAt(i-3) == '+' || operation.charAt(i-3) == '-'){
            co2 = Integer.valueOf(operation.substring(i-3,i));
          } else if(operation.charAt(i-4) == '+' || operation.charAt(i-4) == '-'){
            co2 = Integer.valueOf(operation.substring(i-4,i));
          } else if(operation.charAt(i-5) == '+' || operation.charAt(i-5) == '-'){
            co2 = Integer.valueOf(operation.substring(i-5,i));
          }
        }

        //This happens when there is no ^3 term
        catch(StringIndexOutOfBoundsException e){
          co2 = float(operation.substring(0,i));
        }
    }

    //Figures out '^1' variable
    else if(operation.charAt(i) == 'x'){

      //Happens when '^1' term is not the first
      if(co2 != 0 || co3 != 0){
        if(operation.charAt(i-1) == '+'){
          co1 = 1;
        } else if(operation.charAt(i-1) == '-'){
          co1 = -1;
        } else if(operation.charAt(i-2) == '+' || operation.charAt(i-2) == '-'){
          co1 = Integer.valueOf(operation.substring(i-2,i));
        } else if(operation.charAt(i-3) == '+' || operation.charAt(i-3) == '-'){
          co1 = Integer.valueOf(operation.substring(i-3,i));
        } else if(operation.charAt(i-4) == '+' || operation.charAt(i-4) == '-'){
          co1 = Integer.valueOf(operation.substring(i-4,i));
        } else if(operation.charAt(i-5) == '+' || operation.charAt(i-5) == '-'){
          co1 = Integer.valueOf(operation.substring(i-5,i));
        }
      }

      //Happens when there is no '^2' or '^3' term
      if(operation.charAt(0) == 'x'){
        co1 = 1;
      } else if(co2 == 0 && co3 == 0){
        co1 = Integer.valueOf(operation.substring(0,i));
      }

    }

    else if(i == operation.length()-1){
      //Figures out the 'd' variable
      try{
        if(co3 == 0 && co2 == 0 && co1 == 0){
          intercept = Integer.valueOf(operation.substring(0,operation.length()));
        } else if(operation.charAt(i-1) == '+' || operation.charAt(i-1) == '-'){
          intercept = Integer.valueOf(operation.substring(i-1,operation.length()));
        }else if(operation.charAt(i-2) == '+' || operation.charAt(i-2) == '-'){
          intercept = Integer.valueOf(operation.substring(i-2,operation.length()));
        } else if(operation.charAt(i-3) == '+' || operation.charAt(i-3) == '-'){
          intercept = Integer.valueOf(operation.substring(i-3,operation.length()));
        } else if(operation.charAt(i-4) == '+' || operation.charAt(i-4) == '-'){
          intercept = Integer.valueOf(operation.substring(i-4,operation.length()));
        } else if(operation.charAt(i-5) == '+' || operation.charAt(i-5) == '-'){
          intercept = Integer.valueOf(operation.substring(i-5,operation.length()));
        }
      }

      //Happens when intercept does not exist
      catch(StringIndexOutOfBoundsException e){
        intercept = 0;
      }
      catch(NumberFormatException e){
        intercept = 0;
      }
    }
  }

  //Scales them up or down
  intercept = ((height/2)*intercept)/scaler;
  co2 = (co2*scaler)/(height/2);
  co3 = co3*(pow(scaler,2)/pow(height/2,2));}

//Creates the grid lines
void gridLines(){
  fill(0);
  if(zoom>40){
    zoom = 15;
  } else if(zoom<15){
    zoom = 40;
  }
  for(float i = width/2; i<width-horshift; i = i+zoom*6){
    line(i+horshift,height,i+horshift,0);
  }
  for(float i = width/2; i>0-horshift; i = i-zoom*6){
    line(i+horshift,height,i+horshift,0);
  }
  for(float i = height/2; i<height-vershift; i = i+zoom*6){
    line(width,i+vershift,0,i+vershift);
  }
  for(float i = height/2; i>0-vershift; i = i-zoom*6){
    line(width,i+vershift,0,i+vershift);
  }}
