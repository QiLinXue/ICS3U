class Teacher{
    int[] pos = {0,0};
    int[] pastPos = {0,0};
    boolean topSpaceEmpty, leftSpaceEmpty, bottomSpaceEmpty, rightSpaceEmpty;
    int currentDirection = 0;
    Teacher(){
        int startPosX = 1;
        int startPosY = 1;
        boolean foundAnOpenSpace = false;
        while(!foundAnOpenSpace){
            startPosX = floor(random(0,28));
            startPosY = floor(random(0,28));
            if(tiles[startPosY][startPosX] == 0) foundAnOpenSpace = true;
        }

        pos[0] = startPosX;
        pos[1] = startPosY;
    }

    void show(float size){
        fill(0,255,255);
        topSpaceEmpty = (tiles[pos[1]-1][pos[0]] == 0);
        leftSpaceEmpty = (tiles[pos[1]][pos[0]-1] == 0);
        rightSpaceEmpty = (tiles[pos[1]][pos[0]+1] == 0);
        bottomSpaceEmpty = (tiles[pos[1]+1][pos[0]] == 0);
        ellipse(size*pos[0],size*pos[1], size, size);
        fill(255);
        
        isStudentDead();
    }
    
    void step(){
        pastPos[0] = pos[0];
        pastPos[1] = pos[1];
        
        boolean teacherCanMoveInThisDirection = false;
        int randomDirection = 0;
        while(!teacherCanMoveInThisDirection){
          randomDirection = floor(random(0,4));
          if(abs(currentDirection-randomDirection) != 2){
              if(randomDirection == 0 && topSpaceEmpty) teacherCanMoveInThisDirection = true;
              if(randomDirection == 1 && rightSpaceEmpty) teacherCanMoveInThisDirection = true;
              if(randomDirection == 2 && bottomSpaceEmpty) teacherCanMoveInThisDirection = true;
              if(randomDirection == 3 && leftSpaceEmpty) teacherCanMoveInThisDirection = true;
          }
        }
         if(randomDirection == 0) currentDirection = randomDirection;
         else if(randomDirection == 1) currentDirection = randomDirection;
         else if(randomDirection == 2) currentDirection = randomDirection;
         else if(randomDirection == 3) currentDirection = randomDirection;
         
         if(randomDirection == 0) pos[1]--;
         else if(randomDirection == 1) pos[0]++;
         else if(randomDirection == 2) pos[1]++;
         else if(randomDirection == 3) pos[0]--;
    }
    
    boolean isStudentDead(){
      if(pos[0] == Player.pos[0] && pos[1] == Player.pos[1]) studentDead = true;
      else if((pastPos[0] == Player.pos[0] && pastPos[1] == Player.pos[1]) && (pos[0] == Player.pastPos[0] && pos[1] == Player.pastPos[1])) studentDead = true;
      return pos[0] == Player.pos[0] && pos[1] == Player.pos[1];
    }
}
