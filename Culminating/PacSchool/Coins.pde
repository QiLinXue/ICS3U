class Coins {

  int[][] location = new int[tiles.length][tiles.length];
  int coinsCollected = 0; //256 total

  Coins() {
      coinsCollected = 0;
      int tileLength = tiles.length;

      //Gives the coordinates of all the coins
      for (int i=0; i<tileLength; i++){
          for (int j=0; j<tileLength; j++) if (tiles[i][j] == 0) location[i][j] = 1;
      }
  }

  void reset(){
      coinsCollected = 0;
    int tileLength = tiles.length;
    for (int i=0; i<tileLength; i++) {
      for (int j=0; j<tileLength; j++) {
        if (tiles[i][j] == 0) location[i][j] = 1;
      }
    }
  }

  void step() {
    int tileLength = location.length;
    for (int i=0; i<tileLength; i++) {
      for (int j=0; j<tileLength; j++) {
          if(j == Player.pos[0] && i == Player.pos[1] && location[i][j] == 1){
              location[i][j] = 0;
              coinsCollected++;
          }
      }
    }
  }

  void show(float size) {
    ellipseMode(CENTER);
    fill(255, 255, 0);
    int tileLength = location.length;
    for (int i=0; i<tileLength; i++) {
      for (int j=0; j<tileLength; j++) {
        if (location[i][j] == 1) ellipse(size*j+size/2, size*i+size/2, size/2, size/2);
      }
    }
    fill(255);
    ellipseMode(CORNER);
  }

  //------------------------------------------------------------------------
  //Info

}
