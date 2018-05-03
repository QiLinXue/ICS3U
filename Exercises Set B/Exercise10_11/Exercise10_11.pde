//Takes 200 ms to run entire program. Takes 100 ms to run analysis (not including extracting from txt file)
int capitalLettersCount, vowelCount, letterCount, words, punctuationCount, mostFrequentLetterFrequency, hFreq;
int[] frequency = new int[26];
void setup() {
    String sentence = String.join(",",loadStrings("bible.txt"));
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
    println("Most frequent letter: " + (char)(hFreq+65) + " : " + mostFrequentLetterFrequency);
    println("# Capital Letters: " + capitalLettersCount);
    println("# Vowels: " + vowelCount);
    println("# Words: " + (words+1));
    println("# Letters: " + letterCount);
    println("# Punctuations: " + punctuationCount);
}
void settings() {}
void draw() {noLoop();}
