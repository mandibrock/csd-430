<%--
    Name: Amanda Brock
    Assignment: Module 3
    Purpose: Creates a FestivalBean object, stores information about an
    EDM festival experience, and displays the information in
    an HTML table.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="beans.FestivalBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EDM Festival Experience</title>

    <link rel="stylesheet" href="style.css">
</head>

<body>

<%
    // Creates the bean.
    FestivalBean festival = new FestivalBean();

    // Store festival experience data from the Module 2 assignment.
    festival.setFestivalName("North Coast Music Festival");
    festival.setYear(2026);
    festival.setFavoriteStage("The Stadium");
    festival.setFavoriteActivity("Art Installations");
    festival.setFavoriteDJ("Illenium");
    festival.setRating(5);
    festival.setComments(
        "Great music, fun activities, and a really good overall festival experience."
    );
%>

<div class="container">

    <h1>EDM Festival Experience</h1>

    <p class="intro">
        This table displays festival experience data stored in a JavaBean,
        including the festival attended, favorite activities, and overall
        experience.
    </p>

    <table>

        <tr>
            <th>Field</th>
            <th>Record</th>
            <th>Description</th>
        </tr>

        <tr>
            <td class="field">Festival</td>
            <td><%= festival.getFestivalName() %></td>
            <td class="field-description">
                Name of the EDM festival attended.
            </td>
        </tr>

        <tr>
            <td class="field">Year</td>
            <td><%= festival.getYear() %></td>
            <td class="field-description">
                Year the festival was attended.
            </td>
        </tr>

        <tr>
            <td class="field">Favorite Stage</td>
            <td><%= festival.getFavoriteStage() %></td>
            <td class="field-description">
                Stage enjoyed most during the festival.
            </td>
        </tr>

        <tr>
            <td class="field">Favorite Activity</td>
            <td><%= festival.getFavoriteActivity() %></td>
            <td class="field-description">
                Favorite activity outside of the music performances.
            </td>
        </tr>

        <tr>
            <td class="field">Favorite DJ</td>
            <td><%= festival.getFavoriteDJ() %></td>
            <td class="field-description">
                Favorite DJ or artist from the festival.
            </td>
        </tr>

        <tr>
            <td class="field">Rating</td>
            <td><%= festival.getRating() %> / 5</td>
            <td class="field-description">
                Overall rating of the festival experience.
            </td>
        </tr>

        <tr>
            <td class="field">Comments</td>
            <td><%= festival.getComments() %></td>
            <td class="field-description">
                Additional comments about the festival experience.
            </td>
        </tr>

    </table>

</div>

</body>
</html>