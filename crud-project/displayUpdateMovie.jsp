<%--
    Name: Amanda Brock
    Assignment: Module 8
    Purpose: Displays the updated movie record after a successful
    database update.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="beans.MovieBean" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    String movieIdValue = request.getParameter("movieId");
    boolean movieFound = false;
    if (movieIdValue != null && !movieIdValue.trim().isEmpty()) {
        try {
            int movieId = Integer.parseInt(movieIdValue);
            movieFound = movieBean.getMovieById(movieId);
        } catch (NumberFormatException e) {
            movieFound = false;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Updated Movie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="display-update-movie-page">

<div class="container">
    <h1>Updated Movie Record</h1>
    <%
        if (movieFound) {
    %>
    <p class="success">
        The movie was updated successfully.
    </p>
    <table>
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Title</th>
                <th>Genre</th>
                <th>Release Year</th>
                <th>Rating</th>
                <th>Runtime</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= movieBean.getMovieId() %></td>
                <td><%= movieBean.getTitle() %></td>
                <td><%= movieBean.getGenre() %></td>
                <td><%= movieBean.getReleaseYear() %></td>
                <td><%= movieBean.getRating() %></td>
                <td><%= movieBean.getRuntime() %> minutes</td>
            </tr>
        </tbody>
    </table>

    <%
        } else {
    %>
    <p class="error">
        The updated movie record could not be found.
    </p>
    <%
        }
    %>

    <a class="back-link" href="selectUpdateMovie.jsp">
        Update Another Movie
    </a>

    <a class="home-link" href="index.jsp">
        Back to Project Home
    </a>
</div>

</body>
</html>