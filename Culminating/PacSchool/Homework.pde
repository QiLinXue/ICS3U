class Coins {

  int[][] location = new int[tiles.length][tiles.length];

  Coins() {
    int tileLength = tiles.length;
    for (int i=0; i<tileLength; i++) {
      for (int j=0; j<tileLength; j++) {
        if (tiles[i][j] == 0) location[i][j] = 1;
      }
    }
  }

  void reset(){
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
          if(j == Player.pos[0] && i == Player.pos[1]) location[i][j] = 0;
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
}
