<%--
    Name: Amanda Brock
    Assignment: Modules 5 & 6 
    Purpose: Retrieves and displays the movie record selected 
    by the user.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    String movieIdValue = request.getParameter("movieId");
    int movieId = 0;
    boolean found = false;
    if (movieIdValue != null) {
        movieId = Integer.parseInt(movieIdValue);
        found = movieBean.getMovieById(movieId);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Details</title>
    <link rel="stylesheet" href="style.css">   
</head>

<body class="display-movie-page">
    <div class="container">
        <h1>Studio Ghibli Movie Database</h1>
        <p>
            The table below displays the database record for the
            selected movie ID.
        </p>

        <%
            if (found) {
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
            <p>No movie record was found.</p>
        <%
            }
        %>
        <a class="back-link" href="selectMovie.jsp">
            Select Another Movie
        </a>
        <a class="home-link" href="index.jsp">
            Back to Project Home
        </a>
    </div>

</body>
</html>