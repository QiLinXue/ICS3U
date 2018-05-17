void settings(){}
void draw(){}
import java.math.BigInteger;
import commons-math3-3.0;
//-----------------------------------------------
BigInteger sum;
void setup(){
    long startTime = System.nanoTime();
    sum = BigInteger.valueOf(10000000019L);
    //sum = sum.pow(10000000019);

    //sum=sum.add(BigInteger.valueOf(3));
    //println(probablePrime(3, Random 3));
    println(sum.nextProbablePrime());
    long endTime = System.nanoTime();
    long totalTime = endTime - startTime;
    println("total time in ms: " + totalTime/1000000);
    //for(long j=3L;j<100;j++) for(int i=0;i<5;i++) if(millerRabin(j)) println(j,"PRIME");
    //println(millerRabin(10000000019L));
    println("done");
}

boolean millerRabin(long n){
    long m = findK(n);
    long a = 2;
    //(long)floor(random(1,n-1));
    println(m);
    long b = (long)pow(a,m) % n;
    println(pow(a,n),n);
    println(b);
    if(b == 1 || b + 1 == n) return true;
    else{
        boolean composite = true;
        for(int i=0;i<10000;i++){
            b = (long)(pow(b,2) % n);
            if(b + 1 == n) return true;
            else if(b == 1) return false;
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
