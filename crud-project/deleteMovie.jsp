<%--
    Name: Amanda Brock
    Assignment: Module 9
    Purpose: Allows the user to select a movie record to delete
    using the movie ID stored in the database.
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.MovieBean" %>

<%
    // PART 4 : Creates the MovieBean used to display and delete movie records
    MovieBean movieBean = new MovieBean();

    // Deletes the selected movie when the form is submitted
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String movieIdValue = request.getParameter("movieId");
        if (movieIdValue != null && !movieIdValue.isEmpty()) {
            int movieId = Integer.parseInt(movieIdValue);
            movieBean.deleteMovie(movieId);
            response.sendRedirect("deleteMovie.jsp");
            return;
        }
    }   

    // Retrieves all current movie records for the table
    ArrayList<MovieBean> movies = movieBean.getAllMovies();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Movie</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="delete-movie-page">
    <div class="container">

        <h1>Delete Movie</h1>

        <p class="description">
            Select a movie ID to delete a record from the database.
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
                <% for (MovieBean movie : movies) { %>
                    <tr>
                        <td><%= movie.getMovieId() %></td>
                        <td><%= movie.getTitle() %></td>
                        <td><%= movie.getGenre() %></td>
                        <td><%= movie.getReleaseYear() %></td>
                        <td><%= movie.getRating() %></td>
                        <td><%= movie.getRuntime() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>


        <% if (!movies.isEmpty()) { %>
            <form class="delete-form" method="post" action="deleteMovie.jsp">
                <label for="movieId">Select Movie ID:</label>
                <select name="movieId" id="movieId" required>
                    <% for (MovieBean movie : movies) { %>
                        <option value="<%= movie.getMovieId() %>">
                            <%= movie.getMovieId() %>
                        </option>
                    <% } %>
                </select>
                <button class="delete-button" type="button" id="openDeleteModal">
                    Delete Movie
                </button>
            </form>
        <% } else { %>
            <p class="description">
                No movie records remain in the database.
            </p>
        <% } %><br>
        <a href="index.jsp" class="home-link">Back to Project Home</a>
    </div>


    <!-- Confirmation modal shown before deleting a movie -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h2>Delete Movie?</h2>
            <p>
                Are you sure you want to delete Movie ID
                <strong id="deleteMovieId"></strong>?
            </p>
            <div class="modal-buttons">
                <button type="button" id="cancelDelete">Cancel</button>
                <button class="delete-button" type="button" id="confirmDelete">
                    Delete Movie
                </button>
            </div>
        </div>
    </div>

    <script>
        const deleteButton = document.getElementById("openDeleteModal");
        const deleteModal = document.getElementById("deleteModal");
        const movieSelect = document.getElementById("movieId");
        const deleteMovieId = document.getElementById("deleteMovieId");
        deleteButton.addEventListener("click", function () {
            deleteMovieId.textContent = movieSelect.value;
            deleteModal.style.display = "flex";
        });
        const cancelButton = document.getElementById("cancelDelete");
        cancelButton.addEventListener("click", function () {
            deleteModal.style.display = "none";
        });
        const confirmButton = document.getElementById("confirmDelete");
        confirmButton.addEventListener("click", function () {
            movieSelect.form.submit();
        });
    </script>

</body>
</html>