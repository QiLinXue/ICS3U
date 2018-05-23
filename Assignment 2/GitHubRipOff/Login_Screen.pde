PImage loginScreenImage;

void showLoginScreen(){
    imageMode(CENTER);
    image(loginScreenImage,width/2,height);
    inputBox(342,202,606,234,0,0,1,userLoginInputs); //Login-Email
    inputBox(342,280,606,311,0,0,2,userLoginInputs); //Login-Email
}

void keyLogin(){
    if(key != CODED && keyCode != BACKSPACE && keyCode != ENTER && keyCode != CONTROL) userLoginInputs[activeMode]+=key;
    if(keyCode == BACKSPACE && userLoginInputs[activeMode].length()>0)
        userLoginInputs[activeMode] = userLoginInputs[activeMode].substring(0, userLoginInputs[activeMode].length() - 1);
    if(key == ENTER && !userLoginInputs[1].equals("") && !userLoginInputs[2].equals("")) login(userLoginInputs[1],userLoginInputs[2]);
}

String[] userLoginInputs  = {"","",""}; //NULL - USERNAME/EMAIL - PASSWORD

void mouseLogin(){
    if(buttonPressed(342,332,606,365,0,0) && !userLoginInputs[1].equals("") && !userLoginInputs[2].equals("")){
      login(userLoginInputs[1],userLoginInputs[2]);
    }
}
