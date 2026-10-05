<%--
    Name: Amanda Brock
    Assignment: Module 7 
    Purpose: Displays all movie records currently stored in the database.
    (Thank you for the feedback!)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.MovieBean" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    boolean added = "true".equals(request.getParameter("added"));

    ArrayList<MovieBean> movies = movieBean.getAllMovies();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Records</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="display-movies-page">

    <div class="container">
        <h1>Studio Ghibli Movie Database</h1>
        <p class="description">
            The table below displays all movie records currently
            stored in the database.
        </p>
        <%
    if (added) {
        %>
            <p class="success">
                The new movie was added successfully.
            </p>
        <%
            }
        %>
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
                <%
                    for (MovieBean movie : movies) {
                %>
                    <tr>
                        <td><%= movie.getMovieId() %></td>
                        <td><%= movie.getTitle() %></td>
                        <td><%= movie.getGenre() %></td>
                        <td><%= movie.getReleaseYear() %></td>
                        <td><%= movie.getRating() %></td>
                        <td><%= movie.getRuntime() %> minutes</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a class="button-link" href="addMovie.jsp">
            Add Another Movie
        </a>
        <a class="home-link" href="index.jsp">
            Back to Project Home
        </a>
    </div>

</body>
</html>