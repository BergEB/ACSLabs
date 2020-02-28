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
  String[] sentences = loadStrings("spantoeng2.dat");
  for (String i: data) {
    translator.putEntry(i);
  }
  for (String x: sentences) {
    println(translator.translate(x));
  }
}

public class Translator {
  private Map<String,String> pairs;

  public Translator() {
    pairs = new TreeMap<String, String>();



  }

  public void putEntry(String entry) {
    String[] list = entry.split(" ");
    pairs.put(list[0], list[1]);

  }

  public String translate(String sent) {
    Scanner chop = new Scanner(sent);
    String output ="";
    while (chop.hasNext()) {
      output+= pairs.get(chop.next());
      output+= " ";
    }

    return output;
  }

  public String toString() {
    return pairs.toString().replaceAll("\\,","\n");
  }
}
