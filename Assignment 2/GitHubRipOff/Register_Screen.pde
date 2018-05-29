PImage registerScreenImage;

void showRegisterScreen() {
  imageMode(CORNER);
  image(registerScreenImage, 0, 0, width, height);
  inputBox(214,245,529,266, 0, 0, 1, userRegisterInputs); //Username
  inputBox(214,309,529,330, 0, 0, 2, userRegisterInputs); //Email
  inputBox(214,381,529,403, 0, 0, 3, userRegisterInputs); //Password

  buttonPressed(212, 495, 311, 518, 0, 0, false);
  buttonPressed(644,12,681,31,0,0,false);
}

void mouseRegister() {
  if (buttonPressed(212, 495, 311, 518, 0, 0, false)
      && !userRegisterInputs[1].equals("")
      && !userRegisterInputs[2].equals("")
      && !userRegisterInputs[3].equals("")) actuallyRegister();
  if(buttonPressed(644,12,681,31,0,0,false)) switchScreen(1);
}
