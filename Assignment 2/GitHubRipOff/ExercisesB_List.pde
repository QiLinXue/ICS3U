class Exercise9 {

  int size = 50;
  float[] xValues = new float[size];
  float[] yValues = new float[size];

  Exercise9(float x1, float y1, float x2, float y2, float shift) {
    float w = x2-x1;
    float h = y2-y1;

    for (int i=0; i<size; i++) {
      xValues[i] = random(0, w);
      yValues[i] = random(0, h);
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
    rect(x1, y1+shift+sShift, w, h);

    //Actual Stuff
    for (int i=0; i<size; i++) {
      if (yValues[i]>h/2) line(x1+xValues[i], y1+yValues[i]+shift+sShift, x1+xValues[i], y1+h+shift+sShift);
      else line(x1+xValues[i], y1+yValues[i]+shift+sShift, x1+xValues[i], y1+shift+sShift);
    }
  }
}

void exercise10(String sentence) {
  int capitalLettersCount = 0;
  int vowelCount = 0;
  int letterCount = 0;
  int words = 0;
  int punctuationCount = 0;
  int mostFrequentLetterFrequency = 0;
  int hFreq = 0;
  int[] frequency = new int[26];
  letterCount = sentence.length();
  for (int i=0; i<letterCount; i++) {
    char c = sentence.charAt(i);
    if (Character.isUpperCase(c)) capitalLettersCount++;
    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' ||
      c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') vowelCount++;
    else if (c == ' ') words++;
    else if (c == '\'' || c == ':' || c == ';' || c == ',' || c == '.' || c == '!' || c == '?') punctuationCount++;
    if (Character.isLetter(c)) frequency[((c > 90) ? c-97 : c-65)]++;
  }
  for (int i=0; i<26; i++) {
    if (frequency[i] > mostFrequentLetterFrequency) {
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

class TextAnalyzer {

  int capitalLettersCount = 0;
  int vowelCount = 0;
  int letterCount = 0;
  int words = 0;
  int punctuationCount = 0;
  int mostFrequentLetterFrequency = 0;
  int hFreq = 0;
  int[] frequency = new int[26];

  TextAnalyzer() {
    int capitalLettersCount = 0;
    int vowelCount = 0;
    int letterCount = 0;
    int words = 0;
    int punctuationCount = 0;
    int mostFrequentLetterFrequency = 0;
    int hFreq = 0;
    int[] frequency = new int[26];
  }

  void analyzeSameString(String sentence) {
    println("You're sentence is \" " + sentence + " \"");
    capitalLetterCount(sentence);
    vowelCount(sentence);
    wordCount(sentence);
    charCount(sentence);
    punctuationCount(sentence);
    mostCommonLetter(sentence);
  }

  void analyzePoetries() {
    //String s1 = String.join(",", loadStrings("othello.txt");
    //String s2 = String.join(",", loadStrings("illiad.txt");
    //String s3 = String.join(",", loadStrings("romeoAndJuliet.txt");
    //String s4 = String.join(",", loadStrings("theOdyssey.txt");
    //String s5 = String.join(",", loadStrings("hamlet.txt");
    //String s6 = String.join(",", loadStrings("macbeth.txt");
    String s1 = "a23f0238r y9f8cg9fg8";
    String s2 = "a23f0238r y9f8cg9fg8";
    String s3 = "a23f0238r y9f8cg9fg8";
    String s4 = "a23f0238r y9f8cg9fg8";
    String s5 = "a23f0238r y9f8cg9fg8";
    String s6 = "a23f0238r y9f8cg9fg8";

    print("For Othello: "); charCount(s1);
    print("For Illiad: "); capitalLetterCount(s2);
    print("For Romeo and Juliet: "); vowelCount(s3);
    print("For The Odyssey: "); wordCount(s4);
    print("For Hamlet: "); punctuationCount(s5);
    print("For Macbeth: "); mostCommonLetter(s6);
  }
  void capitalLetterCount(String sentence) {
    letterCount = sentence.length();
    for (int i=0; i<letterCount; i++) {
      char c = sentence.charAt(i);
      if (Character.isUpperCase(c)) capitalLettersCount++;
    }
    println("# Capital Letters: " + capitalLettersCount);
  }

  void vowelCount(String sentence) {
    letterCount = sentence.length();
    for (int i=0; i<letterCount; i++) {
      char c = sentence.charAt(i);
      if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' ||
        c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') vowelCount++;
    }
    println("# Vowels: " + vowelCount);
  }

  void wordCount(String sentence) {
    letterCount = sentence.length();
    for (int i=0; i<letterCount; i++) {
      char c = sentence.charAt(i);
      if (c == ' ') words++;
    }
    println("# Words: " + (words+1));
  }

  void charCount(String sentence) {
    letterCount = sentence.length();
    println("# Letters: " + letterCount);
  }

  void punctuationCount(String sentence) {
    letterCount = sentence.length();
    for (int i=0; i<letterCount; i++) {
      char c = sentence.charAt(i);
      if (c == '\'' || c == ':' || c == ';' || c == ',' || c == '.' || c == '!' || c == '?') punctuationCount++;
    }
    println("# Punctuations: " + punctuationCount);
  }

  void mostCommonLetter(String sentence) {
    letterCount = sentence.length();
    for (int i=0; i<letterCount; i++) {
      char c = sentence.charAt(i);
      if (Character.isLetter(c)) frequency[((c > 90) ? c-97 : c-65)]++;
    }

    for (int i=0; i<26; i++) {
      if (frequency[i] > mostFrequentLetterFrequency) {
        mostFrequentLetterFrequency = frequency[i];
        hFreq = i;
      }
    }

    println("Most frequent letter: " + (char)(hFreq+65) + " : " + mostFrequentLetterFrequency);
  }
}
