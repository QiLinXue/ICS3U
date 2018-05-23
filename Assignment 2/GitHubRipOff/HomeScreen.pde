PImage homeScreenImage;
String username = " ";

void showHomeScreen(){
    
    //Image
    imageMode(CORNERS);
    image(homeScreenImage,0,sShift);
    inputBox(595,186,837,219,0,sShift,1,userRegisterInputs); //Username
    inputBox(595,251,837,283,0,sShift,2,userRegisterInputs); //Email
    inputBox(595,316,837,349,0,sShift,3,userRegisterInputs); //Password
    
    inputBox(48,313,253,346,1800,sShift,1,userRegisterInputs); //Username
    inputBox(280,313,484,346,1800,sShift,2,userRegisterInputs); //Email
    inputBox(509,313,712,346,1800,sShift,3,userRegisterInputs); //Password


    scollScreen();

}

void mouseHome(){

}


void keyRegister(){
    if(key != CODED && keyCode != BACKSPACE && keyCode != ENTER && keyCode != CONTROL) userRegisterInputs[activeMode]+=key;
    if(keyCode == BACKSPACE && userRegisterInputs[activeMode].length()>0)
        userRegisterInputs[activeMode] = userRegisterInputs[activeMode].substring(0, userRegisterInputs[activeMode].length() - 1);
    if(key == ENTER && !userRegisterInputs[1].equals("") && !userRegisterInputs[2].equals("") && !userRegisterInputs[3].equals("")) register(userRegisterInputs[1],userRegisterInputs[2],userRegisterInputs[3]);
}

int activeMode = 0;
String[] userRegisterInputs  = {"","","",""}; //NULL - USERNAME - EMAIL - PASSWORD
