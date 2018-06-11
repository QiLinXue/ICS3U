class Square {
    float xcor = 0;
    float ycor = 0;

    float w = (float)width/(castleGrid[0].length);
    float h = (float)width/(castleGrid[0].length);
    int lives;

    //----------------------------------------------------------------------------------

    //i gives the position of the square, grid is the template it's following
    Square(int i, int[][] grid) {

        //Coordinates
        xcor = i*w % width;
        ycor = floor(i/(width/w)) * h + height/5;

        //Sets the lives based off of width and height corresponding to the grid array
        int j = Math.round((ycor-height/5)/h);
        lives = grid[j][i % grid[0].length];

    }


    void step(Ball b) {
        if (lives == 3) fill(255, 0, 0);
        if (lives == 2) fill(255, 255, 0);
        if (lives == 1) fill(255);
        if (lives > 0) rect(xcor, ycor, w, h);

        gotHit(b);

    }

    void gotHit(Ball b) {
        if (abs(xcor+w/2 - b.xcor) < w/2 && abs(ycor+h/2 - b.ycor) < h/2 && lives > 0) {
            b.yv *= -1;
            //b.xv *= 2*floor(random(0, 2))-1; //random

            b.ycor += b.yv;
            b.xcor += b.xv;
            lives--;
        }
    }
}
