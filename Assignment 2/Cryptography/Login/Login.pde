String inputUsername = "bob";
String inputPW = "abc";

String currentUser = "";

Table userDatabase;
void setup(){
    userDatabase = loadTable("users.csv", "header"); //Initialize name table
    println(inputPW.equals(userDatabase.getString(userDatabase.findRowIndex(inputUsername,"Username"),"Password")));
}
