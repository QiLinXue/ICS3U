void settings(){
    size(1000,1000);
    //fullScreen();
}
void setup(){
    pixelArtSetup();
}
int visualizerMode = 1;

void draw(){
    switch(visualizerMode){
        case 1: pixelArt(); break;
    }
    pixelArt();
}
