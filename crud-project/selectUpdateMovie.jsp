<%--
    Name: Amanda Brock
    Assignment: Module 8
    Purpose: Allows the user to select a movie record to update
    using the movie ID stored in the database.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.MovieBean" %>

<jsp:useBean id="movieBean" class="beans.MovieBean" scope="page" />

<%
    ArrayList<Integer> movieIds = movieBean.getMovieIds();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Movie to Update</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="select-update-movie-page">

<div class="container">
    <h1>Update a Movie</h1>
    <p>Select the Movie ID for the record you would like to update.</p>
    <form action="updateMovie.jsp" method="get">
        <label for="movieId">Movie ID:</label>
        <select id="movieId" name="movieId" required>
            <option value="">-- Select a Movie ID --</option>
            <%
                for (Integer id : movieIds) {
            %>
            <option value="<%= id %>"><%= id %></option>
            <%
                }
            %>
        </select>
        <input type="submit" value="Select Movie">
    </form>

    <a class="home-link" href="index.jsp">
        Back to Project Home
    </a>

</div>
</body>
</html>