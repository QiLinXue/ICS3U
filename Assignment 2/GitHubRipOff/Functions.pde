import java.math.*;
import java.util.*;
import java.io.UnsupportedEncodingException;
import javax.xml.bind.DatatypeConverter;

String activeUser = "";
Boolean[] activePermissions = {true, true, false};

void getPermissions(String user) {
}

void switchScreen(int newScreenMode) {
  userRegisterInputs[1]="";
  userRegisterInputs[2]="";
  userRegisterInputs[3]="";
  userLoginInputs[1]="";
  userLoginInputs[2]="";
  screenMode = newScreenMode;
  sShift = 0;

  if(newScreenMode == 3) exercisesASetup();
  if(newScreenMode == 4) exercisesBSetup();
}

void inputBox(int x1, int y1, int x2, int y2, int originalShift, int screenShift, int localMode, String[] inputArray) {
  int inputWidth = x2-x1;
  int inputHeight = y2-y1;
  String text = inputArray[localMode];
  fill(255);
  rect(x1, y1+originalShift+screenShift, inputWidth, inputHeight);

  fill(0);
  stroke(0);
  textSize(10);
  textAlign(LEFT, CENTER);
  text(text, x1+5, y1+originalShift+screenShift, inputWidth, inputHeight);
  if (mousePressed && mouseX>x1 && mouseX<x2 && mouseY>y1+originalShift+sShift && mouseY<y2+originalShift+sShift) {
    activeMode = localMode;
  }
}

boolean buttonPressed(int x1, int y1, int x2, int y2, int originalShift, int screenShift, boolean showButton) {
  if(showButton || showAllButtons){
      int w = x2-x1;
      int h = y2-y1;
      fill(0,100,100);
      rect(x1,y1+originalShift+screenShift,w,h);
      fill(255);

      textSize(10);
      textAlign(CENTER,CENTER);
      text("Click Me",x1,y1+originalShift+screenShift,w,h);
  }

  if (mouseX>x1 && mouseX<x2 && mouseY>y1+originalShift+sShift && mouseY<y2+originalShift+sShift) {
    return true;
  } else return false;
}



void login(String username, String password) {
  try {
    String salt1 = userDatabase.getString(userDatabase.findRowIndex(username, "Username"), "Salt1");
    String salt2 = userDatabase.getString(userDatabase.findRowIndex(username, "Username"), "Salt2");
    String encryption = "" + encryptedPassword(password, salt1, salt2);
    if (encryption.equals(userDatabase.getString(userDatabase.findRowIndex(username, "Username"), "Password"))) {
      activeUser = username;
      println("Welcome " + activeUser);
      switchScreen(2);
    } else println("password is incorrect");
  }
  catch(ArrayIndexOutOfBoundsException e) {
    try {
      String salt1 = userDatabase.getString(userDatabase.findRowIndex(username, "Email"), "Salt1");
      String salt2 = userDatabase.getString(userDatabase.findRowIndex(username, "Email"), "Salt2");
      String encryption = "" + encryptedPassword(password, salt1, salt2);
      if (encryption.equals(userDatabase.getString(userDatabase.findRowIndex(username, "Email"), "Password"))) {
        activeUser = userDatabase.getString(userDatabase.findRowIndex(username, "Email"), "Username");
        println("Welcome " + activeUser);
        switchScreen(2);
      } else println("password is incorrect");
    }
    catch(ArrayIndexOutOfBoundsException f) {
      println("username does not exist");
    }
  }
}

void register(String username, String email, String password) {
  try {
      String salt1 = userDatabase.getString(userDatabase.findRowIndex(username, "Username"), "Salt1");
      String salt2 = userDatabase.getString(userDatabase.findRowIndex(username, "Username"), "Salt2");
      String encryption = "" + encryptedPassword(password, salt1, salt2);
      if (encryption.equals(userDatabase.getString(userDatabase.findRowIndex(username, "Username"), "Password"))) {
        activeUser = username;
        println("Welcome " + activeUser);
        switchScreen(2);
      } else println("username already exists");
  }
  catch(ArrayIndexOutOfBoundsException e) {
    if (userDatabase.findRowIndex(email, "Email") > -1) println("Email already exists");
    else{
        println("Welcome!");
        userDatabase.addRow();
        userDatabase.setString(userDatabase.lastRowIndex(), "Username", username);
        userDatabase.setString(userDatabase.lastRowIndex(), "Email", email);
        String salt1 = UUID.randomUUID().toString()+UUID.randomUUID().toString();
        String salt2 = UUID.randomUUID().toString()+UUID.randomUUID().toString();
        userDatabase.setString(userDatabase.lastRowIndex(), "Salt1", salt1);
        userDatabase.setString(userDatabase.lastRowIndex(), "Salt2", salt2);

        String encryption = "" + encryptedPassword(password, salt1, salt2);
        userDatabase.setString(userDatabase.lastRowIndex(), "Password", encryption);
        saveTable(userDatabase, "data/users.csv");

        switchScreen(2);
    }
  }
}

void scollScreen() {
  int rate = 30; //the smaller the faster
  if (keyPressed) {
    if (keyPressed & keyCode == DOWN) sShift-=height/rate;
    if (keyPressed & keyCode == UP && sShift < -1) sShift+=height/rate;
  }
}

BigInteger encryptedPassword(String pwInput, String salt1, String salt2) {
  //-----------------------------------------------
  //Different for each user
  String saltCombination1 = pwInput+salt1;
  String saltCombination2 = salt2+pwInput;

  //-----------------------------------------------
  //Uses a simple encryption by converting it to base 10
  String saltEncryption1 = "";
  String saltEncryption2 = "";
  int salt1length = saltCombination1.length();
  int salt2length = saltCombination2.length();
  for (int i=0; i<salt1length; i++) saltEncryption1+=Integer.toString((int)saltCombination1.charAt(i));
  for (int i=0; i<salt2length; i++) saltEncryption2+=Integer.toString((int)saltCombination2.charAt(i));

  //-----------------------------------------------
  //Find nearest larger prime
  BigInteger prime1 = new BigInteger(saltEncryption1, 10).nextProbablePrime();
  BigInteger prime2 = new BigInteger(saltEncryption2, 10).nextProbablePrime();

  //-----------------------------------------------
  //Finds product of primes
  return prime1.multiply(prime2);
}
