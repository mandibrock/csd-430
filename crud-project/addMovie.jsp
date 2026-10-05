<%--
    Name: Amanda Brock
    Assignment: Module 7 
    Purpose: Provides a form for adding a new movie record
    to the CSD430 movie database.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="beans.MovieBean" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    String errorMessage = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String releaseYearValue = request.getParameter("releaseYear");
        String rating = request.getParameter("rating");
        String runtimeValue = request.getParameter("runtime");

        if (title == null || title.trim().isEmpty() ||
            genre == null || genre.trim().isEmpty() ||
            releaseYearValue == null || releaseYearValue.trim().isEmpty() ||
            rating == null || rating.trim().isEmpty() ||
            runtimeValue == null || runtimeValue.trim().isEmpty()) {

            errorMessage = "Please complete all movie fields.";

        } else {
            try {
                int releaseYear = Integer.parseInt(releaseYearValue);
                int runtime = Integer.parseInt(runtimeValue);

                boolean added = movieBean.addMovie(
                    title.trim(),
                    genre,
                    releaseYear,
                    rating,
                    runtime
                );

                if (added) {
                    response.sendRedirect("displayMovies.jsp?added=true");
                    return;
                } else {
                    errorMessage = "The movie could not be added.";
                }

            } catch (NumberFormatException e) {
                errorMessage =
                    "Release year and runtime must be valid numbers.";
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add a Movie</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="add-movie-page">

    <div class="container">
        <h1>Add a Movie</h1>
        <%
            if (!errorMessage.isEmpty()) {
        %>
            <p class="error"><%= errorMessage %></p>
        <%
            }
        %>
        <p class="description">
            Enter the movie information below to add a new record
            to the Studio Ghibli movie database.
        </p>

        <form action="addMovie.jsp" method="post">
            <div class="form-group">
                <label for="title">Movie Title:</label>
                <input type="text"
                       id="title"
                       name="title"
                       required>
            </div>
            <div class="form-group">
                <label for="genre">Genre:</label>
                <select id="genre" name="genre" required>
                    <option value="">Select a genre</option>
                    <option value="Action">Action</option>
                    <option value="Adventure">Adventure</option>
                    <option value="Comedy">Comedy</option>
                    <option value="Drama">Drama</option>
                    <option value="Fantasy">Fantasy</option>
                    <option value="Romance">Romance</option>
                    <option value="Science Fiction">Science Fiction</option>
                </select>
            </div>
            <div class="form-group">
                <label for="releaseYear">Release Year:</label>
                <input type="number"
                       id="releaseYear"
                       name="releaseYear"
                       required>
            </div>
            <div class="form-group">
                <label for="rating">Rating:</label>
                <select id="rating" name="rating" required>
                    <option value="">Select a rating</option>
                    <option value="G">G</option>
                    <option value="PG">PG</option>
                    <option value="PG-13">PG-13</option>
                    <option value="R">R</option>
                </select>
            </div>
            <div class="form-group">
                <label for="runtime">Runtime (minutes):</label>
                <input type="number"
                       id="runtime"
                       name="runtime"
                       required>
            </div>
            <button type="submit">
                Add Movie
            </button>

        </form>

        <a class="home-link" href="index.jsp">
            Back to Project Home
        </a>

    </div>

</body>
</html>