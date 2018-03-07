String[] winnerMessage = {"I guess the computer felt sorry for you","I hope you feel accomplished beating a bunch of 1s and 0s","Time to write your cheque, mate"};
String[] loserMessage = {"The purpose of chess is to win not lose","100% of people who lose are losers","This means you just got PAWN'D"};

//{alive=1/dead=0 , white=1/black=-1 , xLocation, yLocation, pieceValue}
//Actual Board
float[][] firstBoard = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,4,1,9},{1,1,5,1,5000},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,5000},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},
};

float[][] resetBoard = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,4,1,9},{1,1,5,1,5000},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,5000},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},
};

float[][] backupBoard = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,4,1,9},{1,1,5,1,5000},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,5000},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},
};
/*
float[][] firstBoard = {

  //White Pieces
  {0,1,1,2,1},{0,1,2,2,1},{0,1,3,2,1},{0,1,4,2,1},{0,1,5,5,1},{0,1,6,2,1},{0,1,7,2,1},{0,1,8,2,1},
  {1,1,3,5,5},{0,1,2,1,3},{0,1,4,4,3},{0,1,4,1,9},{0,1,5,1,0},{0,1,6,1,3},{0,1,7,1,3},{1,1,4,5,5},

  //Black Pieces
  {0,-1,1,8,5},{0,-1,2,8,3},{0,-1,3,8,3},{0,-1,4,8,9},{0,-1,5,8,0},{0,-1,6,8,3},{0,-1,7,8,3},{1,-1,6,5,5},
  {0,-1,1,7,1},{0,-1,2,7,1},{0,-1,3,7,1},{0,-1,4,7,1},{1,-1,5,5,1},{0,-1,6,7,1},{0,-1,7,7,1},{0,-1,8,7,1},

};*/

//First theory board
float[][] secondBoard = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,2,7,9},{1,1,5,1,5000},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,5000},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{0,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},
};

//Second theory board
float[][] thirdBoard = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,3,6,9},{1,1,5,1,5000},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,5000},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},
};

//Third theory board
float[][] fourthBoard = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,3,6,9},{1,1,5,1,5000},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,5000},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},
};

//Global Variables
  int[] pieceSelected = {0,0}; //Placeholder numbers
  int startxco, startyco, endxco, endyco; //Coordinates of the start and finish when moving a piece
  int selectedPieceNumber; //The number coresponding to each piece (0-31)
  int turnNumber = 1; //1=white; 2=black;
  int currentStance = 0; //0=Select Piece; 1=move piece;
  String pieceName; //stores the piece name (P,R,N,B,Q,K)
  int isMouseDown = 0;

//Setup



void setup(){

}
void settings(){
  size(1500,1500);
}

//Draws all the pieces for each frame
void draw(){
  int colorcounteri = 1;
  int colorcounterj = 1;

  //Creates the 8x8 gridlines
  for(int i=0;i<(width-300);i+=(width-300)/8){
    colorcounteri++;
    for(int j=0;j<((height-300));j+=(height-300)/8){
      colorcounterj++;
      if(colorcounterj % 2 == 0){
        if(colorcounteri % 2 == 0){
          fill(255);
        } else{
          fill(135,206,250);
        }
      } else{
        if(colorcounteri % 2 == 0){
          fill(135,206,250);
        } else{
          fill(255);
        }
      }
      noStroke();
      rect(i,j,(width-300)/8,(height-300)/8);
      stroke(0);
    }
  }

  //Creates the buttons
  rect(0,1200,300,300);
  textSize(50);
  fill(0);
  text("SETTINGS",50,1370);

  if(isMouseDown == 1){
    fill(0);
    rect(downx,downy,1200/8,(height-300)/8);
  }

  //Places all the pieces onto the board
  for(int i=0;i<32;i++){
    place(i);
  }

  //Evaluation bar
  if(evaluate(firstBoard) > 4000){
    fill(255);
    rect(1200,0,30,1200);
  }

  else if(evaluate(firstBoard) > 4000){
    fill(0);
    rect(1200,0,30,1200);
  } else{
    rect(1200,0,30,600+(evaluate(firstBoard) * 30));
    fill(0);
    rect(1200,600+(evaluate(firstBoard) * 30),30,600-(evaluate(firstBoard) * 30));
  }



  //Checkmate Message
  if(evaluate(firstBoard) > 4000){
    fill(178, 255, 102);
    rect(75,75,1050,750);
    textSize(100);
    fill(0);
    text("You Won",400,400);
    textSize(48);
    text("I guess the computer felt sorry for your life",100,500);

    textSize(60);
    text("Click 'r' to try again",340,700);
  }

  else if(evaluate(firstBoard) < -4000){
    fill(255,102,102);
    rect(75,75,1050,750);
    textSize(100);
    fill(0);
    text("You Lost",400,400);
    textSize(48);
    text("DYK 100% of people who lose are losers",130,500);

    textSize(60);
    text("Click 'r' to try again",340,700);
  }

}

//Creates the board evaluation
float evaluate(float[][] typeBoard){
  float evaluation = 0;
  if(isCheckmate()){
    evaluation = 9999;
  }
  else{
    for(int i=0; i<32; i++){
      //Piece Values
      evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*typeBoard[i][4];

      //If centralized pawns
      if((i < 8 || i > 23) && (typeBoard[i][2] == 4 || typeBoard[i][2] == 5) && (typeBoard[i][3] == 4 || typeBoard[i][3] == 5)){
          evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*0.25;
      }

      //If Knight is on edge of board
      if((i == 9 || i == 14 || i == 17 || i == 22) && (typeBoard[i][2] == 1 || typeBoard[i][2] == 8)){
          evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(-0.1);
      }

      //If white pawn structure
      if(
          i < 8 && i != 1 && i != 8
          && ((
          exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3]) - 1)[0] == 1
          && exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[1] < 8)
          || (exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[0] == 1
            && exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[1] < 8))){
              evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.05);
      }

      //If black pawn structure
      if(
           i > 23 && i != 24 && i !=31
           && ((
              exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3]) + 1)[0] == 1
              && exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[1] > 23)
           || (exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[0] == 1
              && exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[1] > 23))){
              evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.05);
      }

      //If centralized rooks
      if((i == 8 || i == 15 || i == 16 || i == 23) && ((typeBoard[i][2] > 2 && typeBoard[i][2] < 6))){
        evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.15);
      }

      //If rooks are in bad position
      boolean rookup1 = ((typeBoard[i][2] == 1 && typeBoard[i][3] == 2) ||(typeBoard[i][2] == 8 && typeBoard[i][3] == 2) ||(typeBoard[i][2] == 1 && typeBoard[i][3] == 7) ||(typeBoard[i][2] == 8 && typeBoard[i][3] == 7));
      boolean rookleftright1 = ((typeBoard[i][2] == 7) || (typeBoard[i][2] == 2));

      if((i == 8 || i == 15 || i == 16 || i == 23) &&
          (rookup1 || rookleftright1)){
            evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(-0.1);
      }

      //If finachetto bishops
      if(i == 10 || i == 13 || i == 18 || i == 21 &&
         ((typeBoard[i][2] == 2 && typeBoard[i][3] == 2)
        ||(typeBoard[i][2] == 7 && typeBoard[i][3] == 2)
        ||(typeBoard[i][2] == 2 && typeBoard[i][3] == 7)
        ||(typeBoard[i][2] == 7 && typeBoard[i][3] == 7)
        )){
        evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.16);
      }

      //If centralized knights
      if(i == 9 || i == 12 || i == 17 || i == 22 &&
        ((typeBoard[i][2] == 3 && typeBoard[i][3] == 3)
        ||(typeBoard[i][2] == 6 && typeBoard[i][3] == 3)
        ||(typeBoard[i][2] == 3 && typeBoard[i][3] == 6)
        ||(typeBoard[i][2] == 6 && typeBoard[i][3] == 6)
        )){
        evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.16);
      }

      //If castled
      if((i == 12 || i == 20) && ((typeBoard[i][2] == 7) || (typeBoard[i][2] == 3)) && ((typeBoard[i][3] == 1) || (typeBoard[i][3] == 8))){
        evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.5);
      }


    }

  }

  return evaluation;}

//Checks if King is checkmates
boolean isCheckmate(){
  return false;}

//For the input piece number, it will plot the piece on the graph
void place(int pieceNum){
  if(firstBoard[pieceNum][0] == 1){
    if(pieceNum <= 7 || pieceNum >= 24){
      pieceName = "P";
    } else if(pieceNum == 8 || pieceNum == 15 || pieceNum == 16 || pieceNum == 23){
      pieceName = "R";
    } else if(pieceNum == 9 || pieceNum == 14 || pieceNum == 17 || pieceNum == 22){
      pieceName = "N";
    } else if(pieceNum == 10 || pieceNum == 13 || pieceNum == 18 || pieceNum == 21){
      pieceName = "B";
    } else if(pieceNum == 11 || pieceNum == 19){
      pieceName = "Q";
    } else if(pieceNum == 12 || pieceNum == 20){
      pieceName = "K";
    }

    ellipseMode(CORNER);

    if((firstBoard[pieceNum][1]) == 1){
      fill(255);
      ellipse(1200/8*(firstBoard[pieceNum][2]-1),(height-300)-(firstBoard[pieceNum][3]*(height-300)/8),1200/8,(height-300)/8);
      fill(50);
    } else{
      fill(50);
      ellipse(1200/8*(firstBoard[pieceNum][2]-1),(height-300)-(firstBoard[pieceNum][3]*(height-300)/8),1200/8,(height-300)/8);
      fill(255);
    }
    textSize((height-300)/9);
    text(pieceName,1200/8*(firstBoard[pieceNum][2]-1)+(height-300)/36,(height-300)-(firstBoard[pieceNum][3]*(height-300)/8)+(height-300)/8-(height-300)/36);
    fill(255);
  }}

int downx, downy;
//Actual Moving Around
int[] square(){
  int[] currentsquare = {(floor(mouseX/(1200/8))+1),8 - (floor(mouseY/((height-300)/8)))};
  return currentsquare; //Returns the x and y coordinates (relative to the board) of the current mouse value
}

void mousePressed(){
  if(mouseButton == RIGHT && currentStance == 1){
    currentStance = 0;
    isMouseDown = 0;
    downx = 10000;
    downy = 10000;
  }
  else{
  if(turnNumber == 1){ //White to Move
    if(currentStance == 0 && exists(firstBoard,square()[0],square()[1])[0] == 1 && exists(firstBoard,square()[0],square()[1])[1] < 16){
      startxco = square()[0];
      startyco = square()[1];
      selectedPieceNumber = exists(firstBoard,startxco,startyco)[1];
      currentStance = 1;
      isMouseDown = 1;
      downx = (floor(mouseX/(1200/8)))*1200/8;
      downy = ((floor(mouseY/((height-300)/8))))*1200/8;
    }

    if(realmoveLegal(startxco,startyco,square()[0],square()[1]) == 1 && currentStance == 1 && (exists(firstBoard,square()[0],square()[1])[0] == 0 || (exists(firstBoard,square()[0],square()[1])[0] == 1 && exists(firstBoard,square()[0],square()[1])[1] >= 16))){
        copyPieces(firstBoard,backupBoard);
        endxco = square()[0];
        endyco = square()[1];
        if(exists(firstBoard,endxco,endyco)[1] >= 16 && exists(firstBoard,endxco,endyco)[0] == 1){
          firstBoard[exists(firstBoard,endxco,endyco)[1]][0] = 0;
        }
        firstBoard[selectedPieceNumber][2] = endxco;
        firstBoard[selectedPieceNumber][3] = endyco;

        //Check if it can castle
        if(selectedPieceNumber == 12 && startxco == 5 && startyco == 1 && endxco == 7 && endyco == 1){
          firstBoard[15][2] = 6;
        }
        else if(selectedPieceNumber == 12 && startxco == 5 && startyco == 1 && endxco == 3 && endyco == 1){
          firstBoard[8][2] = 4;
        }

        currentStance = 0;
        turnNumber = 2;

        isMouseDown = 0;
        downx = 10000;
        downy = 10000;
    }
  }
  else if(turnNumber == 2){ //Black to move
    if(currentStance == 0 && exists(firstBoard,square()[0],square()[1])[0] == 1 && exists(firstBoard,square()[0],square()[1])[1] >= 16){
      startxco = square()[0];
      startyco = square()[1];
      selectedPieceNumber = exists(firstBoard,startxco,startyco)[1];
      currentStance = 1;
      isMouseDown = 1;
      downx = (floor(mouseX/(1200/8)))*1200/8;
      downy = ((floor(mouseY/((height-300)/8))))*1200/8;
    }
    if(realmoveLegal(startxco,startyco,square()[0],square()[1]) == 1 && currentStance == 1 && (exists(firstBoard,square()[0],square()[1])[0] == 0 || (exists(firstBoard,square()[0],square()[1])[0] == 1 && exists(firstBoard,square()[0],square()[1])[1] < 16))){
        copyPieces(firstBoard,backupBoard);
        endxco = square()[0];
        endyco = square()[1];
        if(exists(firstBoard,endxco,endyco)[1] < 16 && exists(firstBoard,endxco,endyco)[0] == 1 ){
          firstBoard[exists(firstBoard,endxco,endyco)[1]][0] = 0;
        }
        firstBoard[selectedPieceNumber][2] = endxco;
        firstBoard[selectedPieceNumber][3] = endyco;

        //If Can Castle
        if(selectedPieceNumber == 20 && startxco == 5 && startyco == 8 && endxco == 7 && endyco == 8){
          firstBoard[23][2] = 6;
        }
        else if(selectedPieceNumber == 20 && startxco == 5 && startyco == 8 && endxco == 3 && endyco == 8){
          firstBoard[16][2] = 4;
        }

        //Switch players
        currentStance = 0;
        turnNumber = 1;

        isMouseDown = 0;
        downx = 10000;
        downy = 10000;
    }

  }}}

//For the input coordinate, it will output whether that piece is occupied, and if so, what piece number it has (0-31)
int[] exists(float[][] typeBoard, int x, int y){
  pieceSelected[0] = 0;
  pieceSelected[1] = 0;
  if(x <= 0 || x > 8 || y <= 0 || y > 8){
    pieceSelected[0] = -1;
  } else{
    for(int i = 0; i<32; i++){
      if(typeBoard[i][2] == x && typeBoard[i][3] == y && typeBoard[i][0] == 1){
        pieceSelected[0] = 1;
        pieceSelected[1] = i;
      }
    }
  }
  return pieceSelected;}

//Checks if a move is legal based off of the start coordinate and the end Coordinate
int moveLegal(){
  return 1;}

//Copies the values of one board to another through conversions of 1d and 2d arrays
void copyPieces(float[][] board1, float[][] board2){
  float[] buffer1d = {};

  for(int i = 0; i<board1.length; i++){
    for(int j = 0; j<board1[i].length; j++){
      buffer1d = append(buffer1d, board1[i][j]);
    }
  }

  int h = 0;
  for(int i = 0;i<32;i++){
    for(int j = 0; j<board1[i].length;j++){
      board2[i][j] = buffer1d[h];
      h++;
    }
  }
}



//AI STARTS HERE






//Searches for the best black move with depth1
int[] bestBlackMove_depth1(float[][] actualBoard, float[][] theoryBoard){
  float lowestEvalScore = 9000;
  int[] lowestEvalMove = {8,8,1,3};
  copyPieces(actualBoard, theoryBoard);
  int looplength = possibleMoves(actualBoard).length;
  for(int i = 0; i< looplength; i++){
      copyPieces(actualBoard, theoryBoard);
      int[] theMove = possibleMoves(theoryBoard)[i];
      execute(theMove,theoryBoard);
      //println(theMove[0],theMove[1],theMove[2],theMove[3],evaluate(theoryBoard));

      if(evaluate(theoryBoard) < lowestEvalScore){
        lowestEvalScore = evaluate(theoryBoard);
        lowestEvalMove = theMove;
      }
      else if(abs(evaluate(theoryBoard)-lowestEvalScore) < 0.05 && random(0,4) > 1){

        lowestEvalScore = evaluate(theoryBoard);
        lowestEvalMove = theMove;

      }
      copyPieces(actualBoard, theoryBoard);
  }
  copyPieces(actualBoard, theoryBoard);

  return lowestEvalMove;
}

//Searches for the best black move with depth2
int[] bestBlackMove_depth2(float[][] actualBoard, float[][] theoryBoard2, float[][] theoryBoard3){
    //Setup
    copyPieces(actualBoard,theoryBoard2);
    copyPieces(theoryBoard2,theoryBoard3);
    float lowestEvalScore = 9000;
    int[] lowestEvalMove = {8,8,1,5};
    copyPieces(actualBoard, theoryBoard2);

    //Loops through all possible moves for black
    int looplength = possibleMoves(actualBoard).length;
    for(int i = 0; i< looplength; i++){
        turnNumber = 2;
        copyPieces(actualBoard, theoryBoard2);

        //Execute one of the possible moves for white
        int[] secondMove = possibleMoves(theoryBoard2)[i];
        execute(secondMove,theoryBoard2);

        //Begin to find best move for black
        copyPieces(theoryBoard2,theoryBoard3);
        turnNumber = 1;

        //Execute best black move
        execute(bestWhiteMove_depth1(theoryBoard2,theoryBoard3),theoryBoard3);

        //Check if theoryboard3's evaluation is higher than the rest assuming black plays perfectly
        if(evaluate(theoryBoard3) < lowestEvalScore){
          lowestEvalScore = evaluate(theoryBoard3);
          lowestEvalMove = secondMove;
        }
        else if(abs(evaluate(theoryBoard3)-lowestEvalScore) < 0.05 && random(0,4) > 1){
          lowestEvalScore = evaluate(theoryBoard3);
          lowestEvalMove = secondMove;
        }

        copyPieces(actualBoard, theoryBoard2);
        copyPieces(theoryBoard2, theoryBoard3);
    } //Loop ends

    turnNumber = 2;
    copyPieces(actualBoard, theoryBoard2);
    copyPieces(theoryBoard2, theoryBoard3);
    return lowestEvalMove;
}

//Searches for the best white move with best white move with depth1
int[] bestWhiteMove_depth1(float[][] actualBoard, float[][] theoryBoard){
  float highestEvalScore = -9000;
  int[] highestEvalMove = {8,8,1,3};
  copyPieces(actualBoard, theoryBoard);
  int looplength = possibleMoves(actualBoard).length;
  for(int i = 0; i< looplength; i++){
      copyPieces(actualBoard, theoryBoard);
      int[] theMove = possibleMoves(theoryBoard)[i];
      execute(theMove,theoryBoard);

      if(evaluate(theoryBoard) > highestEvalScore){
        highestEvalScore = evaluate(theoryBoard);
        highestEvalMove = theMove;
      }
      else if(abs(evaluate(theoryBoard)-highestEvalScore) < 0.05 && random(0,4) > 1){
        highestEvalScore = evaluate(theoryBoard);
        highestEvalMove = theMove;
      }
      copyPieces(actualBoard, theoryBoard);
  }

  copyPieces(actualBoard, theoryBoard);
  return highestEvalMove;
}

//Searches for the best white move with depth2
int[] bestWhiteMove_depth2(float[][] actualBoard, float[][] theoryBoard2, float[][] theoryBoard3){

    //Setup
    copyPieces(actualBoard,theoryBoard2);
    copyPieces(theoryBoard2,theoryBoard3);
    float highestEvalScore = -9000;
    int[] highestEvalMove = {8,8,1,5};
    copyPieces(actualBoard, theoryBoard2);

    //Loops through all possible moves for white
    int looplength = possibleMoves(actualBoard).length;
    for(int i = 0; i< looplength; i++){
        turnNumber = 1;
        copyPieces(actualBoard, theoryBoard2);

        //Execute one of the possible moves for white
        int[] secondMove = possibleMoves(theoryBoard2)[i];
        execute(secondMove,theoryBoard2);

        //Begin to find best move for black
        copyPieces(theoryBoard2,theoryBoard3);
        turnNumber = 2;

        //Execute best black move
        execute(bestBlackMove_depth1(theoryBoard2,theoryBoard3),theoryBoard3);

        //Check if theoryboard3's evaluation is higher than the rest assuming black plays perfectly
        if(evaluate(theoryBoard3) > highestEvalScore){
          highestEvalScore = evaluate(theoryBoard3);
          highestEvalMove = secondMove;
        }
        else if(abs(evaluate(theoryBoard3)-highestEvalScore) < 0.05 && random(0,4) > 1){
          highestEvalScore = evaluate(theoryBoard3);
          highestEvalMove = secondMove;
        }
        copyPieces(actualBoard,theoryBoard2);
        copyPieces(theoryBoard2,theoryBoard3);
    } //Loop ends

    turnNumber = 1;
    copyPieces(actualBoard,theoryBoard2);
    copyPieces(theoryBoard2,theoryBoard3);
    return highestEvalMove;
}

//Searches for the best white move with depth3
int[] bestWhiteMove_depth3(float[][] actualBoard, float[][] theoryBoard2, float[][] theoryBoard3, float[][] theoryBoard4){

    //Setup
    copyPieces(actualBoard,theoryBoard2);
    copyPieces(theoryBoard2,theoryBoard3);
    copyPieces(theoryBoard3,theoryBoard4);

    float highestEvalScore = -9000;
    int[] highestEvalMove = {8,8,1,5};

    //Loops through all possible moves for white
    int looplength = possibleMoves(actualBoard).length;
    for(int i = 0; i< looplength; i++){
        turnNumber = 1;
        copyPieces(actualBoard, theoryBoard2);

        //Execute one of the possible moves for white
        int[] secondMove = possibleMoves(theoryBoard2)[i];
        //int[] secondMove = {4,5,5,5};
        execute(secondMove,theoryBoard2);

        //Begin to find best move for black
        copyPieces(theoryBoard2,theoryBoard3);
        copyPieces(theoryBoard3,theoryBoard4);
        turnNumber = 2;

        //Execute best black move

        execute(bestBlackMove_depth2(theoryBoard2,theoryBoard3,theoryBoard4),theoryBoard3);
      /*  println(bestBlackMove_depth2(theoryBoard2,theoryBoard3,theoryBoard4)[0],
        bestBlackMove_depth2(theoryBoard2,theoryBoard3,theoryBoard4)[1],
        bestBlackMove_depth2(theoryBoard2,theoryBoard3,theoryBoard4)[2],
        bestBlackMove_depth2(theoryBoard2,theoryBoard3,theoryBoard4)[3],evaluate(theoryBoard3));*/
        //Check if theoryboard3's evaluation is higher than the rest assuming black plays perfectly
        if(evaluate(theoryBoard3) > highestEvalScore){
          highestEvalScore = evaluate(theoryBoard3);
          highestEvalMove = secondMove;
        }
        else if(abs(evaluate(theoryBoard3)-highestEvalScore) < 0.05 && random(0,4) > 1){
          highestEvalScore = evaluate(theoryBoard3);
          highestEvalMove = secondMove;
        }
        turnNumber = 1;
    } //Loop ends

    return highestEvalMove;
}




//Computer automove
void keyPressed(){
  if(key == 'y'){
    if(turnNumber == 1){
      execute(bestWhiteMove_depth3(firstBoard,secondBoard,thirdBoard,fourthBoard),firstBoard);
      turnNumber = 2;
    }
  }
  if(keyCode == ENTER){
    if(turnNumber == 1){
      execute(bestWhiteMove_depth2(firstBoard,secondBoard,thirdBoard),firstBoard);
      //execute(bestWhiteMove_depth3(firstBoard,secondBoard,thirdBoard,fourthBoard),firstBoard);
    }

    if(turnNumber == 2){
      //execute(bestBlackMove_depth1(firstBoard,secondBoard),firstBoard);
      execute(bestBlackMove_depth2(firstBoard,secondBoard,thirdBoard),firstBoard);

    }

    if(turnNumber == 1){
      turnNumber = 2;
    }

    else if(turnNumber == 2){
      turnNumber = 1;
    }
  }
  if(key == 'r'){
    turnNumber = 1;
    copyPieces(resetBoard,firstBoard);
  }

  if(backupBoard != firstBoard){
    if(key == 'l' && turnNumber == 1){
      copyPieces(backupBoard,firstBoard);
      turnNumber = 2;
    }
    else if(key == 'l' && turnNumber == 2){
      copyPieces(backupBoard,firstBoard);
      turnNumber = 1;
    }
  }


}

//Executes a move given its 2 coordinates
void execute(int[] autoMove, float[][] typeBoard){
  copyPieces(firstBoard,backupBoard);
  int startx = autoMove[0];
  int starty = autoMove[1];
  int endx = autoMove[2];
  int endy = autoMove[3];
  int placeholderx, placeholdery;
  placeholderx = 0;
  placeholdery = 0;

  if(turnNumber == 1){ //White to move
    selectedPieceNumber = exists(typeBoard,startx,starty)[1];
    if(exists(typeBoard,startx,starty)[0] == 1 && ((exists(typeBoard,endx,endy)[0] == 0) || (exists(typeBoard,endx,endy)[0] == 1 && (exists(typeBoard,endx,endy)[1] >= 16))) && exists(typeBoard,startx,starty)[1] < 16){
      placeholderx = endx;
      placeholdery = endy;
      //turnNumber = 2;
      if(exists(typeBoard,endx,endy)[1] >= 16){
        typeBoard[exists(typeBoard,endx,endy)[1]][0] = 0;
        //println("triggered");
      }
      else if(selectedPieceNumber == 12 && startx == 5 && starty == 1 && endx == 7 && endy == 1){
        typeBoard[15][2] = 6;
      }
      else if(selectedPieceNumber == 12 && startx == 5 && starty == 1 && endx == 3 && endy == 1){
        typeBoard[8][2] = 4;
      }
    }
  } else if(turnNumber == 2){ //Black to move
      selectedPieceNumber = exists(typeBoard,startx,starty)[1];
      if(exists(typeBoard,startx,starty)[0] == 1 && ((exists(typeBoard,endx,endy)[0] == 0) || (exists(typeBoard,endx,endy)[0] == 1 && (exists(typeBoard,endx,endy)[1] < 16))) && exists(typeBoard,startx,starty)[1] >= 16){

        placeholderx = endx;
        placeholdery = endy;
        if(exists(typeBoard,endx,endy)[1] < 16 && exists(typeBoard,endx,endy)[1] > 0){
          typeBoard[exists(typeBoard,endx,endy)[1]][0] = 0;
        }
        else if(selectedPieceNumber == 20 && startx == 5 && starty == 8 && endx == 7 && endy == 8){
          typeBoard[23][2] = 6;
        }
        else if(selectedPieceNumber == 16 && startx == 5 && starty == 8 && endx == 3 && endy == 8){
          typeBoard[23][2] = 3;
        }
      }
    }
    typeBoard[selectedPieceNumber][2] = placeholderx;
    typeBoard[selectedPieceNumber][3] = placeholdery;

  }

//Uses the current coordinates from typeBoard to generate a 2d array with all the neccessary coordinates to be executed
int[][] possibleMoves(float[][] typeBoard){

  int[] nothing = {};
  int[][] moves = {};
  int[] onemove = {};

  if(turnNumber == 1){
    for(int i=0;i<16;i++){ //All possible pieces for white
      onemove = nothing;
      if(typeBoard[i][0] == 1){

        //If piece is a pawn
        if(i < 8){

          //Check if it can move up by 1
          if(exists(typeBoard,int(typeBoard[i][2]),int((typeBoard[i][3] + 1)))[0] == 0){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3] + 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //Check if it can move up by 2
         if(typeBoard[i][3] == 2 && exists(typeBoard,int(typeBoard[i][2]),int((typeBoard[i][3] + 1)))[0] == 0 && exists(typeBoard,int(typeBoard[i][2]),int((typeBoard[i][3] + 2)))[0] == 0){
           onemove = append(onemove, int(typeBoard[i][2]));
           onemove = append(onemove, int(typeBoard[i][3]));
           onemove = append(onemove, int(typeBoard[i][2]));
           onemove = append(onemove, int(typeBoard[i][3] + 2));

            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //Check if it can capture to the right
          if(exists(typeBoard,int(typeBoard[i][2] + 1),int((typeBoard[i][3] + 1)))[0] == 1 && exists(typeBoard,int(typeBoard[i][2] + 1),int((typeBoard[i][3] + 1)))[1] >= 16){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 1));
            onemove = append(onemove, int(typeBoard[i][3] + 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
           }

           //Check if it can capture to the left
           if(exists(typeBoard,int(typeBoard[i][2] - 1),int((typeBoard[i][3] + 1)))[0] == 1 && exists(typeBoard,int(typeBoard[i][2] - 1),int((typeBoard[i][3] + 1)))[1] >= 16){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 1));
            onemove = append(onemove, int(typeBoard[i][3] + 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
           }
        }

        //If piece is a rook
        else if(i == 8 || i == 15){
           //Checks if it can move up;
           for(int j = 1; j<=8; j++){
             if(
               exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
               || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                  && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))
               )
               {
                 onemove = append(onemove, int(typeBoard[i][2]));
                 onemove = append(onemove, int(typeBoard[i][3]));
                 onemove = append(onemove, int(typeBoard[i][2]));
                 onemove = append(onemove, int(typeBoard[i][3] + j));
                 moves = (int[][])append(moves,onemove);
                 onemove = nothing;
                 if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))){
                   j = 10;
                 }
             } else{
                  j = 10;
                  onemove = nothing;
             }
           }

           //Checks if it can move down;
           for(int j = -1; j>=-8; j--){
             if(
               exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
               || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                  && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))
               )
               {
                 onemove = append(onemove, int(typeBoard[i][2]));
                 onemove = append(onemove, int(typeBoard[i][3]));
                 onemove = append(onemove, int(typeBoard[i][2]));
                 onemove = append(onemove, int(typeBoard[i][3] + j));
                 moves = (int[][])append(moves,onemove);
                 onemove = nothing;
                 if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))){
                   j = -10;
                 }
             } else{
                  j = -10;
                  onemove = nothing;
             }
           }

           //Checks if it can move right;
           for(int j = 1; j<=8; j++){
             if(
               exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
               || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                  && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))
               )
               {
                 onemove = append(onemove, int(typeBoard[i][2]));
                 onemove = append(onemove, int(typeBoard[i][3]));
                 onemove = append(onemove, int(typeBoard[i][2] + j));
                 onemove = append(onemove, int(typeBoard[i][3]));
                 moves = (int[][])append(moves,onemove);
                 onemove = nothing;
                 if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))){
                    j = 10;
                 }
             } else{
                  j = 10;
                  onemove = nothing;
             }
           }

           //Checks if it can move left;
           for(int j = -1; j>=-8; j--){
             if(
               exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
               || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                  && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))
               )
               {
                 onemove = append(onemove, int(typeBoard[i][2]));
                 onemove = append(onemove, int(typeBoard[i][3]));
                 onemove = append(onemove, int(typeBoard[i][2] + j));
                 onemove = append(onemove, int(typeBoard[i][3]));
                 moves = (int[][])append(moves,onemove);
                 onemove = nothing;
                 if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))){
                    j = -10;
                 }
             } else{
                  j = -10;
                  onemove = nothing;
             }
           }
        }

        //If piece is knight
        else if(i == 9 || i == 14){

          //If piece can move 1 up 2 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] + 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] + 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] + 1))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 2));
            onemove = append(onemove, int(typeBoard[i][3] + 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 1 up 2 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] + 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] + 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] + 1))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 2));
            onemove = append(onemove, int(typeBoard[i][3] + 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 1 down 2 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] - 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] - 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] - 1))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 2));
            onemove = append(onemove, int(typeBoard[i][3] - 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }


          //If piece can move 1 down 2 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] - 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] - 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] - 1))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 2));
            onemove = append(onemove, int(typeBoard[i][3] - 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 up 1 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 2))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 1));
            onemove = append(onemove, int(typeBoard[i][3] + 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 up 1 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 2))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 1));
            onemove = append(onemove, int(typeBoard[i][3] + 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 down 1 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 2))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 1));
            onemove = append(onemove, int(typeBoard[i][3] - 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 down 1 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 2))[1] >= 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 1));
            onemove = append(onemove, int(typeBoard[i][3] - 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }
        }

        //If piece is bishop
        else if(i == 10 || i == 13){

          //If piece can move diagonally from top left to bottom right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))){
                j = 10;
              }

            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom right to top left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))){
                j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom left to top right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))){
                   j = 10;
              }
            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from top right to bottom left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))){
                   j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }
        }

        //If piece is queen
        else if(i == 11){
          //Checks if it can move up;
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + j));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))){
                  j = 10;
                }
            } else{
                 j = 10;
                 onemove = nothing;
            }
          }

          //Checks if it can move down;
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + j));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] >= 16))){
                  j = -10;
                }
            } else{
                 j = -10;
                 onemove = nothing;
            }
          }

          //Checks if it can move right;
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + j));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))){
                   j = 10;
                }
            } else{
                 j = 10;
                 onemove = nothing;
            }
          }

          //Checks if it can move left;
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + j));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] >= 16))){
                   j = -10;
                }
            } else{
                 j = -10;
                 onemove = nothing;
            }
          }

          //If piece can move diagonally from top left to bottom right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))){
                j = 10;
              }

            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom right to top left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] >= 16))){
                j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom left to top right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))){
                   j = 10;
              }
            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from top right to bottom left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] >= 16))){
                   j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }
        }

        //If piece is King
        else if(i == 12){
          //Checks if it can move up;
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + 1))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + 1));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //Checks if it can move down;
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] - 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] - 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] - 1))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] - 1));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //Checks if it can move right;
            if(
              exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 0))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + 1));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //Checks if it can move left;
            if(
              exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 0))[1] >= 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] - 1));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //If piece can move diagonally from top left to bottom right
            if(
              exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + 1));
              onemove = append(onemove, int(typeBoard[i][3] - 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can move diagonally from bottom right to top left
            if(
              exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] - 1));
              onemove = append(onemove, int(typeBoard[i][3] + 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can move diagonally from bottom left to top right
            if(
              exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + 1));
              onemove = append(onemove, int(typeBoard[i][3] + 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can move diagonally from top right to bottom left
            if(
              exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[1] >= 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] - 1));
              onemove = append(onemove, int(typeBoard[i][3] - 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can castle kingside
          if(
             exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3]))[0] == 0
          && exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3]))[0] == 0
          && exists(typeBoard,int(typeBoard[i][2] + 3),int(typeBoard[i][3]))[1] == 15
            ){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 2));
            onemove = append(onemove, int(typeBoard[i][3]));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can castle Queenside
          if(
             exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3]))[0] == 0
          && exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3]))[0] == 0
          && exists(typeBoard,int(typeBoard[i][2] - 3),int(typeBoard[i][3]))[0] == 0
          && exists(typeBoard,int(typeBoard[i][2] - 4),int(typeBoard[i][3]))[1] == 8
            ){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 2));
            onemove = append(onemove, int(typeBoard[i][3]));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }


        }
      }
    }
  }
  if(turnNumber == 2){
    for(int i=16;i<32;i++){ //All possible pieces for black
      onemove = nothing;
      if(typeBoard[i][0] == 1){ //Qualitative comments from black POV

        //If piece is a pawn
        if(i > 23){

          //Check if it can move up by 1
          if(exists(typeBoard,int(typeBoard[i][2]),int((typeBoard[i][3] - 1)))[0] == 0){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3] - 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //Check if it can move up by 2
         if(typeBoard[i][3] == 7 && exists(typeBoard,int(typeBoard[i][2]),int((typeBoard[i][3] - 1)))[0] == 0 && exists(typeBoard,int(typeBoard[i][2]),int((typeBoard[i][3] - 2)))[0] == 0){
           onemove = append(onemove, int(typeBoard[i][2]));
           onemove = append(onemove, int(typeBoard[i][3]));
           onemove = append(onemove, int(typeBoard[i][2]));
           onemove = append(onemove, int(typeBoard[i][3] - 2));

            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //Check if it can capture to the right
          if(exists(typeBoard,int(typeBoard[i][2] - 1),int((typeBoard[i][3] - 1)))[0] == 1 && exists(typeBoard,int(typeBoard[i][2] - 1),int((typeBoard[i][3] - 1)))[1] < 16){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 1));
            onemove = append(onemove, int(typeBoard[i][3] - 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
           }

           //Check if it can capture to the left
           if(exists(typeBoard,int(typeBoard[i][2] + 1),int((typeBoard[i][3] - 1)))[0] == 1 && exists(typeBoard,int(typeBoard[i][2] + 1),int((typeBoard[i][3] - 1)))[1] < 16){
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 1));
            onemove = append(onemove, int(typeBoard[i][3] - 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
           }
        }


        //If piece is a rook
        else if(i == 16 || i == 23){
          //Checks if it can move up;
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + j));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))){
                  j = 10;
                }
            } else{
                 j = 10;
                 onemove = nothing;
            }
          }

          //Checks if it can move down;
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + j));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))){
                  j = -10;
                }
            } else{
                 j = -10;
                 onemove = nothing;
            }
          }

          //Checks if it can move right;
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + j));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))){
                   j = 10;
                }
            } else{
                 j = 10;
                 onemove = nothing;
            }
          }

          //Checks if it can move left;
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + j));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))){
                   j = -10;
                }
            } else{
                 j = -10;
                 onemove = nothing;
            }
          }

        }

        //If piece is knight
        else if(i == 17|| i == 22){

          //If piece can move 1 up 2 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] + 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] + 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] + 1))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 2));
            onemove = append(onemove, int(typeBoard[i][3] + 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 1 up 2 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] + 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] + 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] + 1))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 2));
            onemove = append(onemove, int(typeBoard[i][3] + 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 1 up 2 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] - 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] - 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3] - 1))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 2));
            onemove = append(onemove, int(typeBoard[i][3] - 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }


          //If piece can move 1 down 2 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] - 1))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] - 1))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3] - 1))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 2));
            onemove = append(onemove, int(typeBoard[i][3] - 1));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 up 1 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 2))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 1));
            onemove = append(onemove, int(typeBoard[i][3] + 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 up 1 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 2))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 1));
            onemove = append(onemove, int(typeBoard[i][3] + 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 down 1 right
          if(
            exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 2))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] + 1));
            onemove = append(onemove, int(typeBoard[i][3] - 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

          //If piece can move 2 down 1 left
          if(
            exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 2))[0] == 0
            || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 2))[0] == 1)
               && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 2))[1] < 16))
            )
            {
            onemove = append(onemove, int(typeBoard[i][2]));
            onemove = append(onemove, int(typeBoard[i][3]));
            onemove = append(onemove, int(typeBoard[i][2] - 1));
            onemove = append(onemove, int(typeBoard[i][3] - 2));
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }

        }

        //If piece is bishop
        else if(i == 18 || i == 21){

          //If piece can move diagonally from top left to bottom right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))){
                j = 10;
              }

            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom right to top left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))){
                j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom left to top right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))){
                   j = 10;
              }
            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from top right to bottom left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))){
                   j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }

        }

        //If piece is queen
        else if(i == 19){
          //Checks if it can move up;
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + j));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))){
                  j = 10;
                }
            } else{
                 j = 10;
                 onemove = nothing;
            }
          }

          //Checks if it can move down;
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + j));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + j))[1] < 16))){
                  j = -10;
                }
            } else{
                 j = -10;
                 onemove = nothing;
            }
          }

          //Checks if it can move right;
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + j));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))){
                   j = 10;
                }
            } else{
                 j = 10;
                 onemove = nothing;
            }
          }

          //Checks if it can move left;
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + j));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
                if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + 0))[1] < 16))){
                   j = -10;
                }
            } else{
                 j = -10;
                 onemove = nothing;
            }
          }

          //If piece can move diagonally from top left to bottom right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))){
                j = 10;
              }

            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom right to top left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] - j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] - j))[1] < 16))){
                j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from bottom left to top right
          for(int j = 1; j<=8; j++){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))){
                   j = 10;
              }
            } else{
                j = 10;
                onemove = nothing;
            }
          }

          //If piece can move diagonally from top right to bottom left
          for(int j = -1; j>=-8; j--){
            if(
              exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + j));
              onemove = append(onemove, int(typeBoard[i][3] + j));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;

              if(((exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[0] == 1) && (exists(typeBoard,int(typeBoard[i][2] + j),int(typeBoard[i][3] + j))[1] < 16))){
                   j = -10;
              }
            } else{
                j = -10;
                onemove = nothing;
            }
          }

        }

        //If piece is King
        else if(i == 20){
          //Checks if it can move up;
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] + 1))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] + 1));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //Checks if it can move down;
            if(
              exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] - 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] - 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2]),int(typeBoard[i][3] - 1))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3] - 1));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //Checks if it can move right;
            if(
              exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 0))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] + 1));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //Checks if it can move left;
            if(
              exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 0))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 0))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 0))[1] < 16))
              )
              {
                onemove = append(onemove, int(typeBoard[i][2]));
                onemove = append(onemove, int(typeBoard[i][3]));
                onemove = append(onemove, int(typeBoard[i][2] - 1));
                onemove = append(onemove, int(typeBoard[i][3]));
                moves = (int[][])append(moves,onemove);
                onemove = nothing;
            }

          //If piece can move diagonally from top left to bottom right
            if(
              exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + 1));
              onemove = append(onemove, int(typeBoard[i][3] - 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can move diagonally from bottom right to top left
            if(
              exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] - 1));
              onemove = append(onemove, int(typeBoard[i][3] + 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can move diagonally from bottom left to top right
            if(
              exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + 1));
              onemove = append(onemove, int(typeBoard[i][3] + 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can move diagonally from top right to bottom left
            if(
              exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[0] == 0
              || ((exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[0] == 1)
                 && (exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[1] < 16))
              )
              {
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] - 1));
              onemove = append(onemove, int(typeBoard[i][3] - 1));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can castle kingside
            if(
               exists(typeBoard,int(typeBoard[i][2] + 1),int(typeBoard[i][3]))[0] == 0
            && exists(typeBoard,int(typeBoard[i][2] + 2),int(typeBoard[i][3]))[0] == 0
            && exists(typeBoard,int(typeBoard[i][2] + 3),int(typeBoard[i][3]))[1] == 23
              ){
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] + 2));
              onemove = append(onemove, int(typeBoard[i][3]));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

          //If piece can castle Queenside
            if(
               exists(typeBoard,int(typeBoard[i][2] - 1),int(typeBoard[i][3]))[0] == 0
            && exists(typeBoard,int(typeBoard[i][2] - 2),int(typeBoard[i][3]))[0] == 0
            && exists(typeBoard,int(typeBoard[i][2] - 3),int(typeBoard[i][3]))[0] == 0
            && exists(typeBoard,int(typeBoard[i][2] - 4),int(typeBoard[i][3]))[1] == 16
              ){
              onemove = append(onemove, int(typeBoard[i][2]));
              onemove = append(onemove, int(typeBoard[i][3]));
              onemove = append(onemove, int(typeBoard[i][2] - 2));
              onemove = append(onemove, int(typeBoard[i][3]));
              moves = (int[][])append(moves,onemove);
              onemove = nothing;
            }

        }
      }
    }
  }
  return moves;}

//Tests if the input move is legal based off of possibleMoves()
int realmoveLegal(int x1, int y1, int x2, int y2){
    int[] testMove = {x1,y1,x2,y2};
    int result = 0;
    for(int i = 0; i<possibleMoves(firstBoard).length; i++){
      if(testMove[0] == possibleMoves(firstBoard)[i][0] && testMove[1] == possibleMoves(firstBoard)[i][1] && testMove[2] == possibleMoves(firstBoard)[i][2] && testMove[3] == possibleMoves(firstBoard)[i][3]){
        result = 1;
      }
    }
    return result;
  }
