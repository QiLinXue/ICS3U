class User {
  int[] pos = {1, 2};
  int[] pastPos = {1, 1};
  int currentDirection = 2; //0-5-2-3  N-E-S-W correspondingly
  int proposedDirection = 1; //used to switch direction if user tries to switch direction just a bit before a turn;
  boolean topSpaceEmpty = (tiles[pos[1]-1][pos[0]] == 0);
  boolean leftSpaceEmpty = (tiles[pos[1]][pos[0]-1] == 0);
  boolean rightSpaceEmpty = (tiles[pos[1]][pos[0]+1] == 0);
  boolean bottomSpaceEmpty = (tiles[pos[1]+1][pos[0]] == 0);

  void show(float size) {
      topSpaceEmpty = (tiles[pos[1]-1][pos[0]] == 0);
      leftSpaceEmpty = (tiles[pos[1]][pos[0]-1] == 0);
      rightSpaceEmpty = (tiles[pos[1]][pos[0]+1] == 0);
      bottomSpaceEmpty = (tiles[pos[1]+1][pos[0]] == 0);
      ellipse(size*pos[0],size*pos[1], size, size);
  }
  
  void reset(){
        int currentDirection = 2; //0-5-2-3  N-E-S-W correspondingly

      studentDead = false;
      pos[0] = 1;
      pos[1] = 1;
  }

  boolean atOpenIntersection(){
      if(currentDirection == 0) return topSpaceEmpty && (leftSpaceEmpty || rightSpaceEmpty);
      else if(currentDirection == 1) return rightSpaceEmpty && (topSpaceEmpty || bottomSpaceEmpty);
      else if(currentDirection == 2) return bottomSpaceEmpty && (leftSpaceEmpty || rightSpaceEmpty);
      else return leftSpaceEmpty && (topSpaceEmpty || bottomSpaceEmpty);
  }

  boolean atStraightEdge(){
      if(currentDirection == 0) return topSpaceEmpty && !rightSpaceEmpty && !leftSpaceEmpty;
      else if(currentDirection == 1) return rightSpaceEmpty && !topSpaceEmpty && !bottomSpaceEmpty;
      else if(currentDirection == 2) return bottomSpaceEmpty && !rightSpaceEmpty && !leftSpaceEmpty;
      else return leftSpaceEmpty && !topSpaceEmpty && !bottomSpaceEmpty;
  }

  boolean atClosedIntersection(){
      return (!atStraightEdge() && !atOpenIntersection());
  }

  void changeDirections(){
    //if(keyCode == ENTER) println(currentDirection);

    if(atStraightEdge()){
        if(keyCode == UP) proposedDirection=0;
        else if(keyCode == RIGHT) proposedDirection=1;
        else if(keyCode == DOWN) proposedDirection=2;
        else if(keyCode == LEFT) proposedDirection=3;

        if(abs(proposedDirection-currentDirection) != 2){
            if(keyCode == UP) proposedDirection=0;
            else if(keyCode == RIGHT) proposedDirection=1;
            else if(keyCode == DOWN) proposedDirection=2;
            else if(keyCode == LEFT) proposedDirection=3;
        }
        else{
            proposedDirection = -5;
            if(keyCode == UP) currentDirection=0;
            else if(keyCode == RIGHT) currentDirection=1;
            else if(keyCode == DOWN) currentDirection=2;
            else if(keyCode == LEFT) currentDirection=3;
        }
    }

    if(atOpenIntersection()){
        if(keyCode == LEFT && leftSpaceEmpty) currentDirection=3;
        else if(keyCode == RIGHT && rightSpaceEmpty) currentDirection=1;
        else if(keyCode == DOWN && bottomSpaceEmpty) currentDirection=2;
        else if(keyCode == UP && topSpaceEmpty) currentDirection=0;
        proposedDirection = -5;
        //if(keyCode == UP && topSpaceEmpty) println(currentDirection);
    }
    
    if(atClosedIntersection()){
        if(keyCode == LEFT && leftSpaceEmpty) currentDirection=3;
        else if(keyCode == RIGHT && rightSpaceEmpty) currentDirection=1;
        else if(keyCode == DOWN && bottomSpaceEmpty) currentDirection=2;
        else if(keyCode == UP && topSpaceEmpty) currentDirection=0;
    }

  }

  void step(){
      //println(tiles[pos[1]][pos[0]+1]);
      pastPos[0] = pos[0];
      pastPos[1] = pos[1];
      if(atOpenIntersection() || atClosedIntersection()
        // && abs(proposedDirection-currentDirection) != 2
        // && proposedDirection != -5
         ){

          if(proposedDirection == 0 && topSpaceEmpty){
              pos[1]--;
              currentDirection = proposedDirection;
              proposedDirection = -5;
          }
          else if(proposedDirection == 1 && rightSpaceEmpty){
              pos[0]++;
              currentDirection = proposedDirection;
              proposedDirection = -5;
          }
          else if(proposedDirection == 2 && bottomSpaceEmpty){
              pos[1]++;
              currentDirection = proposedDirection;
              proposedDirection = -5;
          }
          else if(proposedDirection == 3 && leftSpaceEmpty){
              pos[0]--;
              currentDirection = proposedDirection;
              proposedDirection = -5;
          }

          else if(currentDirection == 0 && topSpaceEmpty) pos[1]--;
          else if(currentDirection == 1 && rightSpaceEmpty) pos[0]++;
          else if(currentDirection == 2 && bottomSpaceEmpty) pos[1]++;
          else if(currentDirection == 3 && leftSpaceEmpty) pos[0]--;
      }

     else if(atStraightEdge()){
         if(currentDirection == 0 && topSpaceEmpty) pos[1]--;
         else if(currentDirection == 1 && rightSpaceEmpty) pos[0]++;
         else if(currentDirection == 2 && bottomSpaceEmpty) pos[1]++;
         else if(currentDirection == 3 && leftSpaceEmpty) pos[0]--;
     }

     else if(atClosedIntersection()){
         proposedDirection = -5;
         if(currentDirection == 0 && topSpaceEmpty) pos[1]--;
         else if(currentDirection == 1 && rightSpaceEmpty) pos[0]++;
         else if(currentDirection == 2 && bottomSpaceEmpty) pos[1]++;
         else if(currentDirection == 3 && leftSpaceEmpty) pos[0]--;
     }

    // else if(atStraightEdge)

  }

}
