PImage loginScreenImage;

void showLoginScreen(){
    imageMode(CENTER);
    image(loginScreenImage,width/2,height);
    inputBox(342,202,606,234,0,0,1,userLoginInputs); //Login-Email
    inputBox(342,280,606,311,0,0,2,userLoginInputs); //Login-Email

  println(userLoginInputs[1]);
}

void keyLoginScreen(){
    if(key != CODED && keyCode != BACKSPACE && keyCode != ENTER && keyCode != CONTROL) userLoginInputs[activeMode]+=key;
    if(keyCode == BACKSPACE && userLoginInputs[activeMode].length()>0)
        userLoginInputs[activeMode] = userLoginInputs[activeMode].substring(0, userLoginInputs[activeMode].length() - 1);
    if(key == ENTER) println("login()");
}

String[] userLoginInputs  = {"","",""}; //NULL - USERNAME/EMAIL - PASSWORD
