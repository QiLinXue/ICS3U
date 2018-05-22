PImage homeScreenImage;
String username = "";

void showHomeScreen(){
    
    //Image
    imageMode(CORNERS);
    image(homeScreenImage,0,hsShift);
    inputBox(595,186,837,219,0,hsShift,1,userRegisterInputs); //Username
    inputBox(595,251,837,283,0,hsShift,2,userRegisterInputs); //Email
    inputBox(595,316,837,349,0,hsShift,3,userRegisterInputs); //Password
    
    inputBox(48,313,253,346,1800,hsShift,1,userRegisterInputs); //Username
    inputBox(280,313,484,346,1800,hsShift,2,userRegisterInputs); //Email
    inputBox(509,313,712,346,1800,hsShift,3,userRegisterInputs); //Password


    if(keyPressed){
        if(keyPressed & keyCode == DOWN) hsShift-=height/100;
        if(keyPressed & keyCode == UP && hsShift < -1) hsShift+=height/100;
    }

}

void mouseHomeScreen(){

}

void keyRegisterScreen(){
    if(key != CODED && keyCode != BACKSPACE && keyCode != ENTER && keyCode != CONTROL) userRegisterInputs[activeMode]+=key;
    if(keyCode == BACKSPACE && userRegisterInputs[activeMode].length()>0)
        userRegisterInputs[activeMode] = userRegisterInputs[activeMode].substring(0, userRegisterInputs[activeMode].length() - 1);
    if(key == ENTER) println("login()");
}

int activeMode = 0;
String[] userRegisterInputs  = {"","","",""}; //NULL - USERNAME - EMAIL - PASSWORD
