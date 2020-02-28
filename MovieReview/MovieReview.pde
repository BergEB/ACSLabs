import java.util.List;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

MovieList m = new MovieList();

void setup(){
  String[] review = loadStrings("reviews.txt"); 
  String[] word = loadStrings("word.txt");
  List<Movie> movList = new ArrayList<Movie>();
  
  for(String s: review) {
    Scanner scan = new Scanner(s);
    movList.add(new Movie(scan.nextInt(),scan.nextLine()));
    scan.close();
  }
  
  m.loadMovies(review);
  m.getAverage();
  println(m.getAverage());
  println(m);
}

public class Movie implements Comparable<Movie> {
  private String review;
  private int rating;
  
  public Movie(int rating0, String review0) {
    rating = rating0;
    review = review0;
  }
  
  public int getRating() {
   return rating; 
  }
  
  public void setRatings(int rating1) {
   rating = rating1;
  }
  
  public int compareTo(Movie other) {
    if(this.rating < other.rating) {
      return -1;
    }
    if(this.rating > other.rating) { 
      return 1;
    }
    else {
      return 0;
    }
  }
  
  public String toString() {
    return "Rating: " + rating + "Review:" + review; 
  }
}
