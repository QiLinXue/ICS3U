String pi;
String euler;
int circles;
float size;

void pixelArtSetup(){
    String[] raw = loadStrings("pi.txt");
    pi = raw[0];

    raw = loadStrings("e.txt");
    euler = String.join(",",raw);

    circles = 1000000;
    size = width/sqrt(circles);

    background(0);

}

void pixelArt(){
    //drawInequality(pi,euler);
    drawOverlapPixels(pi,euler,false,false,false);
    save("default.png");
    noLoop();
}

void drawPixels(String longNumber){
    int charPixel;
    noStroke();
    colorMode(HSB,9,1,1);
    for(int y=0;y<height/size;y++){
        for(int x=0;x<width/size;x++){
            charPixel = Character.getNumericValue(longNumber.charAt(y*(width/floor(size))+x));

            fill(charPixel,1,1);
            rect(x*size,y*size,size,size);

        }
    }
}

void drawInequality(String longNumber1, String longNumber2){
    int counter = 0;
    int charPixel1, charPixel2;
    noStroke();
    colorMode(HSB,9,1,1);
    for(int y=0;y<height/size;y++){
        for(int x=0;x<width/size;x++){
            charPixel1 = Character.getNumericValue(longNumber1.charAt(y*(width/floor(size))+x));
            charPixel2 = Character.getNumericValue(longNumber2.charAt(y*(width/floor(size))+x));
            if(charPixel1>charPixel2){
                counter++;
                fill(charPixel1,1,1);
                rect(x*size,y*size,size,size);
            }

        }
    }
    println(counter);
}

void connectingLines(String longNumber){
    int char00, char10, char01, char11;
    //background(0);
    colorMode(HSB,9,9,9);
    for(int y=0;y<height/size;y++){ //Use height/size-1 if circles>900000
        for(int x=0;x<width/size;x++){
            char00 = Character.getNumericValue(longNumber.charAt(y*(width/floor(size))+x));
            char10 = Character.getNumericValue(longNumber.charAt(y*(width/floor(size))+x+1));
            char01 = Character.getNumericValue(longNumber.charAt((y+1)*(width/floor(size))+x));
            char11 = Character.getNumericValue(longNumber.charAt((y+1)*(width/floor(size))+(x+1)));

            stroke(char00,9,9);
            if(char00 == char10) line(x*size+(size/2),y*size+(size/2),(x+1)*size+(size/2),y*size+(size/2));
            if(char00 == char01) line(x*size+(size/2),y*size+(size/2),x*size+(size/2),(y+1)*size+(size/2));
            if(char00 == char11) line(x*size+(size/2),y*size+(size/2),(x+1)*size+(size/2),(y+1)*size+(size/2));
            if(char10 == char01){
                stroke(char10,9,9);
                line(x*size+(size/2),(y+1)*size+(size/2),(x+1)*size+(size/2),y*size+(size/2));
            }

        }
    }
}

void drawOverlapPixels(String longNumber1, String longNumber2, boolean enableDull, boolean reverse, boolean mono){
    int sameCount = 0;
    int charPixel1, charPixel2;
    colorMode(RGB,1,1,1);
    background(1);
    noStroke();
    colorMode(HSB,9,1,1);
    for(int y=0;y<height/size;y++){
        for(int x=0;x<width/size;x++){
            charPixel1 = Character.getNumericValue(longNumber1.charAt(y*(width/floor(size))+x));
            charPixel2 = Character.getNumericValue(longNumber2.charAt(y*(width/floor(size))+x));

            if(charPixel1 == charPixel2){
                sameCount++;
                if(!mono){
                    if(!reverse) fill(charPixel1,1,1);
                    else fill(0,0,0);
                }
                else{
                    if(reverse) fill(0,0,0);
                    else fill(0,0,0.3);
                }
                rect(x*size,y*size,size,size);
            }
            else{
                if(enableDull){
                    if(!mono){
                        if(!reverse) fill(charPixel1,0.3,0.5);
                        else fill(charPixel1,1,1);
                    }
                    else{
                        if(!reverse) fill(0,0,0);
                        else fill(0,0,0.3);
                    }
                    rect(x*size,y*size,size,size);
                }
                else{
                    if(!mono){
                        if(!reverse) fill(0,0,0);
                        else fill(charPixel1,1,1);
                    }
                    else{
                        if(!reverse) fill(0,0,0);
                        else fill(0,0,0.3);
                    }
                    rect(x*size,y*size,size,size);
                }
            }


        }
    }
    println(sameCount);
}
