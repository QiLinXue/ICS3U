Exercise9 exercise9;

PImage assignmentBImage;

void exercisesBSetup(){
    exercise9 = new Exercise9(135,89,501,455,527);
}

void showExercisesB(){
  imageMode(CORNER);
  image(assignmentBImage,0,sShift,width,3.1871345*width);

  exercise9.show(135,89,501,455,527);

  //exercise 10 activate button
  buttonPressed(387,183,434,203,816,sShift,true);
  scollScreen();

}

void mouseExerciseB(){
  if(buttonPressed(387,183,434,203,816,sShift,true)) exercise10("Hi I'm an idiot!");
}
