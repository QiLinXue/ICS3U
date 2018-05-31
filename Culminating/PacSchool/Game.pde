User Player;

Teacher Kikot;
Teacher Seidel;
Teacher Mahan;
Teacher Boyer;

Coins Homework;
boolean studentDead = false;

int startTime;

void gameSetup(){
    Player = new User(2);

    Kikot = new Teacher(5);
    Seidel = new Teacher(20);
    Mahan = new Teacher(5);
    Boyer = new Teacher(2);

    Homework = new Coins();
}

void gameMode(){
    background(0);
    int tileLength = tiles.length;
    float nodeWidth = (height/tileLength);
    for(int i=0;i<tileLength;i++){
        for(int j=0;j<tileLength;j++){
            if(tiles[j][i] == 1) rect(nodeWidth*i,nodeWidth*j,nodeWidth,nodeWidth);
        }
    }

    step();
    Homework.show(nodeWidth);

    if(!studentDead) Player.show(nodeWidth);

    Kikot.show(nodeWidth);
    Seidel.show(nodeWidth);
    Mahan.show(nodeWidth);
    Boyer.show(nodeWidth);
    if(studentDead) Player.reset();

    gameText();

    //CLoses Game
    if(timer == 60 || Homework.coinsCollected == 256){
        println("Your final score was " + (Homework.coinsCollected + timer - 60));
        mode = 0;
    }

}
int timer = 60;
void gameText(){
    //Timer
    timer = (frameCount-startTime)/60; //this is /60 because Processing defaults to 60 frames per second
    textSize(50);
    fill(255);
    text("Current Time: " + (60-timer), width-width/3, height/10);

    //Score
    text("Current Score: " + Homework.coinsCollected, width-width/3, 2*(height/10));
}

void step(){
    if(!studentDead){
      Player.step();

      Kikot.step();
      Mahan.step();
      Seidel.step();
      Boyer.step();

      Homework.step();
    }
}

void keyPressed(){
  Player.changeDirections();

  if(key == ' ') Player.reset();
  if(keyCode == ENTER) reset();

}

void reset(){
    mode = 1;
    startTime = frameCount;
    Player.reset();
    Homework.reset();
}
