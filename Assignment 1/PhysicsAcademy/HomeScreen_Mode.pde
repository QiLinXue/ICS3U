String homeScreenInputText = "";

void homeScreenMode(){
    background(50);

    //Standard Buttons
    fill(255);
    rect(30,300,540,48,120);
    rect(30,366,540,48,120);
    rect(30,432,540,48,120);
    rect(30,498,540,48,120);

    //Text
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(24);
    text("User Account",30,300,540,48);
    text("Quiz",30,366,540,48);
    text("Solar System",30,432,540,48);
    text("HELP",30,498,540,48);

    //Login Button
    fill(200,250,200);
    rect(174,30,120,36,30);
    rect(306,30,120,36,30);

    fill(0);
    text("Login",174,30,120,36);
    text("Register",306,30,120,36);

    displayBox(30,78,540,60,homeScreenInputText,18);
}

void homeScreenModeMousePressed(){
    //Makes sure following programs can go back
    previousScreenMode = 1;

    //If an action interrupts the log in / register process
    if(mouseY > 300 && mouseY < 480 && homeScreenTypeMode != 0){
        println("login/register failed. Please try again");
        homeScreenInputText = ("login/register failed. Please try again");
        //Reset User Initalizers
        inputtedUser = "";
        inputtedPassword = "";
        newUser = "";
        newPassword = "";

        homeScreenTypeMode = 0; //A cheaty way of resetting the login and register button
    }
    if(mouseX>30 && mouseX  < 570 && mouseY > 366 && mouseY < 414) screenMode = 3;
    if(mouseX>30 && mouseX  < 570 && mouseY > 300 && mouseY < 348) userAccountIntialize(); //screenMode = 5;
    if(mouseX>30 && mouseX  < 570 && mouseY > 432 && mouseY < 480) screenMode = 4;
    if(mouseX>30 && mouseX  < 570 && mouseY > 498 && mouseY < 546) screenMode = 6;
    if(mouseX>174 && mouseX < 294 && mouseY > 30  && mouseY < 66) login();
    if(mouseX>306 && mouseX < 426 && mouseY > 30  && mouseY < 66) register();
}

String activeUser = "EXPERIMENTAL"; //This is the default
String inputtedUser = ""; //This is the user inputted user.
String newUser = "";
String inputtedPassword = ""; //This is the user inputted password.
String newPassword = "";
int homeScreenTypeMode = 0; //1=Login 2=Register 0=null 3=LoginSend 4=RegisterSend 5=LoginPassword 6=RegisterPassword

void homeScreenModeKeyPressed(){

    //Login
    if(homeScreenTypeMode == 1){
        if(keyCode != SHIFT && keyCode != ENTER && keyCode != BACKSPACE && key != ' '){
            inputtedUser+=key;
            homeScreenInputText = inputtedUser;
        } else if(keyCode == BACKSPACE && inputtedUser.length() > 0){
            inputtedUser = inputtedUser.substring(0, inputtedUser.length() - 1);
            homeScreenInputText = inputtedUser;
        }
        if(keyCode == ENTER){
             homeScreenTypeMode = 5;
             println("Hello "+ inputtedUser+ "! Please enter your password");
             homeScreenInputText = ("Hello "+ inputtedUser+ "! Please enter your password");
             //login();
        }
    }

    //Login Password
    if(homeScreenTypeMode == 5){
        if(keyCode != SHIFT && keyCode != ENTER && keyCode != BACKSPACE && key != ' '){
            inputtedPassword+=key;
            homeScreenInputText = inputtedPassword;
        } else if(keyCode == BACKSPACE && inputtedPassword.length() > 0){
            inputtedPassword = inputtedPassword.substring(0, inputtedPassword.length() - 1);
            homeScreenInputText = inputtedPassword;
        }
        if(keyCode == ENTER && inputtedPassword != ""){
            try{
                if(inputtedPassword.contains(nameDataTable.getString(0,inputtedUser)) && inputtedPassword.length() == nameDataTable.getString(0,inputtedUser).length()){
                    homeScreenTypeMode = 3;
                    login();
                } else{
                    println("Password is wrong. Click log in to try again");
                    homeScreenInputText = ("Password is wrong. Click log in to try again");
                    homeScreenTypeMode = 0;
                    inputtedUser = "";
                    inputtedPassword = "";
                }
            }
            catch(Exception e){
                println("Username is wrong. Click log in to try again");
                homeScreenInputText = ("Username is wrong. Click log in to try again");
                homeScreenTypeMode = 0;
                inputtedUser = "";
                inputtedPassword = "";
            }
        }
    }

    //Register
    else if(homeScreenTypeMode == 2){
        if(keyCode != SHIFT && keyCode != ENTER && key != BACKSPACE && key != ' '){
            newUser+=key;
            homeScreenInputText = newUser;
        } else if(keyCode == BACKSPACE && newUser.length() > 0){
            newUser = newUser.substring(0, newUser.length() - 1);
            homeScreenInputText = newUser;
        }
        if(keyCode == ENTER){
            if(newUser.contains("empty") || newUser.contains("userData")){
                println("Nice try bud. This trick won't work on me");
                homeScreenInputText = ("Nice try bud. This trick won't work on me");
                homeScreenTypeMode = 0;
                newUser = "";
            }
            else{
                println("Welcome to the club " + newUser + "!");
                println("Please set your password. Because QiLin's a shitty programmer, you aren't able to change this yet.");
                homeScreenInputText = ("Welcome to the club " + newUser + "! Please set your password.");
                homeScreenTypeMode = 6;
            }
        }
    }

    //Register Password
    if(homeScreenTypeMode == 6){
        if(keyCode != SHIFT && keyCode != ENTER && keyCode != BACKSPACE && key != ' '){
            newPassword+=key;
            homeScreenInputText = newPassword;
        } else if(keyCode == BACKSPACE && newPassword.length() > 0){
            newUser = newPassword.substring(0, newPassword.length() - 1);
            homeScreenInputText = newPassword;
        }
        if(keyCode == ENTER && newPassword != ""){
            try{
                nameDataTable.getString(0,newUser); //Checks for errors
                println("User is already registered. Please either log in or register");
                homeScreenInputText = ("User is already registered. Please either log in or register");
                homeScreenTypeMode = 0;
                newUser = "";
                newPassword = "";
            }
            catch(Exception e){
                println("Your password is " + newPassword);
                homeScreenInputText = ("Welcome " + newUser);
                inputtedPassword = newPassword;
                homeScreenTypeMode = 4;
                register();
            }
        }
    }
}

void login(){
    if(homeScreenTypeMode == 0 || homeScreenTypeMode == 2 || homeScreenTypeMode == 6){
        newUser = "";
        newPassword = "";

        inputtedUser = "";
        println("input your username");
        homeScreenInputText = ("input your username");
        homeScreenTypeMode = 1;
    }
    if(homeScreenTypeMode == 3){
        homeScreenTypeMode = 0;
        for(int i=0;i<nameDataTable.getColumnCount();i++){
           if(nameDataTable.getColumnTitle(i).contains(inputtedUser)){
               activeUser = inputtedUser;
               learnModeInitialize();
               println("Welcome back " + activeUser + "! It's nice to see you again.");
               homeScreenInputText = ("Welcome back " + activeUser + "! It's nice to see you again.");
               break;
           }
           if(i==nameDataTable.getColumnCount()-1) println("no such user exists");
        }
    }
}

void register(){
    if(homeScreenTypeMode == 0 || homeScreenTypeMode == 1 || homeScreenTypeMode == 5){
        inputtedUser = "";
        inputtedPassword = "";

        newUser = "";
        newPassword = "";
        println("create your username");
        homeScreenInputText = ("create your username");
        homeScreenTypeMode = 2;
    }

    if(homeScreenTypeMode == 4){
        homeScreenTypeMode = 0;
        activeUser = newUser;
        saveTable(empty,"data/"+newUser+".csv");
        nameDataTable.addColumn(newUser);
        nameDataTable.setString(0,nameDataTable.getColumnCount()-1,newPassword);
        saveTable(nameDataTable, "data/userData.csv");
        learnModeInitialize();
    }
}

void displayBox(float x1, float y1, float w, float l, String text, float textSize) {
  fill(0);
  rect(x1, y1, w, l, 60);

  fill(255);
  textSize(textSize);
  textAlign(CENTER, CENTER);
  text(text, x1, y1, w, l);
}
