<%--
    Name: Amanda Brock
    Assignment: CRUD Project
    Purpose: Provides navigation to the database project assignments
    completed for present and future modules.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD430 CRUD Project</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="index-page">
    <div class="container">
        <h1>CSD430 CRUD Project</h1>
        <p class="subtitle">
            Studio Ghibli Movie Database
        </p>
        <h2>Project Assignments</h2>
        <div class="assignment">
            <h3>READ - View Movie Record</h3>
            <p>
                Select a movie ID and display the corresponding
                record from the CSD430 movie database.
            </p>
            <a href="selectMovie.jsp">
                View Movie Database
            </a>
        </div>
        <div class="assignment">
            <h3>CREATE - Add Movie Record</h3>
            <p>
                Enter movie information to add a new record
                to the CSD430 movie database.
            </p>
            <a href="addMovie.jsp">
                Add New Movie
            </a>
        </div>
        <div class="assignment">
            <h3>UPDATE - Edit Movie Record</h3>
            <p>
                Select a movie ID and update the corresponding
                record in the CSD430 movie database.
            </p>
            <a href="selectUpdateMovie.jsp">
                Update Movie
            </a>
        </div>
        <div class="assignment">
            <h3>DELETE - Delete a Movie</h3>
            <p>
                Select a movie ID and delete the corresponding
                record in the CSD430 movie database.
            </p>
            <a href="deleteMovie.jsp">
                Delete Movie
            </a>
        </div>

    </div>

</body>
</html>