<%--
    Name: Amanda Brock
    Assignment: Modules 5 & 6 
    Purpose: Displays a dropdown containing the primary key values
    from the movie database and allows the user to select
    a movie record to view.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    ArrayList<Integer> movieIds = movieBean.getMovieIds();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select a Movie</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="select-movie-page">
    <div class="container">
        <h1>Studio Ghibli Movie Database</h1>
        <p>
            Select a movie ID from the dropdown menu to view
            the information stored for that movie.
        </p>
        <form action="displayMovie.jsp" method="get">
            <label for="movieId">Movie ID:</label>
            <select id="movieId" name="movieId">
                <%
                    for (Integer id : movieIds) {
                %>
                        <option value="<%= id %>"><%= id %></option>
                <%
                    }
                %>
            </select>
            <button type="submit">View Movie</button>
        </form>
        <a class="home-link" href="index.jsp">
            Back to Project Home
        </a>
    </div>
</body>
</html>