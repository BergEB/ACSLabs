import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;


void setup() {
  PartList prog = new PartList("partinfo.dat");
  println(prog);
}

public class Part implements Comparable<Part> {
  private String make, model, theRest;
  private int year;

  public Part(String line) {
    theRest = "";
    String[] list = line.split(" ");
    year = parseInt(list[list.length - 1]);
    model = list[list.length - 2];
    make = list[list.length - 3];
    if (list.length == 6) {
      for(int i = 0; i < 3; i++) {
        theRest+= list[i] + " ";
      }
    } else {
      for(int i = 0; i < 2; i++) {
        theRest+= list[i] + " ";
      }
    }
  }

  public int compareTo(Part other) {
    if(this.make.compareTo(other.make) > 0) {
      return 1;
    }
    if (this.make.compareTo(other.make) < 0) {
      return -1;
    }
    if (this.model.compareTo(other.model) > 0) {
      return 1;
    }
    if (this.model.compareTo(other.model) < 0) {
      return -1;
    }
    if (year > other.year) {
      return 1;
    }
    if (year < other.year) {
      return -1;
    }
    return theRest.compareTo(other.theRest);
  }

  public String toString() {
    return make + " " + model + " " + year + "  " + theRest;
  }
}
