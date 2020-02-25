//© A+ Computer Science  -  www.apluscompsci.com
//Name -
//Date -
//Class -  
//Lab  -

import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import java.io.File;
import java.io.IOException;
import static java.lang.System.*;



Translator translator;

void setup() { 
  translator = new Translator();
  String[] data = loadStrings("spantoeng.dat");
  for (String i: data) {
    translator.putEntry(i);
  }
}

public class Translator {
  private Map<String,String> pairs;

  public Translator() {



  }

  public void putEntry(String entry) {
    String[] list = entry.split(" ");
    pairs = new TreeMap<String, String>();
    




  }

  public String translate(String sent) {
    Scanner chop = new Scanner(sent);
    String output ="";






    return output;
  }

  public String toString() {
    return pairs.toString().replaceAll("\\,","\n");
  }
}
