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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Details</title>

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
            max-width: 900px;
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