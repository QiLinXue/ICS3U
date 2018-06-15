class User {
  int[] pos = {1, 2};
  int[] pastPos = {1, 1};
  int currentDirection = 0; //0-5-2-3  N-E-S-W correspondingly
  int proposedDirection = -5; //used to switch direction if user tries to switch direction just a bit before a turn;
  int slowness = 1;
  int deathCount = -1;

  //Initialize booleans to check if user can move in 4 directions
  boolean topSpaceEmpty = (tiles[pos[1]-1][pos[0]] == 0);
  boolean leftSpaceEmpty = (tiles[pos[1]][pos[0]-1] == 0);
  boolean rightSpaceEmpty = (tiles[pos[1]][pos[0]+1] == 0);
  boolean bottomSpaceEmpty = (tiles[pos[1]+1][pos[0]] == 0);

  User(int tempSlowness){
      slowness = tempSlowness;
  }

  //runs ALL THE TIME (not every frame) - It probably doesn't matter but I'm making it this way just in case it does matter
  void show(float size) {
      try{
          topSpaceEmpty = (tiles[pos[1]-1][pos[0]] == 0);
          leftSpaceEmpty = (tiles[pos[1]][pos[0]-1] == 0);
          rightSpaceEmpty = (tiles[pos[1]][pos[0]+1] == 0);
          bottomSpaceEmpty = (tiles[pos[1]+1][pos[0]] == 0);
          ellipse(size*pos[0],size*pos[1], size, size);
      }
      catch(ArrayIndexOutOfBoundsException e){ //Sometimes things go wrong but I have no idea why
          //println("something went wrong, but don't worry we fixed it");
          reset();
      }
  }

  //resets EVERYTHING
  void reset(){
      deathCount++;
      currentDirection = 0; //0-5-2-3  N-E-S-W correspondingly
      proposedDirection = -5;
      studentDead = false;

      //start position
      pos[0] = 1;
      pos[1] = 1;
  }

  //Is it at an intersection where it can go forward and left/right?
  boolean atOpenIntersection(){
      if(currentDirection == 0) return topSpaceEmpty && (leftSpaceEmpty || rightSpaceEmpty);
      else if(currentDirection == 1) return rightSpaceEmpty && (topSpaceEmpty || bottomSpaceEmpty);
      else if(currentDirection == 2) return bottomSpaceEmpty && (leftSpaceEmpty || rightSpaceEmpty);
      else return leftSpaceEmpty && (topSpaceEmpty || bottomSpaceEmpty);
  }

  //Is it not at an intersection?
  boolean atStraightEdge(){
      if(currentDirection == 0) return topSpaceEmpty && !rightSpaceEmpty && !leftSpaceEmpty;
      else if(currentDirection == 1) return rightSpaceEmpty && !topSpaceEmpty && !bottomSpaceEmpty;
      else if(currentDirection == 2) return bottomSpaceEmpty && !rightSpaceEmpty && !leftSpaceEmpty;
      else return leftSpaceEmpty && !topSpaceEmpty && !bottomSpaceEmpty;
  }

  //Is it at an intersection where you can only move to the side
  boolean atClosedIntersection(){
      return (!atStraightEdge() && !atOpenIntersection());
  }

  void changeDirections(){
    //if(keyCode == ENTER) println(currentDirection);

    if(atStraightEdge()){

        //Proposes a direction to move in.
        //This will not be applied unless it passes other conditions
        if(keyCode == UP) proposedDirection=0;
        else if(keyCode == RIGHT) proposedDirection=1;
        else if(keyCode == DOWN) proposedDirection=2;
        else if(keyCode == LEFT) proposedDirection=3;

        //If the proposed direction just set is not the opposite direction
        if(abs(proposedDirection-currentDirection) != 2){
            if(keyCode == UP) proposedDirection=0;
            else if(keyCode == RIGHT) proposedDirection=1;
            else if(keyCode == DOWN) proposedDirection=2;
            else if(keyCode == LEFT) proposedDirection=3;
        }

        //If the proposed direction is the opposite direction
        else{
            proposedDirection = -5;
            if(keyCode == UP) currentDirection=0;
            else if(keyCode == RIGHT) currentDirection=1;
            else if(keyCode == DOWN) currentDirection=2;
            else if(keyCode == LEFT) currentDirection=3;
        }
    }

    if(atOpenIntersection()){
        //Changes direction if space is open
        if(keyCode == LEFT && leftSpaceEmpty) currentDirection=3;
        else if(keyCode == RIGHT && rightSpaceEmpty) currentDirection=1;
        else if(keyCode == DOWN && bottomSpaceEmpty) currentDirection=2;
        else if(keyCode == UP && topSpaceEmpty) currentDirection=0;

        //resets the proposed direction
        proposedDirection = -5;
    }

    if(atClosedIntersection()){
        //Changes direction if space is open
        if(keyCode == LEFT && leftSpaceEmpty) currentDirection=3;
        else if(keyCode == RIGHT && rightSpaceEmpty) currentDirection=1;
        else if(keyCode == DOWN && bottomSpaceEmpty) currentDirection=2;
        else if(keyCode == UP && topSpaceEmpty) currentDirection=0;
    }

  }

  void step(){
      if(frameCount % slowness ==0){
          //Keeps a record of the past coordinate
          pastPos[0] = pos[0];
          pastPos[1] = pos[1];

          //If user is at an intersection
          if(atOpenIntersection() || atClosedIntersection()){
              //-----------------------------------------------------------------
              //This first section checks for if there is a proposed direction set already, then changes directions

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

              //If the user didn't propose a direction already, then it goes in the current direction
              else if(currentDirection == 0 && topSpaceEmpty) pos[1]--;
              else if(currentDirection == 1 && rightSpaceEmpty) pos[0]++;
              else if(currentDirection == 2 && bottomSpaceEmpty) pos[1]++;
              else if(currentDirection == 3 && leftSpaceEmpty) pos[0]--;
          }

          //Go in current Direction
         else if(atStraightEdge()){
             if(currentDirection == 0 && topSpaceEmpty) pos[1]--;
             else if(currentDirection == 1 && rightSpaceEmpty) pos[0]++;
             else if(currentDirection == 2 && bottomSpaceEmpty) pos[1]++;
             else if(currentDirection == 3 && leftSpaceEmpty) pos[0]--;
         }

         //Go in current direction
         else if(atClosedIntersection()){
             proposedDirection = -5; //resets proposed direction
             if(currentDirection == 0 && topSpaceEmpty) pos[1]--;
             else if(currentDirection == 1 && rightSpaceEmpty) pos[0]++;
             else if(currentDirection == 2 && bottomSpaceEmpty) pos[1]++;
             else if(currentDirection == 3 && leftSpaceEmpty) pos[0]--;
         }
      }
  }

}