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

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom right, #d9edf2, #eef5e9);
            margin: 0;
            min-height: 100vh;
        }
        .container {
            width: 500px;
            margin: 80px auto;
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
            text-align: center;
        }
        h1 {
            color: #315c5b;
        }
        p {
            color: #555;
        }
        select {
            width: 100%;
            padding: 10px;
            margin: 15px 0 20px 0;
            font-size: 16px;
            border: 1px solid #b7c9c6;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #6f9189;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #587a73;
        }
        .back-link {
            display: block;
            width: fit-content;
            margin: 25px auto 0;
            padding: 10px 18px;
            background-color: #6f8f86;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .back-link:hover {
            background-color: #5d7c74;
        }
        .home-link {
            display: block;
            font-size: 12px;
            margin-top: 25px;
            text-align: center;
            color: #5d7c74;
            text-decoration: none;
        }
        .home-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

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