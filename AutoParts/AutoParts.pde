import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;
PartList prog;


void setup() {
  prog = new PartList("partinfo.dat");
  out.println(prog);
}

public class Part implements Comparable<Part> {
  private String make, model, theRest;
  private int year;

  public Part(String line) {
    String[] list = line.split(" ");
    make = list[list.length - 3];
    model = list[list.length - 2];
    year = Integer.parseInt(list[list.length - 1]);
    for(int i = 0; i < list.length - 3; i++) {
      theRest+= list[i];
    }
  }

  public int compareTo(Part other) {
    if(this.make.compareTo(other.make) > 0) {
    } else if (this.make.compareTo(other.make) < 0) {
      return -1;
    }
    if (this.model.compareTo(other.model) > 0) {
    } else if (this.model.compareTo(other.model) < 0) {
      return -1;
    }
    if (this.theRest.compareTo(other.theRest) > 0) {
      return -1;
    } else if (this.theRest.compareTo(other.theRest) < 0) {
      return -1;
    }
    return 0;
  }

  public String toString() {
    return make + " " + model + " " + year + " " + theRest;
  }
}
