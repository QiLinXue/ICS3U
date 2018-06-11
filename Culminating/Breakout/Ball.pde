class Ball{

    Ball(){
        xcor = random(0,width);
        ycor = height-height/3;
    }

    //---------------------------------------------------------

    boolean alive = true;
    float xcor, ycor;

    //------------------------------------------------------------

    float xv = 10;
    float yv = -20;
    float w = 20;
    float h = 20;

    //---------------------------------------------------------
    void step(){

        if(alive){
            fill(255);

            ellipse(xcor,ycor,w,h);
            ycor += yv;
            xcor += xv;

            //Tests if ball out of bounds
            if(ycor < 0) verticalBoundCollision();
            if(ycor >= height) alive = false;
            if(xcor >= width || xcor < 0) horizontalBoundCollision();

            //tests if ball is touching paddle
            if(abs(xcor - paddle.xcor - paddle.w/2) < paddle.w/2
            && abs(ycor - paddle.ycor - paddle.h/2) < paddle.h/2) paddleCollision();
        }

  }

  //--------------------------------------------------------------------------------------------------

    void verticalBoundCollision() {
        yv *= -1;
    }

    void horizontalBoundCollision() {
        xv *= -1;
    }

    void paddleCollision(){
        yv *= -1;
        if(paddle.xVel > 0) xv ++;
        if(paddle.xVel < 0) xv --;
    }

}
