import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;

public class PartList {
  private TreeMap<Part, Integer> partsMap;
  
  public PartList() {
    partsMap = new TreeMap<Part, Integer>();
  }
  
  public PartList(String fileName) {
    String[] str = loadStrings(fileName);
    for(String s: str) {
      Part i = new Part(s);
    }
    
    try {
      Scanner scan = new Scanner(new File(fileName));
    }
    catch(IOException e) {
      out.println(e);
    }
    catch(RuntimeException e) {
      out.println(e);
    }
    catch(Exception e) {
      out.println(e);
    }
    finally {
      //keep null
    }
  }
  
  public String toString() {
    String output="";
    return output;
  }
}
