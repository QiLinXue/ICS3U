boolean buttonPressed(int x1, int y1, int x2, int y2, boolean showButton) {
  if (showButton) {
    int w = x2-x1;
    int h = y2-y1;
    fill(0, 100, 100); //dark blue
    rect(x1, y1, w, h);

    //Styling
    fill(255);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Click Me To Start Collecting Your Homework", x1, y1, w, h);
  }

  //Activation
  if (mouseX>x1 && mouseX<x2 && mouseY>y1 && mouseY<y2) {
    return true;
  } else return false;
}

void homeMenuMode() {
  background(0);
  fill(255);

  //Start Game
  if (buttonPressed(width/20, height/20, width-width/20, 5*(height/20), true) && mousePressed) reset();

  //Current Score
  textSize(50);
  if(score != 99 ) text("Your final score was " + score, width/2, (height/3));

  //Leaderboards
  for(int i=0; i<6;i++){
      if(topScores[i] != 0) text(topNames[i] + "  -  " + topScores[i], width-width/4, height/2+i*(height/15));
  }

  //Instructions
  rect(width/20,height/2.5,width/2+width/15,height/2+height/20);
  fill(0);
  textAlign(LEFT,TOP);
  text("use ARROW KEYS to move PLAYER",width/15,height/2.5+height/50);
  text("COLLECT as much HOMEWORk as you can in 60 seconds",width/15,height/2.5+5*height/50);
  text("Don't let your teachers CATCH you",width/15,height/2.5+9*height/50);
  text("You can't get caught in your spawn location",width/15,height/2.5+13*height/50);



}

//-------------------------------------------------------------------------------------------------

String[] topNames;
int[] topScores;

//lol I didn't want to use my brain so I just copied and pasted
void updateLeaderboards(String name, int score) {
  if (score > topScores[5]) topScores[5] = score;
  if (score > topScores[4]) {
    topScores[5] = topScores[4];
    topScores[4] = score;

    topNames[5] = topNames[4];
    topNames[4] = name;
  }
  if (score > topScores[3]) {
    topScores[4] = topScores[3];
    topScores[3] = score;

    topNames[4] = topNames[3];
    topNames[3] = name;
  }
  if (score > topScores[2]) {
    topScores[3] = topScores[2];
    topScores[2] = score;

    topNames[3] = topNames[2];
    topNames[2] = name;
  }
  if (score > topScores[1]) {
    topScores[2] = topScores[1];
    topScores[1] = score;

    topNames[2] = topNames[1];
    topNames[1] = name;
  }
  if (score > topScores[0]) {
    topScores[1] = topScores[0];
    topScores[0] = score;

    topNames[1] = topNames[0];
    topNames[0] = name;
  }

  for(int i=0;i<6;i++){
      leaderboard.setString(i, "Name", topNames[i]);
      leaderboard.setInt(i, "Score", topScores[i]);
  }
  saveTable(leaderboard, "data/1board.csv");
}
