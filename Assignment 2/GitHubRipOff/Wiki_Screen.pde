PImage wikiScreenImage;
void showWikiScreen(){
  imageMode(CORNER);
  image(wikiScreenImage,0,sShift,width,1.367*width);

  scollScreen();

  buttonPressed(246,473,305,489,0,sShift,false);
  buttonPressed(246,483,305,497,0,sShift,false);
}

void mouseWiki(){
  if(buttonPressed(246,473,305,489,0,sShift,false)) switchScreen(3);
  else if(buttonPressed(246,483,305,497,0,sShift,false)) switchScreen(4);
  else println("Please click 'Exercises (Set A)' or 'Exercises (Set B)' to proceed.");
}

void keyWiki(){
    if(keyCode == BACKSPACE) switchScreen(0);
}
