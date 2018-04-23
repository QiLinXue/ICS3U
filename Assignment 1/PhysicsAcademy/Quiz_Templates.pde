String commonMistakeMessage(String errorCode){
    String message = "";
    switch(errorCode){
        case "FRICTION":
            message = "Make sure to review the different friction types";
            break;
        case "NORMALFORCE":
            message = "Make sure to review the normal force";
            break;
    }
    return message;
}

String[][] problem1(){
    String[][] problem =
    {
        {"question","question type","answer","question number"}, //Basic Data
        {"hint1","hint2","hint3","hint4"}, //Hints
        {"badAns1","badAns2","badAns3","badAns4"}, //Bad Answers
        {"typeBadAns1","typeBadAns2","typeBadAns3","typeBadAns4"}, //Types of bad answer
        {"data1","data2","data3"}, //Important data in order to simulate
        {"simulationType"} //Tells which simulation to run
    };
    //Question Number
    problem[0][3] = "1";

    //Question Type
    problem[0][1] = "FREE"; //Currently, there are only free responses

    //Simulation Type
    problem[5][0] = "WALL_FRICTION";

    //Stats
    String mass = Integer.toString(floor(random(1,50)));
    String kineticFriction = Float.toString(int(random(2,7)));
    String staticFriction = Float.toString(int(random(int(kineticFriction)+1,8)));
    String force = Integer.toString(floor(random(1,50))+int(mass)*100/int(staticFriction));

    problem[4][0] = mass;
    problem[4][1] = Float.toString(float(staticFriction)/10);
    problem[4][2] = Float.toString(float(kineticFriction)/10);


    //Question
    problem[0][0] = "A book of mass "+mass+"kg is held to a vertical wall by a person's hand applying a "+force+"N force directly toward the wall. The wall has a static friction coefficient of 0."+staticFriction.charAt(0)+" and a kinetic friction coefficient of 0."+kineticFriction.charAt(0)+". With the book held at rest, what is the frictional force keeping the book from sliding down the wall? Round to the nearest unit";

    //Answer
    problem[0][2] = Float.toString(round(int(force)*float(staticFriction)*0.1));

    //Hints
    //NOTE: Is it possible to transfer this to data file
    problem[1][0] = "In this problem, the phrase 'what is the frictional force keeping the book from sliding down the wall' suggests that the box is stationary. Therefore, static friction exists but there is no kinetic friction";
    problem[1][1] = "Since the wall is perfectly vertical, there will be no normal force that is generated from the weight of the book. Therefore, the mass of the book is irrelevant.";
    problem[1][2] = "The normal force generated from applying a perpendicular force to the wall is just the force applied. Therefore, the normal force from the force applied is "+force+" Newtons.";
    problem[1][3] = "The frictional force is equal to product of the coefficient of friction (static/kinetic) and the normal force";

    //Bad Answer
    problem[2][0] = Float.toString(round(int(force)*float(kineticFriction)*0.1));
    problem[3][0] = "FRICTION";

    problem[2][1] = Float.toString(round(int(mass)*float(staticFriction)*0.1));
    problem[3][1] = "NORMALFORCE";

    problem[2][2] = "99999";
    problem[3][2] = "NULL";

    problem[2][3] = "99999";
    problem[3][3] = "NULL";
    return problem;
}

String[][] problem2(){
    //TODO make bonus sections for common mistakes
    String[][] problem =
    {
        {"question","question type","answer","question number"}, //Basic Data
        {"hint1","hint2","hint3","hint4"}, //Hints
        {"badAns1","badAns2","badAns3","badAns4"}, //Bad Answers
        {"typeBadAns1","typeBadAns2","typeBadAns3","typeBadAns4"}, //Types of bad answer
        {"data1","data2","data3"}, //Important data in order to simulate
        {"Simulation Type"}
    };
    //Question Number
    problem[0][3] = "2";

    //Question Type
    problem[0][1] = "FREE"; //Currently, there are only free responses

    //Simulation Type
    problem[5][0] = "WALL_FRICTION";

    //Stats
    String mass = Integer.toString(floor(random(1,50)));
    String kineticFriction = Float.toString(int(random(2,7)));
    String staticFriction = Float.toString(int(random(int(kineticFriction)+1,8)));

    problem[4][0] = mass;
    problem[4][1] = Float.toString(float(staticFriction)/10);
    problem[4][2] = Float.toString(float(kineticFriction)/10);

    //Question
    problem[0][0] = "A box of mass "+mass+"kg is held to a vertical wall by a person's hand applying a force 'F' directly toward the wall. The wall has a static friction coefficient of 0."+staticFriction.charAt(0)+" and a kinetic friction coefficient of 0."+kineticFriction.charAt(0)+". With the book held at rest, what is the minimum force needed to ensure the box is at rest? Assume g = -10m/s^2 and round to the nearest unit.";

    //Answer
    problem[0][2] = Float.toString(round(int(mass)*100/int(staticFriction)));

    //Hints
    //TODO: Transfer this to data file
    problem[1][0] = "In this problem, the phrase 'With the book held at rest' suggests that the box is stationary. Therefore, static friction exists but there is no kinetic friction";
    problem[1][1] = "Since the wall is perfectly vertical, there will be no normal force that is generated from the weight of the book. The only normal force generated is from the force applied, which you are trying to find";
    problem[1][2] = "Since the box isn't moving, the frictional force cancels out the weight of the box. The weight of the box is mg = " + Integer.toString((int(mass)*10));
    problem[1][3] = "The frictional force is equal to product of the coefficient of friction (static/kinetic) and the normal force.";

    //Bad Answer
    problem[2][0] = Float.toString(int(mass)*100);
    problem[3][0] = "FRICTION";

    problem[2][1] = Float.toString(int(mass)*10);
    problem[3][1] = "FRICTION";

    problem[2][2] = Float.toString(round(int(mass)*100/int(kineticFriction)));
    problem[3][2] = "FRICTION";

    problem[2][3] = Float.toString(round(int(mass)*10/int(kineticFriction)));
    problem[3][3] = "WEIGHT";
    return problem;
}

String[][] problem3(){
    String[][] problem =
    {
        {"question","question type","answer","question number"}, //Basic Data
        {"hint1","hint2","hint3","hint4"}, //Hints
        {"badAns1","badAns2","badAns3","badAns4"}, //Bad Answers
        {"typeBadAns1","typeBadAns2","typeBadAns3","typeBadAns4"}, //Types of bad answer
        {"data1","data2","data3","data4"}, //Important data in order to simulate
        {"Simulation Type"}
    };
    //Question Number
    problem[0][3] = "3";

    //Question Type
    problem[0][1] = "FREE"; //Currently, there are only free responses

    //Simulation Type
    problem[5][0] = "KINEMATIC_GRAPH";

    //Stats
    String co1 = Float.toString(floor(random(-10,10)));
    String co2 = Float.toString(floor(random(-10,10)));
    String co3 = Float.toString(floor(random(-10,10)));
    String co4 = Float.toString(floor(random(-10,10)));
    if(float(co1) == 0) co1 = "11"; //Ensures acceleration has an x-intercept

    problem[4][0] = co1;
    problem[4][1] = co2;
    problem[4][2] = co3;
    problem[4][3] = co4;

    //Question
    problem[0][0] = "Donald Trump accidentally fired a nuclear missile at the US and it's going wild! But don't worry, scientists are able to make it self destruct when the missile feels no external force in the x direction. The x-position of the missile can be mapped as x(t)= " + problem[4][0] + "t^3 + " + co2 + "t^2 + " + co3 + "t + " + co4 +". At what time should the scientists make the missile self destruct? Round to two decimal places.";

    //Answer
    problem[0][2] = Float.toString((-1*float(co2)/float(co1))/3);

    //Hints
    problem[1][0] = "The derivative of position with respect to time is velocity. The derivative of velocity with respect to time is acceleration.";
    problem[1][1] = "Force = mass * acceleration. Thus, the force in the x-direction is zero when the mass is zero or the acceleration is zero. Since the mass stays constant, we have to solve for when the acceleration in the x-direction is 0.";
    problem[1][2] = "The power rule states that the derivative of ax^n is nax^(n-1)";
    problem[1][3] = "By taking the derivative both times gives the equation 6ax+b. After setting it to zero, we are able to solve for x, the position at which the acceleration is zero and thus the force is zero.";

    //Bad Answer
    problem[2][0] = "TBA";
    problem[3][0] = "TBA";

    problem[2][1] = "TBA";
    problem[3][1] = "TBA";

    problem[2][2] = "TBA";
    problem[3][2] = "TBA";

    problem[2][3] = "TBA";
    problem[3][3] = "TBA";

    return problem;
}

String[][] problem4(){
    String[][] problem =
    {
        {"question","question type","answer","question number"}, //Basic Data
        {"hint1","hint2","hint3","hint4"}, //Hints
        {"badAns1","badAns2","badAns3","badAns4"}, //Bad Answers
        {"typeBadAns1","typeBadAns2","typeBadAns3","typeBadAns4"}, //Types of bad answer
        {"data1","data2","data3","3"}, //Important data in order to simulate
        {"Simulation Type"}
    };
    //Question Number
    problem[0][3] = "4";

    //Question Type
    problem[0][1] = "FREE"; //Currently, there are only free responses

    //Simulation Type
    problem[5][0] = "SPACE_SIMULATION";

    //Stats
    String periapsis = Float.toString((random(1,5)));
    String apoapsis = Float.toString(float(periapsis)+(random(1,5)));
    String eccentricity = Float.toString((float(apoapsis)-float(periapsis))/(float(apoapsis)+float(periapsis)));

    problem[4][0] = periapsis;
    problem[4][1] = apoapsis;
    problem[4][2] = eccentricity;

    //Question
    problem[0][0] = "A new asteroid around our sun is discovered! Astronomers are able to figure out its perigee is " + periapsis + "E11 metres and it has an eccentricity of " + eccentricity + ". What is the apogee of this rocket?";

    //Answer
    problem[0][2] = apoapsis;

    //Hints
    problem[1][0] = "Apoapsis refers to the maximum distance from the planet to the sun and periapsis refers to the minimum distance from the planet to the sun.";
    problem[1][1] = "Since the planet is in elliptic orbit, the eccentricity is given by the ratio between the sum of the apoapsis (a) and periapsis (p) and their positive difference. In other words, e = (a+p)/(a-p)";
    problem[1][2] = "Using the equation from hint 2, multiply both sides by (a-p). Expand the left side. Move all terms with apoapsis on one side and move all terms with periapsis on the other side. Finally, factor a and p and rearrange to solve for a.";
    problem[1][3] = "From hint 2 and 3, the apoapsis (a) is given by the periapsis (p) and eccentricity (e) such that a=(1-e)/(1+e) which gives " + apoapsis + " metres.";

    //Bad Answer
    problem[2][0] = "TBA";
    problem[3][0] = "TBA";

    problem[2][1] = "TBA";
    problem[3][1] = "TBA";

    problem[2][2] = "TBA";
    problem[3][2] = "TBA";

    problem[2][3] = "TBA";
    problem[3][3] = "TBA";

    return problem;
}
