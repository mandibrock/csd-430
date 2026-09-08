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
            max-width: 700px;
            margin: 80px auto 0;
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
        p {
            text-align: center;
            color: #5f6f68;
            line-height: 1.5;
        }
        form {
            margin-top: 30px;
            text-align: center;
        }
        label {
            font-weight: bold;
            color: #465c56;
            margin-right: 10px;
        }
        select {
            padding: 9px 14px;
            font-size: 16px;
            border: 1px solid #aabbb5;
            border-radius: 6px;
            background-color: #ffffff;
        }
        button {
            padding: 10px 18px;
            margin-left: 10px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            background-color: #6f8f86;
            color: white;
            cursor: pointer;
        }
        button:hover {
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