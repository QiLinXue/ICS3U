int size = 50;
float[] xValues;
float[] yValues;

void setup(){
    xValues = new float[size];
    yValues = new float[size];
    for(int i=0;i<size;i++){
        xValues[i] = random(0,width);
        yValues[i] = random(0,height);
    }
}

void settings(){
    size(1000,1000);
}

void draw(){
    for(int i=0;i<size;i++){
        if(yValues[i]>height/2) line(xValues[i],yValues[i],xValues[i],height);
        else line(xValues[i],yValues[i],xValues[i],0);
    }
}
