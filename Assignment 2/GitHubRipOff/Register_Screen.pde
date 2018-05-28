PImage registerScreenImage;

void showRegisterScreen() {
  imageMode(CORNER);
  image(registerScreenImage, 0, 0, width, height);
  inputBox(289,192,512,209, 0, 0, 1, userRegisterInputs); //Username
  inputBox(290,240,509,256, 0, 0, 2, userRegisterInputs); //Email
  inputBox(290,299,510,314, 0, 0, 3, userRegisterInputs); //Password
}

void mouseRegister() {
  if (buttonPressed(342, 332, 606, 365, 0, 0, false) && !userLoginInputs[1].equals("") && !userLoginInputs[2].equals("")) {
    login(userLoginInputs[1], userLoginInputs[2]);
  }
}
