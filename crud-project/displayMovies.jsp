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

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 40px;
            min-height: 100vh;
            background:
                linear-gradient(
                    to bottom,
                    #d8ecf3 0%,
                    #eaf5f1 55%,
                    #dfead3 100%
                );
        }
        .container {
            max-width: 1000px;
            margin: 50px auto 0;
            background-color: rgba(255, 255, 255, 0.92);
            padding: 35px;
            border-radius: 14px;
            box-shadow:
                0 8px 20px rgba(70, 90, 80, 0.18);
        }
        h1 {
            text-align: center;
            margin-bottom: 10px;
            color: #3f5f5a;
        }
        .description {
            text-align: center;
            color: #5f6f68;
            line-height: 1.5;
        }
        .success {
            text-align: center;
            color: #3f6f58;
            font-weight: bold;
            margin-top: 20px;
        }
        .error {
            text-align: center;
            color: #8a4f4f;
            font-weight: bold;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background-color: white;
        }
        th,
        td {
            border: 1px solid #b8c8c2;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #dbe8e3;
            color: #3f5f5a;
        }
        .button-link {
            display: block;
            width: fit-content;
            margin: 25px auto 0;
            padding: 10px 18px;
            background-color: #6f8f86;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .button-link:hover {
            background-color: #5d7c74;
        }
        .home-link {
            display: block;
            margin-top: 12px;
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