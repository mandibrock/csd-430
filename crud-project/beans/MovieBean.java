/*
    Name: Amanda Brock
    Assignment: Modules 5 & 6 
    Purpose: Connects to the CSD430 database and retrieves movie data
    from the amandamoviesdata table.
*/

package beans;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;

public class MovieBean implements Serializable {

    private int movieId;
    private String title;
    private String genre;
    private int releaseYear;
    private String rating;
    private int runtime;

    // Database connection
    private final String url = "jdbc:mysql://localhost:3306/CSD430";
    private final String username = "student1";
    private final String password = "pass";

    public MovieBean() {
    }

    // Gets all movie IDs from database for menu
    public ArrayList<Integer> getMovieIds() {
        ArrayList<Integer> ids = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection =
                    DriverManager.getConnection(url, username, password);
            String sql =
                    "SELECT movie_id FROM amandamoviesdata ORDER BY movie_id";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                ids.add(resultSet.getInt("movie_id"));
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }

    // Gets one movie record using selected movie ID
    public boolean getMovieById(int id) {
        boolean found = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection =
                    DriverManager.getConnection(url, username, password);
            String sql =
                    "SELECT * FROM amandamoviesdata WHERE movie_id = ?";
            PreparedStatement statement =
                    connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                movieId = resultSet.getInt("movie_id");
                title = resultSet.getString("title");
                genre = resultSet.getString("genre");
                releaseYear = resultSet.getInt("release_year");
                rating = resultSet.getString("rating");
                runtime = resultSet.getInt("runtime");
                found = true;
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return found;
    }

    public int getMovieId() {
        return movieId;
    }

    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public String getRating() {
        return rating;
    }

    public int getRuntime() {
        return runtime;
    }
}