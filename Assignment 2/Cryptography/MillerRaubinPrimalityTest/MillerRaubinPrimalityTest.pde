void settings(){}
void draw(){}

//-----------------------------------------------

void setup(){
    for(int i=0;i<20;i++) if(millerRabin(9223372036854775801L)) println("PRIME",i);
    println("done");
}

boolean millerRabin(long n){
    long m = findK(n);
    long a = (long)floor(random(1,n-1));
    long b = (long)(pow(2,m) % n);

    if(abs(b) == 1) return true;
    else{
        boolean composite = true;
        for(int i=0;i<50;i++){
            b = (long)(pow(b,2) % n);
            if(b + 1 == n) return true;
            if(b == 1) return false;
        }
    }
    return false;
}

long findK(long n){
    long largestEven = n-1;
    int logCounter = 0;

    while(largestEven % 2 == 0){
        largestEven /= 2;
        logCounter++;
    }

    return largestEven;
}
