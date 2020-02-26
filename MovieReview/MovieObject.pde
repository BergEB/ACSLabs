public class Movie implements Comparable {
  private String review;
  private int rating;
  
  Movie(int n, String str) {
    n = this.rating;
    str = this.review;
  }
  
  public int getRating() {
    return this.rating;
  }
  
  public String getReview() {
    return this.review;
  }
  
  public String toString() {
    return this.rating + ". " + this.review + "\n";
  }
}
