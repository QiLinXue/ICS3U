//{alive=1/dead=0 , white=1/black=-1 , xLocation, yLocation, pieceValue}
float[][] allPieces = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,4,1,9},{1,1,5,1,9000},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,9000},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},

};



/*float[][] allPieces = {

  //White Pieces
  {0,1,1,2,1},{0,1,2,2,1},{0,1,3,2,1},{0,1,4,2,1},{0,1,5,2,1},{0,1,6,2,1},{0,1,7,2,1},{0,1,8,2,1},
  {0,1,1,1,5},{0,1,2,1,3},{1,1,4,4,3},{0,1,4,1,9},{0,1,5,1,0},{0,1,6,1,3},{0,1,7,1,3},{0,1,8,1,5},

  //Black Pieces
  {0,-1,1,8,5},{0,-1,2,8,3},{0,-1,3,8,3},{0,-1,4,8,9},{0,-1,5,8,0},{0,-1,6,8,3},{0,-1,7,8,3},{0,-1,8,8,5},
  {0,-1,1,7,1},{0,-1,2,7,1},{0,-1,3,7,1},{0,-1,4,7,1},{0,-1,5,7,1},{0,-1,6,7,1},{0,-1,7,7,1},{0,-1,8,7,1},

};*/



int[] pieceSelected = {0,0}; //Placeholder numbers
int startxco, startyco, endxco, endyco; //Coordinates of the start and finish when moving a piece
int selectedPieceNumber; //The number coresponding to each piece (0-31)
int turnNumber = 1; //1=white; 2=black;
int currentStance = 0; //0=Select Piece; 1=move piece;
String pieceName; //stores the piece name (P,R,N,B,Q,K)


void setup(){}

void settings(){
  size(1200,1200);}


void draw(){

  //Creates the 8x8 gridlines
  for(int i=0;i<width;i+=width/8){
    for(int j=0;j<height;j+=height/8){
      rect(i,j,width/8,height/8);
    }
  }

  //Places all the pieces onto the board
  for(int i=0;i<32;i++){
    place(i);
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
        evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*typeBoard[i][4];
        if((i < 8 || i > 23) && (typeBoard[i][2] == 4 || typeBoard[i][2] == 5) && (typeBoard[i][3] == 4 || typeBoard[i][3] == 5)){
          evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*0.25;
        }
        //        9/14/17/22

        if((i == 9 || i == 14 || i == 17 || i == 22) && (typeBoard[i][2] == 1 || typeBoard[i][2] == 8)){
          evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(-0.1);
        }

        if(
          i < 8
         && ((
            exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3]) - 1)[0] == 1
            && exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3] - 1))[1] < 8)
         || (exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[0] == 1
            && exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] - 1))[1] < 8))){
            evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.05);

         }

         if(
           i > 23
           && ((
              exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3]) + 1)[0] == 1
              && exists(typeBoard, int(typeBoard[i][2] + 1),int(typeBoard[i][3] + 1))[1] > 23)
           || (exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[0] == 1
              && exists(typeBoard, int(typeBoard[i][2] - 1),int(typeBoard[i][3] + 1))[1] > 23))){
              evaluation = evaluation + typeBoard[i][0]*typeBoard[i][1]*(0.05);

           }


    }


  }

  return evaluation;}

//Checks if King is checkmates
boolean isCheckmate(){
  return false;}

//For the input piece number, it will plot the piece on the graph
void place(int pieceNum){
  if(allPieces[pieceNum][0] == 1){
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

    if((allPieces[pieceNum][1]) == 1){
      fill(255);
      ellipse(width/8*(allPieces[pieceNum][2]-1),height-(allPieces[pieceNum][3]*height/8),width/8,height/8);
      fill(50);
    } else{
      fill(50);
      ellipse(width/8*(allPieces[pieceNum][2]-1),height-(allPieces[pieceNum][3]*height/8),width/8,height/8);
      fill(255);
    }
    textSize(height/9);
    text(pieceName,width/8*(allPieces[pieceNum][2]-1)+height/36,height-(allPieces[pieceNum][3]*height/8)+height/8-height/36);
    fill(255);
  }}

//Actual Moving Around

int[] square(){
  int[] currentsquare = {(floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8)))};
  return currentsquare; //Returns the x and y coordinates (relative to the board) of the current mouse value
}

void mousePressed(){
  if(mouseButton == RIGHT && currentStance == 1){
    currentStance = 0;
  }
  else{
  if(turnNumber == 1){ //White to Move
    if(currentStance == 0 && exists(allPieces,square()[0],square()[1])[0] == 1 && exists(allPieces,square()[0],square()[1])[1] < 16){
      startxco = square()[0];
      startyco = square()[1];
      selectedPieceNumber = exists(allPieces,startxco,startyco)[1];
      currentStance = 1;
    }



    if(realmoveLegal(startxco,startyco,square()[0],square()[1]) == 1 && currentStance == 1 && (exists(allPieces,square()[0],square()[1])[0] == 0 || (exists(allPieces,square()[0],square()[1])[0] == 1 && exists(allPieces,square()[0],square()[1])[1] >= 16))){
        endxco = square()[0];
        endyco = square()[1];
        if(exists(allPieces,endxco,endyco)[1] >= 16 && exists(allPieces,endxco,endyco)[0] == 1){
          allPieces[exists(allPieces,endxco,endyco)[1]][0] = 0;
        }
        allPieces[selectedPieceNumber][2] = endxco;
        allPieces[selectedPieceNumber][3] = endyco;
        currentStance = 0;
        turnNumber = 2;
    }
  } else if(turnNumber == 2){ //Black to move
    if(currentStance == 0 && exists(allPieces,square()[0],square()[1])[0] == 1 && exists(allPieces,square()[0],square()[1])[1] >= 16){
      startxco = square()[0];
      startyco = square()[1];
      selectedPieceNumber = exists(allPieces,startxco,startyco)[1];
      currentStance = 1;
    }
    if(realmoveLegal(startxco,startyco,square()[0],square()[1]) == 1 && currentStance == 1 && (exists(allPieces,square()[0],square()[1])[0] == 0 || (exists(allPieces,square()[0],square()[1])[0] == 1 && exists(allPieces,square()[0],square()[1])[1] < 16))){
        endxco = square()[0];
        endyco = square()[1];
        if(exists(allPieces,endxco,endyco)[1] < 16 && exists(allPieces,endxco,endyco)[0] == 1 ){
          allPieces[exists(allPieces,endxco,endyco)[1]][0] = 0;
        }
        allPieces[selectedPieceNumber][2] = endxco;
        allPieces[selectedPieceNumber][3] = endyco;
        currentStance = 0;
        turnNumber = 1;
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
      if(allPieces[i][2] == x && typeBoard[i][3] == y && typeBoard[i][0] == 1){
        pieceSelected[0] = 1;
        pieceSelected[1] = i;
      }
    }
  }

  return pieceSelected;}

//Checks if a move is legal based off of the start coordinate and the end Coordinate
int moveLegal(){
  return 1;}

float[][] theoryPieces = {

  //White Pieces
  {1,1,5,5,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,4,1,9},{1,1,5,1,0},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,0},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},

};


void copyPieces(){
  float[] buffer1d = {};

  for(int i = 0; i<allPieces.length; i++){
    for(int j = 0; j<allPieces[i].length; j++){
      buffer1d = append(buffer1d, allPieces[i][j]);
    }
  }

  int h = 0;
  for(int i = 0;i<32;i++){
    for(int j = 0; j<allPieces[i].length;j++){
      theoryPieces[i][j] = buffer1d[h];
      h++;
    }
  }
}

void keyPressed(){

  float highestEvalScore = -9000;
  int[] highestEvalMove = {8,8,1,3};
  if(turnNumber == 1){ //White to move
    copyPieces();
    int looplength = possibleMoves(theoryPieces).length;
    for(int i = 0; i< looplength; i++){
        copyPieces();
        int[] theMove = possibleMoves(theoryPieces)[i];

        execute(theMove,theoryPieces);

        if(evaluate(theoryPieces) > highestEvalScore){
          highestEvalScore = evaluate(theoryPieces);
          highestEvalMove = theMove;
        }
        else if((evaluate(theoryPieces) == highestEvalScore) && random(0,3) > 2){
          highestEvalScore = evaluate(theoryPieces);
          highestEvalMove = theMove;
        }
    }
    execute(highestEvalMove,allPieces);
    copyPieces();
  }
  if(turnNumber == 2){
    int movetobeexeuted = floor(random(0,possibleMoves(allPieces).length));
    execute(possibleMoves(allPieces)[movetobeexeuted],allPieces);
  }
  if(turnNumber == 1){
    turnNumber = 2;
  }
  else if(turnNumber == 2){
    turnNumber = 1;
  }
  println(evaluate(allPieces));

}


//Executes a move given its 2 coordinates
void execute(int[] autoMove, float[][] typeBoard){
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
      }
    }
  } else if(turnNumber == 2){ //Black to move
      selectedPieceNumber = exists(typeBoard,startx,starty)[1];
      if(exists(typeBoard,startx,starty)[0] == 1 && ((exists(typeBoard,endx,endy)[0] == 0) || (exists(typeBoard,endx,endy)[0] == 1 && (exists(typeBoard,endx,endy)[1] < 16))) && exists(typeBoard,startx,starty)[1] >= 16){

        placeholderx = endx;
        placeholdery = endy;
        //turnNumber = 1;
        if(exists(typeBoard,endx,endy)[1] < 16 && exists(typeBoard,endx,endy)[1] > 0){
          typeBoard[exists(typeBoard,endx,endy)[1]][0] = 0;
        }
      }
    }
    typeBoard[selectedPieceNumber][2] = placeholderx;
    typeBoard[selectedPieceNumber][3] = placeholdery;

  }

//Uses the current coordinates from allPieces to generate a 2d array with all the neccessary coordinates to be executed
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

        }
      }
    }
  }
  return moves;}
int realmoveLegal(int x1, int y1, int x2, int y2){
    int[] testMove = {x1,y1,x2,y2};
    int result = 0;
    for(int i = 0; i<possibleMoves(allPieces).length; i++){
      if(testMove[0] == possibleMoves(allPieces)[i][0] && testMove[1] == possibleMoves(allPieces)[i][1] && testMove[2] == possibleMoves(allPieces)[i][2] && testMove[3] == possibleMoves(allPieces)[i][3]){
        result = 1;
      }
    }
    return result;
  }
