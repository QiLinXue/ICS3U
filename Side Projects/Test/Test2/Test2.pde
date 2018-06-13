int[][] tiles= {

  {0, 0, 0},
  {0, 0, 0},
  {0, 0, 0}
};
int Player_1_score = 0;
int Player_2_score = 0;
//tiles[2][1]

int tileWidth = 200;
int turn = 1; //-1 = O & 1 = X
int screen = 1;

void settings() {
  fullScreen();
}

void draw() {
  drawTiles();
  if (screen ==1) {
    Instructions_page();

  }
  Player_1_score = 0;
    Player_2_score = 0;
}


void drawTiles() {
  background(255);

  textSize(50);
  textAlign(CENTER, CENTER);

  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      fill(255);
      rect(i*tileWidth, j*tileWidth, tileWidth, tileWidth);
      fill(0);
      if (tiles[j][i] == 1) text("X", i*tileWidth, j*tileWidth, tileWidth, tileWidth);
      if (tiles[j][i] == -1) text("O", i*tileWidth, j*tileWidth, tileWidth, tileWidth);
    }
  }






  //---------------------------------

  if (winner() == 1){
      Player_1_wins();
      Player_1_score ++;


  if (winner() == -1){
      Player_2_score ++;
      Player_2_wins();

//---------------------------------
  if (winner() == 1){
      Player_1_wins();
      Player_1_score ++;
  }

  if (winner() == -1){
      Player_2_score ++;
      Player_2_wins();
  }



}
//






void mousePressed() {
  if (
    mouseX<3*tileWidth
    && mouseY<3*tileWidth
    && tiles[mouseY/tileWidth][mouseX/tileWidth] == 0) {

    tiles[mouseY/tileWidth][mouseX/tileWidth] = turn;
    turn = turn * -1;

    if (winner() == 1) {
      println("X wins");
      text ("Player 1 wins this round", 1000, 500);
      background(0);
    }
    if (winner() == -1) {
      println("O wins");
      text ("Player 2 wins this round", 1000, 500);
      background(0);
    }
  }
}


void keyPressed() {
  if (key == 'r') reset();
  if (key == ' ') screen ++;
}


//Resets everything
void reset() {
  background(0);
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      tiles[j][i] = 0;
    }
    turn = 1;
    text("   ", 1000, 500);
  }
}


//Outputs 1 (X wins), -1 (O wins), 0 (no winner yet)
int winner() {
  int winner = 0;

  //Checks if there is a winner in horizontal direction
  for (int i=0; i<3; i++) {
    if (tiles[i][0] == -1 && tiles[i][1] == -1 && tiles[i][2] == -1) winner = -1;
    if (tiles[i][0] == 1 && tiles[i][1] == 1 && tiles[i][2] == 1) winner = 1;
  }

  //Checks if there is winner in vertical direction
  for (int i=0; i<3; i++) {
    if (tiles[0][i] == -1 && tiles[1][i] == -1 && tiles[2][i] == -1) winner = -1;
    if (tiles[0][i] == 1 && tiles[1][i] == 1 && tiles[2][i] == 1) winner = 1;
  }

  //Checks if there is a winner in diagonal direction (top left to bottom right)
  if (tiles[0][0] == -1 && tiles[1][1] == -1 && tiles[2][2] == -1) winner = -1;
  if (tiles[0][0] == 1 && tiles[1][1] == 1 && tiles[2][2] == 1) winner = 1;

  //Checks if there is a winner in diagonal direction (top left to bottom right)
  if (tiles[0][2] == -1 && tiles[1][1] == -1 && tiles[2][0] == -1) winner = -1;
  if (tiles[0][2] == 1 && tiles[1][1] == 1 && tiles[2][0] == 1) winner = 1;

  return winner;
}



String i = "Instructions: The fist player to start is X while the second is O. The objective of this game is to make a continuous row, column, or diagonal filled with your symbol on the grid. After each round, press the r key to start new round. The player who wins the most games out of 3 within 60 seconds wins the game.";

void Instructions_page(){
  background (255);
  textSize(100);
  text("Tic Tac Toe", 950, 150);
  textSize(40);
  text (i, 20, 5, 500, 800);
strokeWeight (20);
  line (800, 300, 800, 900);
  line (1100, 300, 1100, 900);
line (600, 500, 1300, 500);
line (600, 700, 1300, 700);
 textSize(100);
 text("Press Spacebar to start", 950, 1050);


}




void Player_1_wins(){
  background(255);
  textSize(200);
  text("Player 1 wins", width/2, height/2);

  stroke(5);
  line(300, 50, 300, 450);
  textSize(25);
  text ("Player 1 Score", 50, 100);
    text ("Player 2 Score", 350, 100);
  text (Player_1_score, 100, 150);
  text (Player_2_score, 350, 150);
}



void Player_2_wins(){
  background(255);
  textSize(200);
  text("Player 2 wins", width/2, height/2);

  stroke(5);
  line(300, 50, 300, 450);
  textSize(25);
  text ("Player 1 Score", 50, 100);
    text ("Player 2 Score", 350, 100);
  text (Player_1_score, 100, 150);
  text (Player_2_score, 350, 150);
}
