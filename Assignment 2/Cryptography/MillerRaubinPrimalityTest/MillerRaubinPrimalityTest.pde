void settings(){}
void draw(){}

//-----------------------------------------------

void setup(){
    for(int i=3;i<10000;i++) findKM(i);
    println("done");
}

int[] findKM(int n){
    int largestEven = n-1;
    int logCounter = 0;

    while(largestEven % 2 == 0){
        largestEven /= 2;
        logCounter++;
    }

    int[] arrayToReturn = {logCounter,largestEven};
    return arrayToReturn;
}
