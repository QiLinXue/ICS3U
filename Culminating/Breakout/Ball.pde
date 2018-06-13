class Ball{

    Ball(int tempStrength){
        xcor = random(0,width);
        ycor = height-height/3;

        strength = tempStrength;
    }

    //---------------------------------------------------------

    boolean alive = true;
    float xcor, ycor;

    //------------------------------------------------------------
    int strength = 1;

    float xv = 10;
    float yv = -20;
    float w = 20;
    float h = 20;

    //---------------------------------------------------------
    void step(){

        if(alive){
            switchColor(strength);

            ellipse(xcor,ycor,w,h);
            ycor += yv;
            xcor += xv;

            //Tests if ball out of bounds
            if(ycor < 0) verticalBoundCollision();
            if(ycor >= height) die();
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
        ycor += yv;
        xcor += xv;
    }

    void paddleCollision(){
        yv *= -1;

        //Shift x Velocity
        //if(paddle.xVel > 0) xv ++;
        //if(paddle.xVel < 0) xv --;

        //Switch x Velocity
        if(paddle.xVel > 0 && xv < 0) xv *= -1;
        if(paddle.xVel < 0 && xv > 0) xv *= -1;
    }


    void die(){
      alive = false;
      //Checks if all balls are dead
      if(everyoneDead()) reset();
      notify();
    }
}
