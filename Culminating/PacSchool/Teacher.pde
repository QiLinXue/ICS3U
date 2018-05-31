class Teacher{
    int[] pos = {0,0};
    boolean topSpaceEmpty, leftSpaceEmpty, bottomSpaceEmpty, rightSpaceEmpty;
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
    }
}
