//General Arrays and Variables
IntList mousepositionx, mousepositiony, xpositiondifference, ypositiondifference;
float sum, placeholdersum, placeholderperimeter, perimeter, horshift, vershift, curmouseX, curmouseY, storedhorshift, storedvershift;

//Booleans
int mouseDragged = 0;
int startdrag = 1;
int calculate = 0;

//Settings
int mode = 0; // 0=Home, 1=Free Draw, 2=Equation
String functionMode = ""; //'TYPE' 'PLOT'
float scaler = 20;

//Input
String operation = "";

//General Setups
void settings() {
  size(1000, 1000);}
void setup() {
  frameRate(120);
  mousepositionx = new IntList();
  mousepositiony = new IntList();
  xpositiondifference = new IntList();
  ypositiondifference = new IntList();
  background(230, 255, 255);
  fill(0);}
void draw() {
  switch(mode){
    case 2: graphingCalculator(); break;
    case 1: freehanddraw(); break;
  }}

//General Keys For Both Modes
void mousePressed(){
  if(startdrag == 1){
    curmouseX = mouseX;
    curmouseY = mouseY;
    startdrag = 0;
  }}
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
      fill(0);}
    sum = (sum/100)+placeholdersum;
    placeholdersum = sum;
    perimeter = (perimeter/10) + placeholderperimeter;
    placeholderperimeter = perimeter;
    xpositiondifference.clear();
    ypositiondifference.clear();
    mousepositionx.clear();
    mousepositiony.clear();
    sum = 0;
    perimeter = 0;
    textSize(20);
    fill(255);
    strokeWeight(0);
    rect(0,0,300,150);
    fill(0);
    text("Area Under Curve: "+placeholdersum,5,50);
    text("Length of Curve: " + placeholderperimeter,5,75);
  }}
void keyPressed(){
  //When a key is pressed
  //r=reset
  //h=home
  //f=enter function
  //d=freehanddraw

  if(mode == 2){
    if(calculate == 0 && (key == '.' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0' || key == '+' || key == '-' || key == '*' || key == '/' || key == 'x' || key == '(' || key == ')' || key == '^' || key == 'c' || key == 'o' || key =='s' || key == 't' || key == 'a' || key == 'n' || key == 'i')){
      operation = operation + key;
    }
    if(key == 'r'){
      operation = "";
      scaler = 20;
    }
    if(key == BACKSPACE && mode == 2 && operation.length() > 0 && calculate == 0){
        operation = operation.substring(0, operation.length()-1);
    }
    if(key == DELETE && mode == 2){
      operation = "";}}
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

  }
  if(key == 'h'){
    mode = 0;}
  if(key == 'd' || (key == 'r' && mode == 1)){
    mode = 1;
    background(230, 255, 255);
    textSize(20);
    fill(255);
    strokeWeight(0);
    rect(0,0,300,150);
    fill(0);
    text("Area Under Curve: "+placeholdersum,5,50);
    text("Length of Curve: " + placeholderperimeter,5,75);
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

    if(functionMode == "PLOT" && scaler + event.getAmount()/5 > 0){
      scaler = scaler + event.getAmount()/5;
    }}

//Work Begins for Free Hand Drawing
void freehanddraw(){
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  textSize(20);
  text("10",width/2+87,height/2-10);
  text("-10",width/2-120,height/2-10);
  text("10",width/2+10,height/2-95);
  text("-10",width/2+10,height/2+105);
  for(int z=0;z<width;z=z+100){
    ellipse(width/2,z,10,10);
    ellipse(z,height/2,10,10);
  }

    //Line Drawing Portion
  if(mouseDragged == 1){
  line(pmouseX,pmouseY,mouseX,mouseY); //Draws the Line
  ellipse(mouseX,mouseY,5,5);
  mousepositionx.append(mouseX);
  mousepositiony.append(mouseY);}}

//Work begins for Graphing Calculator

//Variables specific to function calculator
float co3 = 0;
float co2 = 0;
float co1 = 0;
float intercept = 0;
float result;

//Overaching Code
void graphingCalculator(){
  if(functionMode == "TYPE"){
    PrepareDrawing();
  }
  if(calculate == 1){
    getVariables(operation);

    background(230, 255, 255);

    //Grid Lines
    line(0,height/2+vershift,width,height/2+vershift);
    line(width/2+horshift,0,width/2+horshift,height);

    //Draw the Actual Function
    for(float i=0+horshift;i<width+horshift;i = i + 0.2){
      line(width+horshift-i,height/2+vershift-calculateFormula(operation,height/2-i),width+horshift-(i+1),height/2+vershift-calculateFormula(operation,height/2-(i+1)));
      //line(width/2-i,height/2-calculateFormula(operation,i),width/2-(i+1),height/2-calculateFormula(operation,(i+1)));
    } //25x^2+2x+500
  }}

//Preparation
void PrepareDrawing(){
  background(230, 255, 255);
  strokeWeight(5);
  fill(256);
  rect(50,50,900,100);
  fill(0);
  textSize(50);
  text(operation,70,120);
  strokeWeight(1);}

//Calculations
float calculateFormula(String operation, Float xco){
    result = (co3*pow(xco,3))+(co2*pow(xco,2))+(co1*xco)+(intercept);
    return result;}
void getVariables(String operation){
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
          if(operation.charAt(i-1) == '+'){
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
          co2 = Integer.valueOf(operation.substring(0,i));
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
      else if(co2 == 0 && co3 == 0){
        co1 = Integer.valueOf(operation.substring(0,i));
      }
    }

    else if(i == operation.length()-1){
      //Figures out the 'd' variable
      try{
        if(operation.charAt(i-1) == '+' || operation.charAt(i-1) == '-'){
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
