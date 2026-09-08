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
            max-width: 750px;
            margin: 60px auto 0;
            background-color: rgba(255, 255, 255, 0.92);
            padding: 35px;
            border-radius: 14px;
            box-shadow:
                0 8px 20px rgba(70, 90, 80, 0.18);
        }
        h1 {
            text-align: center;
            margin-bottom: 8px;
            color: #3f5f5a;
        }
        .subtitle {
            text-align: center;
            color: #5f6f68;
            margin-bottom: 35px;
        }
        h2 {
            color: #465c56;
            border-bottom: 1px solid #c9d8d2;
            padding-bottom: 8px;
        }
        .assignment {
            background-color: #f7faf8;
            border: 1px solid #d4e0dc;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
        }
        .assignment h3 {
            color: #3f5f5a;
            margin-top: 0;
        }
        .assignment p {
            color: #5f6f68;
            line-height: 1.5;
        }
        .assignment a {
            display: inline-block;
            margin-top: 5px;
            padding: 10px 18px;
            background-color: #6f8f86;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .assignment a:hover {
            background-color: #5d7c74;
        }
    </style>
</head>

<body>
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

        <!-- Additional module links will be added here. -->

    </div>

</body>
</html>