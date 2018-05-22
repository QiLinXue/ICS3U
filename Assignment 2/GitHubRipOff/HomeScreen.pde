PImage homeScreenImage;
String username = "";

void showHomeScreen(){

    //Image
    image(homeScreenImage,0,hsShift);
    fill(255);
    noStroke();
    rect(595,186,242,33);

    fill(0);
    textAlign(LEFT,CENTER);
    textSize(10);
    text(username,595,186,242,33);

    if(keyPressed){
        if(keyPressed & keyCode == DOWN) hsShift-=height/100;
        if(keyPressed & keyCode == UP && hsShift < -1) hsShift+=height/100;
        if(Character.isDigit(key) || Character.isLetter(key)) username+=key;
    }

}

void mouseHomeScreen(){

}

void keyHomeScreen(){

}
