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
            width: 850px;
            margin: 70px auto;
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
            text-align: center;
        }
        h1 {
            color: #315c5b;
        }
        .success {
            background-color: #dff0e5;
            color: #356447;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 25px;
        }
        .error {
            background-color: #f8dddd;
            color: #8b3333;
            padding: 10px;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            background-color: #6f9189;
            color: white;
            padding: 12px;
            border: 1px solid #587a73;
        }

        td {
            padding: 12px;
            border: 1px solid #c7d6d3;
        }
        tr:nth-child(even) {
            background-color: #f2f7f5;
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