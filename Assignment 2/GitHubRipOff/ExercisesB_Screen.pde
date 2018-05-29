Exercise9 exercise9;
TextAnalyzer exercise11;
TextAnalyzer exercise12;

PImage assignmentBImage;

void exercisesBSetup(){
    exercise9 = new Exercise9(135,89,501,455,527);
    exercise11 = new TextAnalyzer();
    exercise12 = new TextAnalyzer();
}

void showExercisesB(){
  imageMode(CORNER);
  image(assignmentBImage,0,sShift,width,3.1871345*width);

  exercise9.show(135,89,501,455,527);

  //exercise 10 activate button
  buttonPressed(387,183,434,203,816,sShift,true);
  buttonPressed(399,211,459,233,1309,sShift,true);
  buttonPressed(375,182,434,201,1853,sShift,true);
  scollScreen();

  buttonPressed(248,53,283,72,0,sShift,false);
}

void mouseExerciseB(){
  if(buttonPressed(387,183,434,203,816,sShift,true)) exercise10("Hi I'm an idiot!");
  if(buttonPressed(399,211,459,233,1309,sShift,true)) exercise11.analyzeSameString("Hi! This is another example...");
  if(buttonPressed(375,182,434,201,1853,sShift,true)) exercise12.analyzePoetries();
  if(buttonPressed(248,53,283,72,0,sShift,false)) switchScreen(2);
}

void keyExerciseB(){
  if(key == BACKSPACE) switchScreen(2);
}
