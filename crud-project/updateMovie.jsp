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

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(
                to bottom right,
                #d9edf2,
                #eef5e9
            );
            margin: 0;
            min-height: 100vh;
        }
        .container {
            width: 550px;
            margin: 60px auto;
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
        }
        h1 {
            text-align: center;
            color: #315c5b;
        }
        .field {
            margin-bottom: 18px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #315c5b;
        }
        input,
        select {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #b7c9c6;
            border-radius: 5px;
            font-size: 15px;
        }
        .movie-id {
            background-color: #eeeeee;
            color: #555;
            padding: 10px;
            border-radius: 5px;
        }
        .button-area {
            text-align: center;
            margin-top: 25px;
        }
        input[type="submit"] {
            width: auto;
            background-color: #6f9189;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #587a73;
        }
        .error {
            background-color: #f8dddd;
            color: #8b3333;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 20px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #557b78;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

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

    <a class="back-link"
       href="selectUpdateMovie.jsp">
        Back to Movie Selection
    </a>
</div>

</body>
</html>