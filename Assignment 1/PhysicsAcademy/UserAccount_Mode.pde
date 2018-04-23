//Below list transfers the csv data to a simple array, to save time during for loops
int[] currentUserAnswerScore, currentUserAnswerProblem;
int numberOfUserResponses;

//Below list will contain data about number of correct answers, number of incorrect answers, and the questions failed, seperated into the different quesiton categories (friction,kinematics,space), then the last part will be seperated into the different question categories, but listed in total
float[] currentUserStats;

float[] failPercentages; //A more detailed version which uses currentUserStats to generate actual statistics

void userAccountIntialize(){

    //Stat Lists Declared
    currentUserStats = new float[2+2*3];
    failPercentages = new float[3];

    //Transfers raw data onto lists
    currentUserAnswerScore = scoreSheetTable.getIntColumn("Score");
    currentUserAnswerProblem = scoreSheetTable.getIntColumn("Problem");

    //Helps reduce for loop time
    numberOfUserResponses = scoreSheetTable.getRowCount();

    //Updates Statistics
    for(int i=8;i<numberOfUserResponses;i++){

        if(currentUserAnswerScore[i] == 1) currentUserStats[0]++;
        else{
            currentUserStats[1]++;
            switch(currentUserAnswerProblem[i]){
                case 1: currentUserStats[2]++; break;
                case 2: currentUserStats[2]++; break;
                case 3: currentUserStats[3]++; break;
                case 4: currentUserStats[4]++; break;
            }
        }

        switch(currentUserAnswerProblem[i]){
            case 1: currentUserStats[5]++; break;
            case 2: currentUserStats[5]++; break;
            case 3: currentUserStats[6]++; break;
            case 4: currentUserStats[7]++; break;
        }
    }

    //More detailed statistics about percentage of failed questions by type
    for(int i=0;i<failPercentages.length;i++){
        failPercentages[i] = (currentUserStats[2+i]/currentUserStats[2+i+3]);
        if(currentUserStats[2+i] == 0 && currentUserStats[2+i+3] == 0) failPercentages[i] = 0;
  }
    screenMode = 5;
}

void userAccountMode(){
    background(33, 26, 29);

    //Upper Title
    noStroke();
    fill(150,0,255); //TODO: Better color
    rect(15,15,570,60,60);

    //Title Text
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(30);
    text("User Account for " + activeUser,15,15,570,60);

    //Questions wrong by type graph
    pieChart(120,180,180,failPercentages);

    //Questions wrong by type - legend Box
    fill(255);
    rect(240,90,30,30,60);

    fill(255-50);
    rect(240,126,30,30,60);

    fill(255-100);
    rect(240,162,30,30,60);

    //Questions wrong by type - legend Text
    fill(255);
    textSize(15);
    textAlign(LEFT,CENTER);

    text("Friction Problems - "  + failPercentages[0]*100 + "% Wrong",276,75,300,60);
    text("Kinematic Problems - " + failPercentages[1]*100 + "% Wrong",276,115,300,60);
    text("Space Problems - "     + failPercentages[2]*100 + "% Wrong",276,147,300,60);

    //Overall Statistics
    fill(255);
    rect(30, 300,240,40,60); //Lifetime Questions
    rect(330,300,240,40,60); //Total Correct Answers

    fill(0);
    textAlign(CENTER,CENTER);
    textSize(15);
    text("Lifetime Questions: " + (numberOfUserResponses-8),30,300,240,40); //Since there are 8 neutral questions at the start, they don't count
    text(
        "Total Correct Answers: " +
            (numberOfUserResponses-8-
             currentUserStats[2]-
             currentUserStats[3]-
             currentUserStats[4]
            )
        ,330,300,240,40
        );

    //Back button
}

void userAccountKeyPressed(){
    if(keyCode == BACKSPACE) screenMode = 0;
}

void userAccountModeMousePressed(){
}

//Taken off Processing Website. I'm pretty sure I can write a similar code
void pieChart(float x, float y, float diameter, float[] data) {

  //Local Variables
  float sum = 0;
  float[] angles = new float[data.length];

  for(int i=0;i<data.length;i++) sum+=data[i]; //Gets the sum
  for(int i=0;i<angles.length;i++) angles[i] = (data[i]/sum)*360; //Converts data into percentages

  float lastAngle = 0;

  //Draws the arc
  for (int i = 0; i < angles.length; i++) {
    float graphColor = 255-i*50; //TODO create better colors
    fill(graphColor);
    arc(x, y, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }

}
