String simulationType = "NULL";

void initializeSimulation(){
    if(simulationType == "WALL_FRICTION")
        initializeWallSimulation(
            float(questionData[4][0]),
            float(questionData[4][1]),
            float(questionData[4][2])
        );

    if(simulationType == "KINEMATIC_GRAPH")
        initializeKinematicGraphSimulation(
            float(questionData[4][0]),
            float(questionData[4][1]),
            float(questionData[4][2]),
            float(questionData[4][3])
        );
    if(simulationType == "SPACE_SIMULATION")
        solarSystemInitialize(
            30000, //More about visuals than science
            5.972E24, //Doesn't matter, placeholder for now
            float(questionData[4][0])*1E11,
            float(questionData[4][1])*1E11
        );
}

void simulationMode() {
  if(simulationType == "WALL_FRICTION") wallSimulation();
  if(simulationType == "KINEMATIC_GRAPH") kinematicGraphSimulation();
  if(simulationType == "SPACE_SIMULATION") solarSystemSimulation();
}

void simulationModeMousePressed(){
    if(simulationType == "KINEMATIC_GRAPH") kinematicMousePressed();
}
