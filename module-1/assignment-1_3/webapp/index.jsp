<%--
    Amanda Brock
    August 16, 2026
    Module 1.3

    Purpose: Uses Java and HTML together to create a simple game night page.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Game Night Status</title>
</head>
<body>

    <h1>Game Night Status</h1>

    <%
        // Set the game and how many players are needed.
        String gameName = "Overwatch";
        int playersNeeded = 6;

        // Set how many friends are currently online.
        int friendsOnline = 6;

        // Check if there are enough players to start.
        boolean readyToPlay = friendsOnline >= playersNeeded;
    %>

    <p>Game: <%= gameName %></p>
    <p>Players Online: <%= friendsOnline %></p>
    <p>Players Needed: <%= playersNeeded %></p>

    <%
        // Show a different message depending on whether everyone is ready.
        if (readyToPlay) {
    %>
        <p>Everyone is here. Time to play!</p>
    <%
        } else {
    %>
        <p>Waiting for more friends...</p>
    <%
        }
    %>

</body>
</html>