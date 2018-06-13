Paddle paddle;
Ball[] balls;

//--------------------------------------------------------------------------------------------------

void settings() {
  fullScreen();
}

void setup() {
  reset();
  noCursor();
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
  balls[0] = new Ball(6); //Creates One Ball

  //Resets the castle
  for (int i=0; i<castleGrid[0].length * castleGrid.length; i++) {
    castle[i] = new Square(i, castleGrid);
  }

  paddle = new Paddle();
}

//--------------------------------------------------------------------------------------------------

void step() {

    //Squares
    for (int i=0; i<castleGrid[0].length * castleGrid.length; i++) {
         for (int j=0; j<balls.length; j++) castle[i].step(balls[j]);
    }

    //Balls
    for (int i=0; i<balls.length; i++) balls[i].step();

    //Paddle
    paddle.step();


}

//--------------------------------------------------------------------------------------------------

void mousePressed(){
createNewBall(20);
}

//---------------------------------------------------------------------------------------------------

boolean everyoneDead(){
    boolean allDead = true;
    for(Ball b: balls) if(b.alive) allDead = false;
    return allDead;
}

//---------------------------------------------------------------------------------------------------

void createNewBall(int strength){
    balls = (Breakout.Ball[])expand(balls,balls.length+1);
    balls[balls.length-1] = new Ball(strength);
}