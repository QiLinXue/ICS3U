//-------------------------------------------------------------------------------------------------
User Player;
Coins Homework;
import javax.swing.JOptionPane;

//-------------------------------------------------------------------------------------------------

boolean studentDead = false;
int startTime;
int timer = 60;
int score;
int difficulty;

//-------------------------------------------------------------------------------------------------

void gameSetup(){
    Player = new User(2);
    Homework = new Coins();
}


//-------------------------------------------------------------------------------------------------

void gameMode(){

    //Draws the playing field
    background(0);
    int tileLength = tiles.length;
    float nodeWidth = (height/tileLength);
    for(int i=0;i<tileLength;i++){
        for(int j=0;j<tileLength;j++){
            if(tiles[j][i] == 1) rect(nodeWidth*i,nodeWidth*j,nodeWidth,nodeWidth);
        }
    }

    //Updates all values
    step();

    //Display
    Homework.show(nodeWidth);
    if(!studentDead) Player.show(nodeWidth);
    else Player.reset();
    for(int i=0;i<numTeachers;i++) finalTeacherList[i].show(nodeWidth);
    gameText();

    //CLoses Game
    if(Homework.coinsCollected == 256){
        Homework.coinsCollected++;
    }
    else if(timer == 60 || Homework.coinsCollected == 257){
        if(Homework.coinsCollected == 257) Homework.coinsCollected--;
        mode = 0;
        score = (Homework.coinsCollected + 60 - timer -1 + difficulty);

        //Visuals Only
        //Updates all values
        step();

        //Display
        fill(0);
        rect(0,0,width,height);

        println("Your final score was " +  score);
        mode = 0;

        String name = JOptionPane.showInputDialog("What is your name?");
        updateLeaderboards(name,score);
    }

}

//-------------------------------------------------------------------------------------------------

void gameText(){
    //Timer
    timer = (frameCount-startTime)/fps; //fps = 60
    textSize(50);
    fill(255);

    //Time
    text("Current Time: " + (60-timer),height + height/3, height/10);

    //Coins
    text("Coins Collected: " + Homework.coinsCollected, height + height/3, 2*(height/10));

    //Deaths
    text("Deaths: " + Player.deathCount, height + height/3, 3*(height/10));

    //Difficulty
    text("Difficulty: +" + difficulty + " Bonus", height + height/3, 4*(height/10));

    //Total score'
    score = (Homework.coinsCollected + 60 - timer - 1 + difficulty);
    text("Total Score " + score, height + height/3, 5*(height/10));
}

//-------------------------------------------------------------------------------------------------

void step(){
    if(!studentDead){

      Player.step();

      for(int i=0;i<numTeachers;i++){
          //println(i);
          finalTeacherList[i].step();}

      Homework.step();

    }
}

//-------------------------------------------------------------------------------------------------

void keyPressed(){
  Player.changeDirections();
}

//-------------------------------------------------------------------------------------------------

void reset(){
    //resetTeachers();

    mode = 1;
    startTime = frameCount;
    Player.reset();
    Homework.reset();
    Player.deathCount = 0;

    teacherSetup();

}
