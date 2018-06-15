class Teacher{

    //-------------------------------------------------------------------------------------------------

    int[] pos = {0,0}; //Current Position
    int[] pastPos = {0,0}; //Previous Position
    boolean topSpaceEmpty, leftSpaceEmpty, bottomSpaceEmpty, rightSpaceEmpty; //Test if adjacent squares are empty
    int currentDirection = 0; //The current direction its going
    int slowness = 1; //Speed

    PImage image; //Image
    String imageName;
    //-------------------------------------------------------------------------------------------------

    int mode = 1; //0 = dumb, 1=direct follow

    //-------------------------------------------------------------------------------------------------


    Teacher(int tempSlowness, String tempImageName){

        slowness = tempSlowness; //Sets Slowness

        //------------------------------------------------------------------
        //Code to spawn the teacher in empty space
        int startPosX = 1;
        int startPosY = 1;
        boolean foundAnOpenSpace = false;
        while(!foundAnOpenSpace){
            startPosX = floor(random(0,28));
            startPosY = floor(random(0,28));
            if(tiles[startPosY][startPosX] == 0) foundAnOpenSpace = true;
        }

        //------------------------------------------------------------------

        pos[0] = startPosX;
        pos[1] = startPosY;

        //------------------------------------------------------------------

        image = loadImage(tempImageName);
        imageName = tempImageName;
    }

    //-------------------------------------------------------------------------------------------------

    //Constantly Shows
    void show(float size){

        //TODO there's a problem with this where sometimes the name box extends too far. Dunno how to fix

        //Nametag box
        fill(255,0,0);
        rectMode(CENTER);
        rect(size*pos[0]+size/2,size*pos[1]-size/2,textWidth(imageName.substring(0, imageName.length() - 4)),size/2);
        rectMode(CORNER);

        //Nametag text
        textSize(size/2);
        textAlign(CENTER,CENTER);
        fill(0,0,255);
        text(imageName.substring(0, imageName.length() - 4),size*pos[0]+size/2,size*pos[1]-size/2);

        //Special Treatment
        if(imageName == "Seidel.png"){
            imageMode(CENTER);
            image(image,size*pos[0]+size/2,size*pos[1]+size/2,size*1.5,size*1.5); //LARGE
            imageMode(CORNER);
        }

        //Image
        image(image,size*pos[0],size*pos[1],size,size);
        isStudentDead(); //doesn't uses return value, but updates the studentDead global variable
    }

    //-------------------------------------------------------------------------------------------------
    //Only activates step by step
    void step(){
        if(frameCount % slowness == 0){
            //Updates
            topSpaceEmpty = (tiles[pos[1]-1][pos[0]] == 0);
            leftSpaceEmpty = (tiles[pos[1]][pos[0]-1] == 0);
            rightSpaceEmpty = (tiles[pos[1]][pos[0]+1] == 0);
            bottomSpaceEmpty = (tiles[pos[1]+1][pos[0]] == 0);

            //Saves Past Variables
            pastPos[0] = pos[0];
            pastPos[1] = pos[1];

            //Different methods of choosing paths
            if(mode == 0) randomPathSearch();
            if(mode == 1 && Player.pos[0] == 1 && Player.pos[1] == 1) randomPathSearch(); //If student at origin
            else if(mode == 1) directPathSearch();

            //Actually move the position
            if(currentDirection == 0) pos[1]--;
            else if(currentDirection == 1) pos[0]++;
            else if(currentDirection == 2) pos[1]++;
            else if(currentDirection == 3) pos[0]--;
         }
    }

    //-------------------------------------------------------------------------------------------------
    //Updates the global studentDead variable
    boolean isStudentDead(){
      if(pos[0] == 1 && pos[1] == 1) studentDead = false; //Can't spawn kill
      else{
            if(pos[0] == Player.pos[0] && pos[1] == Player.pos[1]) studentDead = true;
            else if((pastPos[0] == Player.pos[0] && pastPos[1] == Player.pos[1]) && (pos[0] == Player.pastPos[0] && pos[1] == Player.pastPos[1])) studentDead = true;
      }
      return studentDead;
    }

    void randomPathSearch(){
        //Tests if teacher can move in random direction
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

        //Change current direction variable
        if(randomDirection == 0) currentDirection = randomDirection;
        else if(randomDirection == 1) currentDirection = randomDirection;
        else if(randomDirection == 2) currentDirection = randomDirection;
        else if(randomDirection == 3) currentDirection = randomDirection;
    }

    void directPathSearch(){
        //Distance between teacher and student
        float currentDistance = dist(pos[0],pos[1],Player.pos[0],Player.pos[1]);

        //Ensures that the default distance is too far
        float dist0 = 444469;
        float dist1 = 444469;
        float dist2 = 444469;
        float dist3 = 444469;

        //If empty and won't move in next direction, figure out possible new distances to student
        if(topSpaceEmpty && currentDirection != 2) dist0 = dist(pos[0],pos[1]-1,Player.pos[0],Player.pos[1]);
        if(rightSpaceEmpty && currentDirection != 3) dist1 = dist(pos[0]+1,pos[1],Player.pos[0],Player.pos[1]);
        if(bottomSpaceEmpty && currentDirection != 0) dist2 = dist(pos[0],pos[1]+1,Player.pos[0],Player.pos[1]);
        if(leftSpaceEmpty && currentDirection != 1) dist3 = dist(pos[0]-1,pos[1],Player.pos[0],Player.pos[1]);

        //Find the shortest distance
        float shortestDistance = min(dist0,dist1,dist2);
        shortestDistance = min(shortestDistance,dist3);

        //Change current direction variable
        if(dist0 == shortestDistance) currentDirection = 0;
        else if(dist1 == shortestDistance) currentDirection = 1;
        else if(dist2 == shortestDistance) currentDirection = 2;
        else if(dist3 == shortestDistance) currentDirection = 3;
    }
}
