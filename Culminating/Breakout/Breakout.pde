Paddle paddle;
Ball[] balls;

//--------------------------------------------------------------------------------------------------

void settings() {
  fullScreen();
}

void setup() {
  reset();
}

//--------------------------------------------------------------------------------------------------

void draw() {
  background(50);

  //Step
  step();

}

//--------------------------------------------------------------------------------------------------

void reset() {
  balls = new Ball[1]; //Resets Balls
  balls[0] = new Ball(); //Creates One Ball
  for (int i = 0; i < size; i++) {
    sq[i] = new Square(i, castleGrid);
  }

  paddle = new Paddle();
}

//--------------------------------------------------------------------------------------------------

void step() {

    //Squares
    for (int i = 0; i < size; i++) {
        for (int j=0; j<balls.length; j++) sq[i].step(balls[j]);
    }

    //Balls
    for (int i=0; i<balls.length; i++) balls[i].step();

    //Paddle
    paddle.step();

    //Checks if all balls are dead
    if(everyonDead()) reset();

}

//--------------------------------------------------------------------------------------------------

void mousePressed(){
    balls = (Breakout.Ball[])expand(balls,balls.length+1);
    balls[balls.length-1] = new Ball();
}

//---------------------------------------------------------------------------------------------------

boolean everyonDead(){
    boolean allDead = true;
    for(Ball b: balls) if(b.alive) allDead = false;
    return allDead;
}
