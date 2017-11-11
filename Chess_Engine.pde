//{alive=1/dead=0 , white=1/black=-1 , xLocation, yLocation, pieceValue}
float[][] allPieces = {

  //White Pieces
  {1,1,1,2,1},{1,1,2,2,1},{1,1,3,2,1},{1,1,4,2,1},{1,1,5,2,1},{1,1,6,2,1},{1,1,7,2,1},{1,1,8,2,1},
  {1,1,1,1,5},{1,1,2,1,3},{1,1,3,1,3},{1,1,4,1,9},{1,1,5,1,0},{1,1,6,1,3},{1,1,7,1,3},{1,1,8,1,5},

  //Black Pieces
  {1,-1,1,8,5},{1,-1,2,8,3},{1,-1,3,8,3},{1,-1,4,8,9},{1,-1,5,8,0},{1,-1,6,8,3},{1,-1,7,8,3},{1,-1,8,8,5},
  {1,-1,1,7,1},{1,-1,2,7,1},{1,-1,3,7,1},{1,-1,4,7,1},{1,-1,5,7,1},{1,-1,6,7,1},{1,-1,7,7,1},{1,-1,8,7,1},

};

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
float evaluate(){
  float evaluation = 0;
  if(isCheckmate()){
    evaluation = 9999;
  }
  else{
    for(int i=0; i<32; i++){
      if(allPieces[i][0] == 1){
        evaluation = evaluation + allPieces[i][1]*allPieces[1][4];
      }
    }
  }

  return evaluation;}

//Checks if King is checkmates
boolean isCheckmate(){
  return false;}

//For the input piece number, it will plot the piece on the graph
void place(int pieceNumber){
  if(allPieces[pieceNumber][0] == 1){
    if(pieceNumber <= 7 || pieceNumber >= 24){
      pieceName = "P";
    } else if(pieceNumber == 8 || pieceNumber == 15 || pieceNumber == 16 || pieceNumber == 23){
      pieceName = "R";
    } else if(pieceNumber == 9 || pieceNumber == 14 || pieceNumber == 17 || pieceNumber == 22){
      pieceName = "N";
    } else if(pieceNumber == 10 || pieceNumber == 13 || pieceNumber == 18 || pieceNumber == 21){
      pieceName = "B";
    } else if(pieceNumber == 11 || pieceNumber == 19){
      pieceName = "Q";
    } else if(pieceNumber == 12 || pieceNumber == 20){
      pieceName = "K";
    }

    ellipseMode(CORNER);

    if((allPieces[pieceNumber][1]) == 1){
      fill(255);
      ellipse(width/8*(allPieces[pieceNumber][2]-1),height-(allPieces[pieceNumber][3]*height/8),width/8,height/8);
      fill(50);
    } else{
      fill(50);
      ellipse(width/8*(allPieces[pieceNumber][2]-1),height-(allPieces[pieceNumber][3]*height/8),width/8,height/8);
      fill(255);
    }
    textSize(height/9);
    text(pieceName,width/8*(allPieces[pieceNumber][2]-1)+height/36,height-(allPieces[pieceNumber][3]*height/8)+height/8-height/36);
    fill(255);
  }}

//Actual Moving Around
void mousePressed(){
  if(turnNumber == 1){ //White to Move
    if(currentStance == 0 && exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[0] == 1 && exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[1] < 16){
      startxco = (floor(mouseX/(width/8))+1);
      startyco = 8 - (floor(mouseY/(height/8)));
      selectedPieceNumber = exists(startxco,startyco)[1];
      currentStance = 1;
    }
    if(moveLegal() == 1 && currentStance == 1 && (exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[0] == 0 || (exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[0] == 1 && exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[1] >= 16))){
        endxco = (floor(mouseX/(width/8))+1);
        endyco = 8 - (floor(mouseY/(height/8)));
        if(exists(endxco,endyco)[1] >= 16 && exists(endxco,endyco)[0] == 1){
          allPieces[exists(endxco,endyco)[1]][0] = 0;
        }
        allPieces[selectedPieceNumber][2] = endxco;
        allPieces[selectedPieceNumber][3] = endyco;
        currentStance = 0;
        turnNumber = 2;
    }
  } else if(turnNumber == 2){ //Black to move
    if(currentStance == 0 && exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[0] == 1 && exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[1] >= 16){
      startxco = (floor(mouseX/(width/8))+1);
      startyco = 8 - (floor(mouseY/(height/8)));
      selectedPieceNumber = exists(startxco,startyco)[1];
      currentStance = 1;
    }
    if(moveLegal() == 1 && currentStance == 1 && (exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[0] == 0 || (exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[0] == 1 && exists((floor(mouseX/(width/8))+1),8 - (floor(mouseY/(height/8))))[1] < 16))){
        endxco = (floor(mouseX/(width/8))+1);
        endyco = 8 - (floor(mouseY/(height/8)));
        if(exists(endxco,endyco)[1] < 16 && exists(endxco,endyco)[0] == 1 ){
          allPieces[exists(endxco,endyco)[1]][0] = 0;
          //println(exists(endxco,endyco));
        }
        allPieces[selectedPieceNumber][2] = endxco;
        allPieces[selectedPieceNumber][3] = endyco;
        currentStance = 0;
        turnNumber = 1;
    }

  }}

//For the input coordinate, it will output whether that piece is occupied, and if so, what piece number it has (0-31)
int[] exists(int x, int y){
  pieceSelected[0] = 0;
  pieceSelected[1] = 0;
  if(x < 0 || x > 8 || y < 0 || y > 8){
    pieceSelected[0] = -1;
  } else{
    for(int i = 0; i<32; i++){
      if(allPieces[i][2] == x && allPieces[i][3] == y && allPieces[i][0] == 1){
        pieceSelected[0] = 1;
        pieceSelected[1] = i;
      }
    }
  }

  return pieceSelected;}

//Checks if a move is legal based off of the start coordinate and the end Coordinate
int moveLegal(){
  return 1;}

//Executes a move given its 2 coordinates
void execute(int startx, int starty, int endx, int endy){
  if(turnNumber == 1){ //White to move
    selectedPieceNumber = exists(startx,starty)[1];
    if(moveLegal() == 1 && exists(startx,starty)[0] == 1 && ((exists(endx,endy)[0] == 0) || (exists(endx,endy)[0] == 1 && (exists(endx,endy)[1] >= 16))) && exists(startx,starty)[1] < 16){
      allPieces[selectedPieceNumber][2] = endx;
      allPieces[selectedPieceNumber][3] = endy;
      turnNumber = 2;
    }
  } else if(turnNumber == 2){ //Black to move
      selectedPieceNumber = exists(startx,starty)[1];
      if(moveLegal() == 1 && exists(startx,starty)[0] == 1 && ((exists(endx,endy)[0] == 0) || (exists(endx,endy)[0] == 1 && (exists(endx,endy)[1] < 16))) && exists(startx,starty)[1] >= 16){
        allPieces[selectedPieceNumber][2] = endx;
        allPieces[selectedPieceNumber][3] = endy;
        turnNumber = 1;
      }
    }}

//Uses the current coordinates from allPieces to generate a 2d array with all the neccessary coordinates to be executed
int[][] possibleMoves(){
  int[] nothing = {0,0,0,0};
  int[][] moves = {};
  for(int i=0;i<16;i++){ //All possible pieces for white
    int[] onemove = {0,0,0,0};
    if(allPieces[i][0] == 1){

      //If piece is a pawn
      if(i < 8){

        //Check if it can move up by 1
        if(exists(int(allPieces[i][2]),int((allPieces[i][3] + 1)))[0] == 0){
          onemove[0] = int(allPieces[i][2]);
          onemove[1] = int(allPieces[i][3]);
          onemove[2] = int(allPieces[i][2]);
          onemove[3] = int(allPieces[i][3] + 1);
          moves = (int[][])append(moves,onemove);
          onemove = nothing;
        }

        //Check if it can move up by 2
       if(allPieces[i][3] == 2 && exists(int(allPieces[i][2]),int((allPieces[i][3] + 1)))[0] == 0 && exists(int(allPieces[i][2]),int((allPieces[i][3] + 2)))[0] == 0){
          onemove[0] = int(allPieces[i][2]);
          onemove[1] = int(allPieces[i][3]);
          onemove[2] = int(allPieces[i][2]);
          onemove[3] = int(allPieces[i][3] + 2);
          moves = (int[][])append(moves,onemove);
          onemove = nothing;
        }

        //Check if it can capture to the right
        if(exists(int(allPieces[i][2] + 1),int((allPieces[i][3] + 1)))[0] == 1 && exists(int(allPieces[i][2] + 1),int((allPieces[i][3] + 1)))[1] >= 16){
           onemove[0] = int(allPieces[i][2]);
           onemove[1] = int(allPieces[i][3]);
           onemove[2] = int(allPieces[i][2] + 1);
           onemove[3] = int(allPieces[i][3] + 1);
           moves = (int[][])append(moves,onemove);
           onemove = nothing;
         }

         //Check if it can capture to the right
         if(exists(int(allPieces[i][2] - 1),int((allPieces[i][3] + 1)))[0] == 1 && exists(int(allPieces[i][2] - 1),int((allPieces[i][3] + 1)))[1] >= 16){
            onemove[0] = int(allPieces[i][2]);
            onemove[1] = int(allPieces[i][3]);
            onemove[2] = int(allPieces[i][2] - 1);
            onemove[3] = int(allPieces[i][3] + 1);
            moves = (int[][])append(moves,onemove);
            onemove = nothing;
          }
      }
    }
  }
  return moves;};
