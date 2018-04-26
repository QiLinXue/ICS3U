float[][] nodeLocations = {{100,200},{200,200},{300,200},{400,200},{500,300},{500,400},{500,500},{400,600},{300,600},{200,600}};
void nodeConnectionSetup(){
    ellipseMode(CENTER);
    strokeWeight(2);
    stroke(255);
    num = pi;

}
String num;
void nodeConnection(){
    background(0);
    for(int i=0;i<10;i++){
        if(mousePressed && mouseX>nodeLocations[i][0]-25&&mouseX<nodeLocations[i][0]+25&&mouseY>nodeLocations[i][1]-25&&mouseY<nodeLocations[i][1]+25){
            println("hello");
            nodeLocations[i][0] = mouseX;
            nodeLocations[i][1] = mouseY;
        }
        ellipse(nodeLocations[i][0],nodeLocations[i][1],50,50);

    }

    for(int i=0;i<10;i++){
        line(nodeLocations[Character.getNumericValue(num.charAt(i))][0],
             nodeLocations[Character.getNumericValue(num.charAt(i))][1],
             nodeLocations[Character.getNumericValue(num.charAt(i+1))][0],
             nodeLocations[Character.getNumericValue(num.charAt(i+1))][1]);
    }

}
