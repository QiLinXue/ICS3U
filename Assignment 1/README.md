# PhysicsAcademy (WIP)
An all in one physics program where once can gain an intuitive understanding of physical concepts through various simulations.

## Dependencies
* [Fisica Physics Library](http://www.ricardmarxer.com/fisica/) Physics Library (Simplified Wrapper for Box2D)
* All fonts/files used are already installed in the data folder

## Flowchart
![Diagram](https://github.com/QiLinXue/PhysicsAcademy/blob/master/flowchart/PhysicsAcademyFlowchart.png)
[Edit](https://www.draw.io/#HQiLinXue%2FPhysicsAcademy%2Fmaster%2Fflowchart%2FPhysicsAcademyFlowchart.png "Click me to edit the flowchart")

## Files
This is a relatively large processing project in terms of components. The global variable screenMode determines the screen the user currently sees. The main file "PhysicsAcademy.pde" acts as a hub where it combines all the major commands. At a glance, it should be easy telling the purpose.

### Screen Mode 0: HomeScreen_Mode.pde
This is the landing screen the user will first see, characterized by the color black in the flowchart. In this file, there is code for buttons that switch the screen mode (self explanatory). The major component of this screen is the code to register as a new user and log in as an existing user.

#### Data Folder
In the data folder, there's two key csv files: "userData.csv" and "empty.csv". "userData.csv" holds the important user information such as username and password (this is not secure at all but hey it's Processing). "empty.csv" is a blank template which is duplicated to create a new user csv file.

I chose to create a new csv file which holds user data for every single user. There are positives and negatives that come with this. First, by creating a new file for each single user, the data folder will get clustered up really really fast. I do not know if it will affect the efficiency, but for a small number of users there should be no problem. The positive side is that it is much easier to work with in the code in comparison to having everyone's data on one file. I can store an entire row in an array easily, and manipulate rows and columns without worrying about modifying anyone else's data.

#### Registering and Logging In
Registering and logging in is a fairly straightforward process. The only major concern was creating a user friendly interface to input the specified information without getting an error message. This is where the variable homeScreenTypeMode comes in, which basically tells the code which stage of the sign up/log in process the user is on.

After logging in or registering, the appropriate csv file is copied to a giant array. This will speed up run time drastically.

### Screen Mode 1: Simulation__Master.pde
Currently, this mode can only be accessed from the quiz mode screen. Depending on how this mode was initialized from the variable "simulationType" it will redirect to one of three customizable simulations

* "WALL_FRICTION" This screen shows how a normal force affects the motion of a box on a vertical wall with a certain static and kinetic friction. The values of the normal force, mass of box, static & kinetic coefficient is set by the initializing variables but can be modified by the user. This uses the Fisica library.
* "KINEMATIC_GRAPH" This screen graphs the position velocity acceleration graphs of a moving object whose position is given by a cubic equation. Zooming in, and panning is accomplished through matrix transformations.
* "SPACE_SIMULATION" This screen shows a planet orbiting around our sun in a highly realistic manner. Real parameters are given, and the altitude and velocity should be exactly identical if it was moved to the real world (looking at it through only classical mechanics of course). This is also achieved through a bunch of equations and matrix transformations.

### Screen Mode 3: Quiz_Mode.pde
This is the primary mode users will be engaged in. The code for this mode is very simple and relies on randomly generated numbers from the file Quiz_Templates.pde (there's a lot of commenting in that file so there's no need to explain its functionality)

### Screen Mode 4: Space_SolarSystemMode.pde
This has the same functionality as the "SPACE_SIMULATION" mode above but it includes data for all the planets + Halley's Comet. If my math is correct, the entire simulation is exactly 100000x faster than real time.

### Screen Mode 5: UserAccount_Mode.pde
This to be finished screen shows some fun statistics about the current user. It has a bunch of arrays that are initialized when the mode is opened and calculates percentages from there.

### Screen Mode 6: Help_Mode.pde
The simplest and most self explanatory screen. Includes a list of helpful tips + instructions for the user.
