PImage wikiScreenImage;
void showWikiScreen(){
  imageMode(CORNER);
  image(wikiScreenImage,0,sShift,width,1.367*width);

  scollScreen();

  buttonPressed(246,473,305,489,0,sShift,false); //Exercise A
  buttonPressed(246,483,305,497,0,sShift,false); //Exercise B
}

void mouseWiki(){
  if(buttonPressed(246,473,305,489,0,sShift,false)) switchScreen(3); //Exercise A
  if(buttonPressed(246,483,305,497,0,sShift,false)){ //Exercise B
    if(activePermissions == "true") switchScreen(4);
    else println("Sorry but only users with gmail accounts can access this.");
  }
  else println("Please click 'Exercises (Set A)' or 'Exercises (Set B)' to proceed.");
}

void keyWiki(){
    if(keyCode == BACKSPACE) switchScreen(0);
}
