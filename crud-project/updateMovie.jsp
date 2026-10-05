<%--
    Name: Amanda Brock
    Assignment: Module 8
    Purpose: Displays the selected movie record and allows the user
    to update all fields except the movie ID.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="beans.MovieBean" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    String errorMessage = "";
    String movieIdValue = request.getParameter("movieId");
    boolean movieFound = false;
    if (movieIdValue != null && !movieIdValue.trim().isEmpty()) {
        try {
            int movieId = Integer.parseInt(movieIdValue);
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String title = request.getParameter("title");
                String genre = request.getParameter("genre");
                String releaseYearValue =
                        request.getParameter("releaseYear");
                String rating = request.getParameter("rating");
                String runtimeValue =
                        request.getParameter("runtime");
                if (title == null || title.trim().isEmpty() ||
                    genre == null || genre.trim().isEmpty() ||
                    releaseYearValue == null ||
                    releaseYearValue.trim().isEmpty() ||
                    rating == null || rating.trim().isEmpty() ||
                    runtimeValue == null ||
                    runtimeValue.trim().isEmpty()) {
                    errorMessage = "Please complete all movie fields.";
                    movieFound = movieBean.getMovieById(movieId);

                } else {
                    try {
                        int releaseYear =
                                Integer.parseInt(releaseYearValue);
                        int runtime =
                                Integer.parseInt(runtimeValue);
                        boolean updated = movieBean.updateMovie(
                                movieId,
                                title.trim(),
                                genre,
                                releaseYear,
                                rating,
                                runtime
                        );
                        if (updated) {
                            response.sendRedirect(
                                "displayUpdateMovie.jsp?movieId="
                                + movieId
                            );
                            return;
                        } else {
                            errorMessage =
                                "The movie could not be updated.";
                            movieFound =
                                movieBean.getMovieById(movieId);
                        }
                    } catch (NumberFormatException e) {
                        errorMessage =
                            "Release year and runtime must be valid numbers.";
                        movieFound =
                            movieBean.getMovieById(movieId);
                    }
                }
            } else {
                movieFound = movieBean.getMovieById(movieId);
            }
        } catch (NumberFormatException e) {
            errorMessage = "Invalid Movie ID.";
        }
    } else {
        errorMessage = "No Movie ID was selected.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Movie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="update-movie-page">

<div class="container">

    <h1>Update Movie</h1>
    <%
        if (!errorMessage.isEmpty()) {
    %>
    <p class="error"><%= errorMessage %></p>

    <%
        }
        if (movieFound) {
    %>

    <form action="updateMovie.jsp" method="post">
        <input type="hidden"
               name="movieId"
               value="<%= movieBean.getMovieId() %>">
        <div class="field">
            <label>Movie ID</label>
            <div class="movie-id">
                <%= movieBean.getMovieId() %>
            </div>
        </div>
        <div class="field">
            <label for="title">Title</label>
            <input type="text"
                   id="title"
                   name="title"
                   value="<%= movieBean.getTitle() %>"
                   required>
        </div>
        <div class="field">
            <label for="genre">Genre</label>
            <input type="text"
                   id="genre"
                   name="genre"
                   value="<%= movieBean.getGenre() %>"
                   required>
        </div>
        <div class="field">
            <label for="releaseYear">Release Year</label>
            <input type="number"
                   id="releaseYear"
                   name="releaseYear"
                   value="<%= movieBean.getReleaseYear() %>"
                   required>
        </div>
        <div class="field">
            <label for="rating">Rating</label>
            <input type="text"
                   id="rating"
                   name="rating"
                   value="<%= movieBean.getRating() %>"
                   required>
        </div>
        <div class="field">
            <label for="runtime">Runtime (minutes)</label>
            <input type="number"
                   id="runtime"
                   name="runtime"
                   value="<%= movieBean.getRuntime() %>"
                   required>
        </div>
        <div class="button-area">
            <input type="submit" value="Update Movie">
        </div>
    </form>

    <%
        }
    %>
    <br>
    <a class="home-link"
       href="selectUpdateMovie.jsp">
        Back to Movie Selection
    </a>
</div>

</body>
</html>