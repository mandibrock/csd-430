package beans;
import java.io.Serializable;

// Name: Amanda Brock
// Assignment: Module 4
// Purpose: Stores information about an EDM festival experience.
//          The bean implements Serializable so its data can be stored
//          or transferred when needed.

public class FestivalBean implements Serializable {

    private static final long serialVersionUID = 1L;

    // Festival data fields
    private String festivalName;
    private int year;
    private String favoriteStage;
    private String favoriteActivity;
    private String favoriteDJ;
    private int rating;
    private String comments;

    public FestivalBean() {
    }

    public String getFestivalName() {
        return festivalName;
    }

    public void setFestivalName(String festivalName) {
        this.festivalName = festivalName;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getFavoriteStage() {
        return favoriteStage;
    }

    public void setFavoriteStage(String favoriteStage) {
        this.favoriteStage = favoriteStage;
    }

    public String getFavoriteActivity() {
        return favoriteActivity;
    }

    public void setFavoriteActivity(String favoriteActivity) {
        this.favoriteActivity = favoriteActivity;
    }

    public String getFavoriteDJ() {
        return favoriteDJ;
    }

    public void setFavoriteDJ(String favoriteDJ) {
        this.favoriteDJ = favoriteDJ;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}