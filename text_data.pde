

String mass = Integer.toString(floor(random(1,50)));
String force = Integer.toString(floor(random(1,50))+Integer.parseInt(mass));
String kineticFriction = Float.toString(int(random(1,9)));
String staticFriction = Float.toString(int(random(int(kineticFriction)+1,9)));


String problem1 = "A book of mass "+mass+"kg is held to a vertical wall by a person's hand applying a "+force+"N force directly toward the wall. The wall has a static friction coefficient of 0."+staticFriction.charAt(0)+" and a kinetic friction coefficient of 0."+kineticFriction.charAt(0)+". With the book held at rest, what the is frictional force keeping the book from sliding down the wall?";
