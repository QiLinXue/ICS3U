Exercise3 exercise3;
Exercise4 exercise4;
Exercise5 exercise5;
Exercise6 exercise6;
PImage assignmentAImage;

void exercisesASetup(){
    exercise3 = new Exercise3();
    exercise4 = new Exercise4();
    exercise5 = new Exercise5();
    exercise6 = new Exercise6();
}
void showExercisesA(){
  imageMode(CORNER);
  image(assignmentAImage,0,sShift,width,4.026*width);

  exercise1(232,184,578,461,153);
  exercise2(232,77,578,448,650);
  exercise3.show(232,105,389,434,1088);
  exercise4.show(232,105,389,420,1530);
  exercise5.show(232,12,389,334,2040);
  exercise6.show(232,185,389,506,2295);
  exercise7(232,107,394,428,2805);
  scollScreen();


}
