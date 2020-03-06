import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;

public class PartList {
  private TreeMap<Part, Integer> partsMap;
  
  public PartList(String fileName) {
    partsMap = new TreeMap<Part, Integer>();
    String[] str = loadStrings(fileName);
    for(String s: str) {
      Part i = new Part(s);
      if (partsMap.get(i) == null) {
        partsMap.put(i, 1);
      } else {
        partsMap.put(i, partsMap.get(i) + 1);
      }
    }
  }
  
  public String toString() {
    String output="";
    for(Part p: partsMap.keySet()) {
      output+= p + "- " + partsMap.get(p) + "\n";
    }
    return output;
  }
}
