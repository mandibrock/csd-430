<%--
    Name: Amanda Brock
    Assignment: Module 3
    Purpose: Receives information submitted from the EDM Festival
    Experience Tracker and displays the information in an HTML table.
--%>

<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    // Get submitted form values.

    String festival =
        request.getParameter("festival");
    String festivalYear =
        request.getParameter("festivalYear");
    String favoriteStage =
        request.getParameter("favoriteStage");
    String favoriteDJ =
        request.getParameter("favoriteDJ");
    String otherActivity =
        request.getParameter("otherActivity");
    String rating =
        request.getParameter("rating");
    String attendAgain =
        request.getParameter("attendAgain");
    String bestMemory =
        request.getParameter("bestMemory");

    // Get all selected activity checkboxes.

    String[] activities =
        request.getParameterValues("activities");

    // Create a display string for activities.

    String activityDisplay = "";

    if (activities != null) {
        for (int i = 0; i < activities.length; i++) {
            activityDisplay += activities[i];
            if (i < activities.length - 1) {
                activityDisplay += ", ";
            }
        }
    }

    // Add the other activity if one was entered.

    if (otherActivity != null &&
        !otherActivity.trim().isEmpty()) {
        if (!activityDisplay.isEmpty()) {
            activityDisplay += ", ";
        }
        activityDisplay += otherActivity;
    }

    // Display a message if no activities were selected.

    if (activityDisplay.isEmpty()) {
        activityDisplay =
            "No activities selected";
    }

    // Display a message if no favorite memory was entered.

    if (bestMemory == null ||
        bestMemory.trim().isEmpty()) {
        bestMemory =
            "No favorite memory entered";
    }
%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="festival.css"> 
    <title>Festival Experience Recap</title>
</head>

<body>
<div class="container">
    <h1>Festival Experience Recap</h1>
    <p>
        The table below displays the information submitted
        about the attendee's festival experience.
    </p>

    <table>
        <tr>
            <th>Field</th>
            <th>Description</th>
            <th>Submitted Data</th>
        </tr>

        <tr>
            <td>Festival</td>
            <td>EDM festival attended</td>
            <td><%= festival %></td>
        </tr>

        <tr>
            <td>Year Attended</td>
            <td>Year the attendee went to the festival</td>
            <td><%= festivalYear %></td>
        </tr>

        <tr>
            <td>Favorite Stage</td>
            <td>Stage the attendee enjoyed most</td>
            <td><%= favoriteStage %></td>
        </tr>

        <tr>
            <td>Favorite DJ or Artist</td>
            <td>Favorite performer from the festival</td>
            <td><%= favoriteDJ %></td>
        </tr>

        <tr>
            <td>Activities</td>
            <td>Activities or experiences enjoyed</td>
            <td><%= activityDisplay %></td>
        </tr>

        <tr>
            <td>Overall Rating</td>
            <td>Attendee's overall festival rating</td>
            <td><%= rating %></td>
        </tr>

        <tr>
            <td>Attend Again</td>
            <td>Whether the attendee would return</td>
            <td><%= attendAgain %></td>
        </tr>

        <tr>
            <td>Favorite Memory</td>
            <td>Attendee's favorite festival memory</td>
            <td><%= bestMemory %></td>
        </tr>
    </table>

    <a class="recap-link" href="festivalForm.html">
        Create Another Festival Recap
    </a>

</div>
</body>

</html>