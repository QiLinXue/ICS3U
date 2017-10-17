//setup
int mouseDragged = 0;
float sum = 0;
IntList mousepositionx; //Creates a list of X positions of function
IntList mousepositiony; //Creates a list of Y positions of function
IntList xpositiondifference; //This is the list that gets the differences in x positions
IntList ypositiondifference; //This is the list that gets the differences in y positions
int mode = 0; // 0=Home, 1=Free Draw, 2=Equation
float placeholdersum = 0; //When the mouse releases

// YOU SHALL NOT PASS
// THE EVIL CYBORG OVERLORDS HAVE TAKEN CONTROL OF THIS CODE
// ALL WHO TRY WILL BE EXTERMINATED
// EXTERMINATED
// TURN BACK NOW BEFORE IT IS TOO LATE
// THE UNIVERSE WILL BE SHRED TO PIECES
// BWAHAHAHAHAHAHA!

//Begin Actual Work
void settings() {
  size(1000, 1000);}
void setup() {
  mousepositionx = new IntList();
  mousepositiony = new IntList();
  xpositiondifference = new IntList();
  ypositiondifference = new IntList();
  background(230, 255, 255);

  fill(0);}
void draw() {
  if(mode == 0){}
  if(mode == 1){
    //Set everything up
    line(0,height/2,width,height/2);
    line(width/2,0,width/2,height);
    textSize(20);
    text("10",width/2+87,height/2-10);
    text("-10",width/2-120,height/2-10);
    text("10",width/2+10,height/2-95);
    text("-10",width/2+10,height/2+105);
    for(int z=0;z<width;z=z+100){
      ellipse(width/2,z,10,10);
      ellipse(z,height/2,10,10);}

      //Line Drawing Portion
    if(mouseDragged == 1){
    line(pmouseX,pmouseY,mouseX,mouseY); //Draws the Line
    ellipse(mouseX,mouseY,5,5);
    mousepositionx.append(mouseX);
    mousepositiony.append(mouseY);}}
  if(mode == 2){}}
void mouseDragged(){
  mouseDragged = 1;}
void mouseReleased(){
  mouseDragged = 0;
  if(mode == 1){
    for(int i=1;i<(mousepositionx.size()-1);i++){
    xpositiondifference.append(abs((mousepositionx.get(i+1)-mousepositionx.get(i)))); //Diference between first x-coordinate to second x-coordinate
    }
    for(int k=0;k<mousepositiony.size();k++){
    //placeholder = mousepositiony.get(k);
    //mousepositiony.set(k,((height/2)-placeholder)); //Difference between y coordinate and the x-axis
    ypositiondifference.append((height/2)-mousepositiony.get(k));
    }
    for(int j=0;j<xpositiondifference.size();j++){
    sum = sum + (xpositiondifference.get(j)*ypositiondifference.get(j));
    }
    sum = (sum/100)+placeholdersum;
    placeholdersum = placeholdersum + sum;
    sum = 0;
    xpositiondifference.clear();
    ypositiondifference.clear();
    mousepositionx.clear();
    mousepositiony.clear();
    textSize(20);
  }
}

void keyPressed(){
  //When a key is pressed
  //i=integrate
  //r=reset
  //h=home
  //f=enter function

  if(key == 'i' && mode == 1){
    for(int i=1;i<(mousepositionx.size()-1);i++){
    xpositiondifference.append(abs((mousepositionx.get(i+1)-mousepositionx.get(i)))); //Diference between first x-coordinate to second x-coordinate
    }
    for(int k=0;k<mousepositiony.size();k++){
    //placeholder = mousepositiony.get(k);
    //mousepositiony.set(k,((height/2)-placeholder)); //Difference between y coordinate and the x-axis
    ypositiondifference.append((height/2)-mousepositiony.get(k));
    }
    for(int j=0;j<xpositiondifference.size();j++){
    sum = sum + (xpositiondifference.get(j)*ypositiondifference.get(j));
    }
    sum = (sum/100)+placeholdersum;
    textSize(20);
    text(sum,10,200);}
  if(key == 'r' || key == 'h'){
    background(230, 255, 255);
    sum = 0;
    xpositiondifference.clear();
    ypositiondifference.clear();
    mousepositionx.clear();
    mousepositiony.clear();}
  if(key == 'h'){
    mode = 0;}
  if(key == 'd'){
    mode = 1;}
  if(key == 'f'){}}
