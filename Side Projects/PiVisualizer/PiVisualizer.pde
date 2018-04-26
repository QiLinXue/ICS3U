void settings(){
    size(1000,1000);
    //fullScreen();
}
void setup(){
    String[] raw = loadStrings("pi.txt");
    pi = raw[0];

    raw = loadStrings("e.txt");
    euler = String.join(",",raw);

    pixelArtSetup();
    nodeConnectionSetup();
}
int visualizerMode = 1;

void draw(){
    // switch(visualizerMode){
    //     case 1: pixelArt(); break;
    // }
    // pixelArt();
    nodeConnection();
}
