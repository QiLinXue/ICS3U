PFont questionfont;

void learnMode(){
background(33,26,29);
  
textAlign(CENTER);
fill(255);
textSize(30);
questionfont = createFont("Montserrat-Regular.ttf",30);
textFont(questionfont);

text(problem1,0,210,width,height);

fill(255,255,0);
noStroke();
rect(0,500,width,10);
rect(0,150,width,10);

fill(0,200,200);
for(int i=0;i<8;i++){
rect(i*120+30,20,100,100);

}

}
