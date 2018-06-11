class Paddle{
    Paddle(){
        xcor = width/4;
        ycor = height-height/20;
    }

    float xcor;
    float ycor;

    float w = width/5;
    float h = height/40;
    float xVel = 0;


    void step(){
        xVel = (mouseX-w/2)-xcor;
        xcor = mouseX-w/2;

        fill(255);
        rect(xcor,ycor,w,h);
    }

}
