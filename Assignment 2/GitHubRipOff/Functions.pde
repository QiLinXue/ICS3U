String activeUser = "";
Boolean[] activePermissions = {true,true,false};
void getPermissions(String user){

}

void switchScreen(int newScreenMode){
  userRegisterInputs[1]="";
  userRegisterInputs[2]="";
  userRegisterInputs[3]="";
  userLoginInputs[1]="";
  userLoginInputs[2]="";
  screenMode = newScreenMode;
  sShift = 0;

}

void inputBox(int x1, int y1, int x2, int y2, int originalShift, int screenShift, int localMode, String[] inputArray){
    int inputWidth = x2-x1;
    int inputHeight = y2-y1;
    String text = inputArray[localMode];
    fill(255);
    rect(x1,y1+originalShift+screenShift,inputWidth,inputHeight);

    fill(0);
    stroke(0);
    textSize(10);
    textAlign(LEFT,CENTER);
    text(text,x1+5,y1+originalShift+screenShift,inputWidth,inputHeight);
    if(mousePressed && mouseX>x1 && mouseX<x2 && mouseY>y1+originalShift+sShift && mouseY<y2+originalShift+sShift){
        activeMode = localMode;
    }
}

boolean buttonPressed(int x1, int y1, int x2, int y2, int originalShift, int screenShift){
    if(mouseX>x1 && mouseX<x2 && mouseY>y1+originalShift+sShift && mouseY<y2+originalShift+sShift){
        return true;
    }
    else return false;
}

void login(String username, String password){
    try{
      if(password.equals(userDatabase.getString(userDatabase.findRowIndex(username,"Username"),"Password"))){
          activeUser = username;
          switchScreen(2);
      }
      else println("password is incorrect");
    }
    catch(ArrayIndexOutOfBoundsException e){
      println("username does not exist");
    }
}

void register(String username, String email, String password){
    try{
      if(password.equals(userDatabase.getString(userDatabase.findRowIndex(username,"Username"),"Password"))){
          login(username,password);
      }
      else println("username already exists");
    }
    catch(ArrayIndexOutOfBoundsException e){
      println("hiiii");
      userDatabase.addRow();
      userDatabase.setString(userDatabase.lastRowIndex(), "Username", username);
      userDatabase.setString(userDatabase.lastRowIndex(), "Password", password);
      saveTable(userDatabase, "data/users.csv");
      
      switchScreen(2);

    }
}

void scollScreen(){
    int rate = 30; //the smaller the faster
    if(keyPressed){
        if(keyPressed & keyCode == DOWN) sShift-=height/rate;
        if(keyPressed & keyCode == UP && sShift < -1) sShift+=height/rate;
    }
}
