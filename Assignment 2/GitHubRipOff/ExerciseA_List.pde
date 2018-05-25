void exercise1(float x1, float y1, float x2, float y2, float shift) {
    //Setup
    float w = x2-x1;
    float h = y2-y1;
    ellipseMode(CENTER);

    //Screen

    fill(119,176,245);
    noStroke();
    rect(x1,y1+shift+sShift,w,h);

    //Sun
    noStroke();
    fill(252,245,0);
    ellipse(x1+w/4.01142857,y1+h/2+shift+sShift,w/7.8,w/7.8); // ellipse(350,530,180,180);

    //Lines
    stroke(0);
    strokeWeight(w/280.8);
    line(x1,y1+h/2+shift+sShift,x2,y1+h/2+shift+sShift); //line(0,530,1404,530);

    //Grass
    strokeWeight(0);
    fill(28, 234, 92);
    rectMode(CORNER); //(x1, y) is top left corner
    rect(x1, y1+h/(1060/530)+shift+sShift, w, h/(1060/530));

    //House
    stroke(0);
    strokeWeight(w/702);
    fill(240,97,123);
    rect(x1+w/1.48101266, y1+h/2.40909091+shift+sShift, w/5.01428571, h/5.69892473);

    //Roof
    fill(0,0,0);
    triangle(x1+w/1.51293103, y1+h/2.41457859+shift+sShift,
             x1+w/1.29639889, y1+h/3.18318318+shift+sShift,
             x1+w/1.13408724, y1+h/2.41457859+shift+sShift);

    //Door
    fill(255,255,255);
    rect(x1+w/1.33080569,y1+h/2.23157895+shift+sShift,w/21.9375, h/8.15384615);

    //Doorknob
    fill(0,0,0);
    ellipse(x1+w/1.31214953,y1+h/1.96296296+shift+sShift,w/108,h/81.5384615);

    //Sun rays
    for(float i=0;i<190;i=i+16.3636364){

        stroke(252,245,0);
        strokeWeight(w/280.8);
        line(x1+w/4.05780347, y1+h/2.03846154+shift+sShift,
             x1+w/(1404/(150*cos(radians(i))+396-50)), y1+h/(1060/(-150*sin(radians(i))+520))+shift+sShift);

    }

}

void exercise2(float x1, float y1, float x2, float y2, float shift){

//Setup
float w = x2-x1;
float h = y2-y1;

//Screen
fill(255,255,255);
stroke(0);
strokeWeight(w/280);
rect(x1,y1+shift+sShift,w,h);

arc(x1+w/2,y1+h/2+shift+sShift,w/140,h/140,radians(45),radians(45));
ellipseMode(CORNER);
noFill();

stroke(250,128,128); //red
strokeWeight(w/25.9259259);
arc(x1+w/7.36842105,y1+h/20+shift+sShift,w/1.62790698,h/1.37795276,radians(85),radians(268));

stroke(215,250,128); //yellow
strokeWeight(w/26.9230769);
arc(x1+w/12.7272727,y1+h/20.5882353+shift+sShift,w/1.50537634,h/1.3618677,radians(84),radians(270));

stroke(128,250,128); //green
strokeWeight(w/53.8461538);
arc(x1+w/8.53658537,y1+h/33.3333333+shift+sShift,w/1.52173913,h/1.38613861,radians(80),radians(260));

stroke(102,143,251); //blue
strokeWeight(w/53.8461538);
arc(x1+w/7.60869565,y1+h/46.6666667+shift+sShift,w/1.63934426,h/1.37254902,radians(95),radians(260));

stroke(192,128,250); //purple
strokeWeight(w/100);
arc(x1+w/9.85915493,y1+h/-17.5+shift+sShift,w/1.47679325,h/1.4,radians(85),radians(234));

//Right Side
stroke(250,128,128); //red
strokeWeight(w/25.9259259);
arc(x1+w/3.18181818,y1+h/2.67175573+shift+sShift,w/1.62790698,h/1.37795276,radians(-70),radians(39));

stroke(215,250,128); //yellow
strokeWeight(w/26.9230769);
arc(x1+w/3.82513661,y1+h/2.9787234+shift+sShift,w/1.50537634,h/1.4,radians(-73),radians(50));

stroke(128,250,128); //green
strokeWeight(w/53.8461538);
arc(x1+w/4.72972973,y1+h/2.5+shift+sShift,w/1.41414141,h/1.42857143,radians(-85),radians(42));

stroke(102,143,251); //blue
strokeWeight(w/53.8461538);
arc(x1+w/3.22580645,y1+h/2.9787234+shift+sShift,w/1.63934426,h/1.45833333,radians(-69),radians(54));

stroke(192,128,250); //purple
strokeWeight(w/100);
arc(x1+w/4.11764706,y1+h/3.44827586+shift+sShift,w/1.47679325,h/1.4,radians(-97),radians(54));

}

class Exercise3{
    int[][] circleLocations = {};
    void show(float x1, float y1, float x2, float y2, float shift){
        float w = x2-x1;
        float h = y2-y1;

        ellipseMode(CENTER);
        //Screen
        fill(0);
        stroke(0);
        strokeWeight(w/280);
        rect(x1,y1+shift+sShift,w,h);

        stroke(100);

        if(mouseX>x1 && mouseX<x2 && mouseY>y1+shift+sShift && mouseY<y2+shift+sShift){
            int[] currentCircle = {mouseX,mouseY};
            circleLocations = (int[][])append(circleLocations,currentCircle);
        }

        int circlesLength = circleLocations.length;
        for(int i=0;i<circlesLength;i++){
            fill((circleLocations[i][0]-x1)*2.03821656,(circleLocations[i][1]-y1-shift-sShift)*1.82370821,255);
            ellipse(circleLocations[i][0],circleLocations[i][1],w/6.5,w/6.4);
        }

        int rate = 30; //the smaller the faster
        int fakeShift = sShift;

        if (keyPressed){
          if (keyPressed & keyCode == DOWN) fakeShift-=height/rate;
          if (keyPressed & keyCode == UP && fakeShift < -1) fakeShift+=height/rate;
          circlesLength = circleLocations.length;
          for(int i=0;i<circlesLength;i++){
              circleLocations[i][1]+=(fakeShift-sShift);
          }
        }
    }
}

class Exercise4{
    float a,b;
    float[][] circleLocations1 = {};
    float[][] circleLocations2 = {};
    int reset1, reset2, circlesLength1, circlesLength2;
    void show(float x1, float y1, float x2, float y2, float shift){
        //Setup
        float w = x2-x1;
        float h = y2-y1;

        noStroke();

        //Screen
        fill(0);
        noStroke();
        strokeWeight(w/280);
        rect(x1,y1+shift+sShift,w,h);

        colorMode(HSB,360,100,50,1);
        //a = b + 3.3;
        b = b + 1;
        if(b > 290){
            b = 0;
            reset1+=291;
            reset2+=159;
        }
        float[] currentCircle1 = {x1+b*0.5,y1+h/2+shift+sShift,b*0.1};
        circleLocations1 = (float[][])append(circleLocations1,currentCircle1);

        if(y1+b*2+shift+sShift<y2+shift+sShift){
            float[] currentCircle2 = {x1+w/2, y1+b*2+shift+sShift, b*0.4};
            circleLocations2 = (float[][])append(circleLocations2,currentCircle2);
        }

        circlesLength2 = circleLocations2.length;
        for(int i=reset2; i<circlesLength2; i++){
            fill((8*(circleLocations1[i][0]-x1)+3.3) % 360,100,50,1);
            ellipse(circleLocations2[i][0], circleLocations2[i][1], circleLocations2[i][2],circleLocations2[i][2]);
        }
        circlesLength1 = circleLocations1.length;
        for(int i=reset1; i<circlesLength1; i++){
            fill((8*(circleLocations1[i][0]-x1)+3.3) % 360,100,50,1);
            ellipse(circleLocations1[i][0], circleLocations1[i][1], circleLocations1[i][2],circleLocations1[i][2]);
        }

        colorMode(RGB,255,255,255);

        int rate = 30; //the smaller the faster
        int fakeShift = sShift;

        if (keyPressed){
          if (keyPressed & keyCode == DOWN) fakeShift-=height/rate;
          if (keyPressed & keyCode == UP && fakeShift < -1) fakeShift+=height/rate;
          circlesLength1 = circleLocations1.length;
          for(int i=0;i<circlesLength1;i++){
              circleLocations1[i][1]+=(fakeShift-sShift);
          }

          circlesLength2 = circleLocations2.length;
          for(int i=0;i<circlesLength2;i++){
              circleLocations2[i][1]+=(fakeShift-sShift);
          }

        }
    }
}

class Exercise5{
    float x = 0;
    float y = 0;
    int reset = 0;
    float[][] circleLocations = {};
    void show(float x1, float y1, float x2, float y2, float shift){
        //Setup
        float w = x2-x1;
        float h = y2-y1;

        //Screen
        fill(0);
        noStroke();
        rect(x1,y1+shift+sShift,w,h);

        //Main
        colorMode(HSB, h/1.2,99,99);
        stroke(0,0,50);

        y+=h/85.7142857;
        x+=w/581.818182;

        float[] currentCircle = {x1+x,y+y1+shift+sShift,h/12};
        circleLocations = (float[][])append(circleLocations,currentCircle);
        int circlesLength = circleLocations.length;
        for(int i=reset; i<circlesLength; i++){
            fill((circleLocations[i][1]-y1-shift-sShift)+(circleLocations[i][0]-x1),99,99);
            ellipse(circleLocations[i][0], circleLocations[i][1], circleLocations[i][2],circleLocations[i][2]);
        }

        if(y>h){
          y=0;
          x-=w/64;
        }

        if(x > 160){
            y = 0;
            x = 0;
            reset+=657;
        }

        int rate = 30; //the smaller the faster
        int fakeShift = sShift;

        if (keyPressed){
          if (keyPressed & keyCode == DOWN) fakeShift-=height/rate;
          if (keyPressed & keyCode == UP && fakeShift < -1) fakeShift+=height/rate;
          circlesLength = circleLocations.length;
          for(int i=0;i<circlesLength;i++){
              circleLocations[i][1]+=(fakeShift-sShift);
          }

        }

        colorMode(RGB,255,255,255);
    }
}

class Exercise6{
    float xcircles = 0;
    float ycircles = 0;
    int i=0;
    int j=0;

    void show(float x1, float y1, float x2, float y2, float shift) {
        //Setup
        float w = x2-x1;
        float h = y2-y1;

        //Screen
        fill(255);
        noStroke();
        rect(x1,y1+shift+sShift,w,h);

        //Main
        colorMode(HSB, 255, 99, 99);

        if(mouseX<x2+20 && mouseY<y2+20+shift+sShift){
            xcircles = (mouseX-x1)*60/h;
            ycircles = (mouseY-y1-shift-sShift)*60/h;

            while(i<ycircles){
                while(j<xcircles){
                    fill((i*j*100) % 255,99,99);
                    ellipse(x1+(j*(h/60))+(h/120),y1+shift+sShift+(i*(h/60))+(h/120),(h/60),(h/60));
                    j++;
                }
                j = 0;
                i++;
            }
            i = 0;
        }
        colorMode(RGB, 255, 255, 255);
    }
}

void exercise7(float x1, float y1, float x2, float y2, float shift){
    //Setup
    float w = x2-x1;
    float h = y2-y1;

    //Screen
    fill(255);
    noStroke();
    rect(x1,y1+shift+sShift,w,h);

    //Main
    noStroke();
    colorMode(HSB, h/1.75, 100, 100);


    for (float i = w; i>0; i--) {
      fill (i, 100, 100);
      ellipse(x1+w/2, h/1.26+y1+shift+sShift, i/1.5, i/1.5);
    }

    stroke(h/630);
    for (float x = x1/32; x<w; x+=w/16) {
      for (float y = y1/63; y<h/1.75; y+=h/31.5) {
        fill(y % (h/1.75), 100, 100);
        ellipse(x+x1, y+y1+shift+sShift, w/16, w/16);
      }
    }

    colorMode(RGB, 255, 255, 255);
}
