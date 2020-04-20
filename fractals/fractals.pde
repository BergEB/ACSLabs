import java.util.*;

float fractionLength = 0.6;
int index = 1;
ArrayList<Branch> branches = new ArrayList<Branch>();


public void setup() {   
  size(1000,600, P2D);
  smooth(8);
  branches.add(new Branch(((float)width/2.0),((float)height*0.8),(float)height*0.25,(float)-PI/2.0));
}

public void draw() {
  background(0);   
  stroke(255);
  index = 0;
  line((float)width/2.0,(float)height,(float)width/2.0,(float)height*0.8);
  test();
  //branches.get(0).drawBranch(3);
  //println("Objects in Array: " + branches.size() + "\tindex: " + index);
  String txt_fps = String.format(getClass().getName()+ "  |  Bengt_");
  surface.setTitle(txt_fps);
}

void test() {
  try {
  branches.get(0).drawBranch(3);
  } catch (StackOverflowError e) {
    //saveFrame("line-######.png");
    println("Pretty Cool, huh?");
    //noLoop();
    exit();
    //throw e;
  }
}

void mousePressed() {
}

class Branch {
  
  boolean iteration_1;
  boolean iteration_2;
  boolean iteration_3;
  int iteratorLimit;
  
  float branchAngle;
  float angle1;
  float angle2;
  float angle3;
  
  float milis1, milis2, milis3;
  boolean timerStarted1, timerStarted2, timerStarted3;
  
  float x;
  float y;
  float branchLength;
  float angle;
  
  private float endX1;
  private float endY1;
  private float endX2;
  private float endY2;
  private float endX3;
  private float endY3;
  
  private float tempEndX1;
  private float tempEndY1;
  private float tempEndX2;
  private float tempEndY2;
  private float tempEndX3;
  private float tempEndY3;
  
  Branch(float x,float y, float branchLength, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;

    this.branchAngle = (float)(Math.random() / 2) + 0.4;
    
    angle1 = angle + branchAngle;
    angle2 = angle - branchAngle;
    angle3 = angle;
  
    this.branchLength = branchLength * 0.6;
  
    endX1 = (int)(branchLength*Math.cos(angle1) + x);
    endY1 = (int)(branchLength*Math.sin(angle1) + y);
    endX2 = (int)(branchLength*Math.cos(angle2) + x);
    endY2 = (int)(branchLength*Math.sin(angle2) + y);
    endX3 = (int)(branchLength*Math.cos(angle3) + x);
    endY3 = (int)(branchLength*Math.sin(angle3) + y);
  
    tempEndX1 = x;
    tempEndY1 = y;
    tempEndX2 = x;
    tempEndY2 = y;
    tempEndX3 = x;
    tempEndY3 = y;
  }
  
  void drawBranch(int iteratorLimit) {
    //if (iteratorLimit < 1) {
    //  //println("iteratorLimit < 1");
    //  return;
    //} else if (iteratorLimit >= 1) {
    stroke(255);
    fill(255);
    if (endX1 != tempEndX1 && endY1 != tempEndY1) {
      if (!timerStarted1) {
        milis1 = millis();
        timerStarted1 = true;
      }
      if (timerStarted1 && millis() - milis1 > 1000) {
        endX1 = tempEndX1;
        endY1 = tempEndY1;
      } else {
        tempEndX1+= (endX1 - x) / frameRate;
        tempEndY1+= (endY1 - y) / frameRate;
      }
      line(x, y, tempEndX1, tempEndY1);
    } else {
      endX1 = tempEndX1;
      endY1 = tempEndY1;
      line(x, y, endX1, endY1);
      if (iteration_1) {
        index++;
        try {
        branches.get(index).drawBranch(iteratorLimit);
        } catch (IndexOutOfBoundsException e) {
          throw e;
        }
        //index++;
      } else if (!iteration_1) {
        iteration_1 = true;
        branches.add(new Branch(endX1, endY1, branchLength, angle1));
      }
    }
  
  
    if (endX2 != tempEndX2 && endY2 != tempEndY2) {
      if (!timerStarted2) {
        milis2 = millis();
        timerStarted2 = true;
      }
      if (timerStarted2 && millis() - milis2 > 1000) {
        endX2 = tempEndX2;
        endY2 = tempEndY2;
      } else {
        tempEndX2+= (endX2 - x) / frameRate;
        tempEndY2+= (endY2 - y) / frameRate;
      }
      line(x, y, tempEndX2, tempEndY2);
    } else {
      endX2 = tempEndX2;
      endY2 = tempEndY2;
      line(x, y, endX2, endY2);
      if (iteration_2) {
        index++;
        try {
        branches.get(index).drawBranch(iteratorLimit);
        } catch (IndexOutOfBoundsException e) {
          throw e;
        }
        //index++;
      } else if (!iteration_2) {
        iteration_2 = true;
        branches.add(new Branch(endX2, endY2, branchLength, angle2));
      }
    }
    
    
    if (endX3 != tempEndX3 && endY3 != tempEndY3) {
      if (!timerStarted3) {
        milis3 = millis();
        timerStarted3 = true;
      }
      if (timerStarted3 && millis() - milis3 > 1000) {
        endX3 = tempEndX3;
        endY3 = tempEndY3;
      } else {
        tempEndX3+= (endX3 - x) / frameRate;
        tempEndY3+= (endY3 - y) / frameRate;
      }
      line(x, y, tempEndX3, tempEndY3);
    } else {
      endX3 = tempEndX3;
      endY3 = tempEndY3;
      line(x, y, endX3, endY3);
      if (iteration_3) {
        index++;
        try {
        branches.get(index).drawBranch(iteratorLimit);
        } catch (IndexOutOfBoundsException e) {
          throw e;
        }
        //index++;
      } else if (!iteration_3) {
        iteration_3 = true;
        branches.add(new Branch(endX3, endY3, branchLength, angle3));
      }
    }
    //println("tempEndX1: " + tempEndX1 + "\t" + "tempEndX2: " + tempEndX2 + "\t" + "tempEndX3: " + tempEndX3);
    //println("tempEndY1: " + tempEndY1 + "\t" + "tempEndY2: " + tempEndY2 + "\t" + "tempEndY3: " + tempEndY3);
    //println("branchLength: " + branchLength);
    //println("iteratorLimit: " + iteratorLimit);
    //}
  }
}
