class planet{
  float objectRadius; //km
  float mass; //kg
  float periapsis; //m
  float apoapsis; //m
  float periapsisLongitude; //degrees
  float inclination; //degrees
  float centerMass; // kg

  PVector orbit; // (angle, magnitude of length from star)


  planet(float tempobjectRadius, float tempMass, float tempPeriapsis, float tempApoapsis, float tempPeriapsisLongitude, float tempInclination, float tempCenterMass){
    objectRadius = tempobjectRadius;
    mass = tempMass;
    periapsis = tempPeriapsis;
    apoapsis = tempApoapsis;
    periapsisLongitude = tempPeriapsisLongitude;
    inclination = tempInclination;
    centerMass = tempCenterMass;
  }

    float period(){
      return

        //Kepler's Third Law
        (2*PI*
          sqrt(
                (pow((apoapsis+periapsis)/2,3) //Gives the semi-major axis
                /
                (6.674e-11*centerMass)) //Gives the Standard Gravitational Parameter of the System
              )
        );
    }

    float angle(){
      return
              (timewarp* //Speeds everything up
                 ((timeticker/period())) // percentage of the period completed so it can be transformed into an angle
                 % 360
              ); //Transforms a percentage into an angle
    }

    float altitude(){
      //Using an adaptation of Kepler's Equation
      //r^3=(GM*T^2)/4pi^2
      return (
        pow(
          (((6.674e-11*centerMass)  //Standard Gravitational Parameter
            *
            pow(period(),2)) //Period Squared
          /
          (4*pow(PI,2))) //4pi^2
          ,
         0.3333) //Cube Rooted
      );
    }

    float angularvelocity(){
      //Vis-Viva Equation
      //sqrt(μ*[(2/r)-(1/a)])
      return (
        sqrt(
          (6.674e-11*centerMass) // standard gravitational Parameter
          *
          (
            (2/altitude()) // 2/r
            -
            (1/((apoapsis+periapsis)/2)) // 1/a
          )
        )
        );
    }

  void plotplanet(){
    fill(153,50,204); //pinkish color

    pushMatrix(); //Begin transformation
    rotateZ(radians(periapsisLongitude)); //Matches its longitude of periapsis
    rotateX(radians(inclination)); //Matches its orbital inclination

    //Transforms the planet according to the current angle and its orbital properties
    translate(
               cos(radians(angle())-radians(periapsisLongitude))* //x-component of planet with respect to center body
               (periapsis/orbitRadiusScaler) //length magnitude of sateliite with respect to center body
               ,
               sin(radians(angle())-radians(periapsisLongitude))* //y-component of planet with respect to center body
               (apoapsis/orbitRadiusScaler) //Length magnitude of planet with respect to center body
             );
    //stroke(0); //Gives the stroke color of the sphere details
    sphere(objectRadius/planetSizeScaler); //Actual planet itself
    popMatrix(); //Ends transformation
  }

  void plotOrbit(){
    stroke(255); //color of the orbit line
    noFill(); //ensures the ellipse is transparent

    pushMatrix(); //Begin transformation
    rotateZ(radians(periapsisLongitude)); //Matches its longitude of periapsis
    rotateX(radians(inclination)); //Matches its orbital inclination
    //The actual orbit
    ellipse(
      0,
      0, //Note that there is a transformation under solarSystem() that ensures the center is at 0,0 for convenient rotations
      (periapsis/orbitRadiusScaler)*2, //magnitude of length of periapsis *2
      (apoapsis/orbitRadiusScaler)*2  //magnitude of length of apoapsis *2
    );

    popMatrix(); //End transformation
  }

  void displayFacts(){
    println(angle(),altitude());
  }
}
