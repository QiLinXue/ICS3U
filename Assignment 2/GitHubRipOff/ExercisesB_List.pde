class Exercise9{

    int size = 50;
    float[] xValues = new float[size];
    float[] yValues = new float[size];

    Exercise9(float x1, float y1, float x2, float y2, float shift){
        float w = x2-x1;
        float h = y2-y1;

        for(int i=0;i<size;i++){
            xValues[i] = random(0,w);
            yValues[i] = random(0,h);
        }
    }

    void show(float x1, float y1, float x2, float y2, float shift) {

        //Setup
        float w = x2-x1;
        float h = y2-y1;
        ellipseMode(CENTER);

        //Screen
        fill(255);
        stroke(10);
        rect(x1,y1+shift+sShift,w,h);

        //Actual Stuff
        for(int i=0;i<size;i++){
            if(yValues[i]>h/2) line(x1+xValues[i],y1+yValues[i]+shift+sShift,x1+xValues[i],y1+h+shift+sShift);
            else line(x1+xValues[i],y1+yValues[i]+shift+sShift,x1+xValues[i],y1+shift+sShift);
        }

    }
}

void exercise10(String sentence){
    int capitalLettersCount = 0;
    int vowelCount = 0;
    int letterCount = 0;
    int words = 0;
    int punctuationCount = 0;
    int mostFrequentLetterFrequency = 0;
    int hFreq = 0;
    int[] frequency = new int[26];
    letterCount = sentence.length();
    for(int i=0;i<letterCount;i++){
        char c = sentence.charAt(i); if(Character.isUpperCase(c)) capitalLettersCount++;
        if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' ||
           c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') vowelCount++;
        else if(c == ' ') words++;
        else if(c == '\'' || c == ':' || c == ';' || c == ',' || c == '.' || c == '!' || c == '?') punctuationCount++;
        if(Character.isLetter(c)) frequency[((c > 90) ? c-97 : c-65)]++;
    }
    for(int i=0;i<26;i++){
        if(frequency[i] > mostFrequentLetterFrequency){
            mostFrequentLetterFrequency = frequency[i];
            hFreq = i;
        }
    }

    println("You're sentence is \" " + sentence + " \"");
    println("Most frequent letter: " + (char)(hFreq+65) + " : " + mostFrequentLetterFrequency);
    println("# Capital Letters: " + capitalLettersCount);
    println("# Vowels: " + vowelCount);
    println("# Words: " + (words+1));
    println("# Letters: " + letterCount);
    println("# Punctuations: " + punctuationCount);
}

class Exercise10{

    void activate(){}
}
