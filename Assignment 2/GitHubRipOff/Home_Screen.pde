PImage homeScreenImage;
String username = " ";

void showHomeScreen() {

  //Image
  imageMode(CORNERS);
  image(homeScreenImage, 0, sShift);
  inputBox(595, 186, 837, 219, 0, sShift, 1, userRegisterInputs); //Username
  inputBox(595, 251, 837, 283, 0, sShift, 2, userRegisterInputs); //Email
  inputBox(595, 316, 837, 349, 0, sShift, 3, userRegisterInputs); //Password

  inputBox(48, 313, 253, 346, 1800, sShift, 1, userRegisterInputs); //Username
  inputBox(280, 313, 484, 346, 1800, sShift, 2, userRegisterInputs); //Email
  inputBox(509, 313, 712, 346, 1800, sShift, 3, userRegisterInputs); //Password

  scollScreen();

  //Show buttons
  buttonPressed(595,377,840,410,0,sShift,false);
  buttonPressed(760,16,801,40,0,sShift,false);
  buttonPressed(815,16,859,40,0,sShift,false);
  buttonPressed(737,205,945,243,1904,sShift,false);
}

void mouseHome() {
  if(buttonPressed(595,377,840,410,0,sShift,false)) actuallyRegister();
  if(buttonPressed(760,16,801,40,0,sShift,false)) switchScreen(1);
  if(buttonPressed(815,16,859,40,0,sShift,false)) switchScreen(10);
  if(buttonPressed(737,205,945,243,1904,sShift,false)) actuallyRegister();
}


void keyRegister() {
  if (key != CODED && keyCode != BACKSPACE && keyCode != ENTER && keyCode != CONTROL && (key != '@' || activeMode != 1)) userRegisterInputs[activeMode]+=key;

  if (keyCode == BACKSPACE && userRegisterInputs[activeMode].length()>0)
    userRegisterInputs[activeMode] = userRegisterInputs[activeMode].substring(0, userRegisterInputs[activeMode].length() - 1);

  if (key == ENTER) actuallyRegister();

}

void actuallyRegister(){
    if (registerSubmitRequirements()) register(userRegisterInputs[1], userRegisterInputs[2], userRegisterInputs[3]);
    else println("please ensure all fields have satisfied their requirements");
}

int activeMode = 0;
String[] userRegisterInputs  = {"", "", "", ""}; //NULL - USERNAME - EMAIL - PASSWORD

boolean registerSubmitRequirements() {
  boolean notEmpty = !userRegisterInputs[1].equals("") && !userRegisterInputs[2].equals("") && !userRegisterInputs[3].equals("");
  boolean overSevenCharacters = userRegisterInputs[3].length()>6;
  boolean containsDigit = userRegisterInputs[3].matches(".*[0-9].*");
  boolean containsLetter = userRegisterInputs[3].matches(".*[A-Z].*") || userRegisterInputs[3].matches(".*[a-z].*");

  return notEmpty && overSevenCharacters && containsDigit && containsLetter;

}
