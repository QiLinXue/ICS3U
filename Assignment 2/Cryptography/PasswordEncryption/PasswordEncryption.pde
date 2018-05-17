void settings() {}
void draw() {}

import java.math.*;
import java.util.*;
import java.io.UnsupportedEncodingException;
import javax.xml.bind.DatatypeConverter;

void setup() {
  long starttime = System.nanoTime();

  //-----------------------------------------------
  //Different for each user salt created with UUID.randomUUID().toString()
  String password = "12345678";
  String salt1 = "21c47c8d-6c5c-489f-9330-0983741d34ef276dccbd-a640-4b77-a1b1-f1774acaa8b6";
  String salt2 = "b87da283-cb19-4bec-a4d6-cd87c3d96c557f587949-b76a-4899-9a45-6b0603c219c8";

  println(encryptedPassword(password,salt1,salt2));
  println((System.nanoTime()-starttime)/1000000);
}

BigInteger encryptedPassword(String pwInput, String salt1, String salt2){
    //-----------------------------------------------
    //Different for each user
    String saltCombination1 = pwInput+salt1;
    String saltCombination2 = salt2+pwInput;

    //-----------------------------------------------
    //Uses a simple encryption by converting it to base 10
    String saltEncryption1 = "";
    String saltEncryption2 = "";
    int salt1length = saltCombination1.length();
    int salt2length = saltCombination2.length();
    for(int i=0;i<salt1length;i++) saltEncryption1+=Integer.toString((int)saltCombination1.charAt(i));
    for(int i=0;i<salt2length;i++) saltEncryption2+=Integer.toString((int)saltCombination2.charAt(i));

    //-----------------------------------------------
    //Find nearest larger prime
    BigInteger prime1 = new BigInteger(saltEncryption1,10).nextProbablePrime();
    BigInteger prime2 = new BigInteger(saltEncryption2,10).nextProbablePrime();

    //-----------------------------------------------
    //Finds product of primes
    return prime1.multiply(prime2);
}
