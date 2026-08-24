<%--
    Name: Amanda Brock
    Date: August 23, 2026
    Assignment: Module 2 

    Purpose: Uses JSP and HTML to display information about places I enjoyed visiting while living in Japan.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    // Store the location, category, and description for each place.
    String[][] japanLocations = {
        {"Tokyo", "Cities", "A busy city with tons of shopping, food, entertainment, and different areas to explore."},
        {"Osaka", "Cities", "A fun city with great food, shopping, and plenty of things to do."},
        {"Kyoto", "Historic Places", "Known for its temples, shrines, and traditional Japanese buildings."},
        {"Nara", "Historic Places", "Known for its temples, parks, and the deer that walk freely around the area."},
        {"Mount Fuji", "Landmarks", "One of the most recognizable places in Japan and an amazing sight to see in person."}
    };

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Time in Japan</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container">
        <h1>My Time in Japan</h1>
        <p>
            I lived in Japan for three years and had the chance to visit a lot
            of different places while I was there. Japan has everything from
            huge cities to historic areas and famous landmarks. The information
            below shows five places I enjoyed visiting and a little about each one.
        </p>

        <h2>About the Data</h2>
        <p>
            Each record contains three fields: the location, the category,
            and a short description. The records are also grouped by category.
        </p>
            
        <h2>Field Descriptions</h2>

        <ul>
            <li><strong>Location:</strong> The name of the place.</li>
            <li><strong>Category:</strong> The type of location.</li>
            <li><strong>Description:</strong> A short description of the location.</li>
        </ul>

        <h2>Places I Enjoyed Visiting</h2>

        <h3>Cities</h3>

        <table>
            <tr>
                <th>Location</th>
                <th>Category</th>
                <th>Description</th>
            </tr>

            <%
                // Display records in the Cities category.
                for (int i = 0; i < japanLocations.length; i++) {
                    if (japanLocations[i][1].equals("Cities")) {
            %>

            <tr>
                <td><%= japanLocations[i][0] %></td>
                <td><%= japanLocations[i][1] %></td>
                <td><%= japanLocations[i][2] %></td>
            </tr>

            <%
                    }
                }
            %>

        </table>


        <h3>Historic Places</h3>

        <table>
            <tr>
                <th>Location</th>
                <th>Category</th>
                <th>Description</th>
            </tr>

            <%
                // Display records in the Historic Places category.
                for (int i = 0; i < japanLocations.length; i++) {
                    if (japanLocations[i][1].equals("Historic Places")) {
            %>

            <tr>
                <td><%= japanLocations[i][0] %></td>
                <td><%= japanLocations[i][1] %></td>
                <td><%= japanLocations[i][2] %></td>
            </tr>

            <%
                    }
                }
            %>

        </table>


        <h3>Landmarks</h3>

        <table>
            <tr>
                <th>Location</th>
                <th>Category</th>
                <th>Description</th>
            </tr>

            <%
             // Display records in the Landmarks category.
                for (int i = 0; i < japanLocations.length; i++) {
                    if (japanLocations[i][1].equals("Landmarks")) {
            %>

            <tr>
                <td><%= japanLocations[i][0] %></td>
                <td><%= japanLocations[i][1] %></td>
                <td><%= japanLocations[i][2] %></td>
            </tr>

            <%
                    }
                }
            %>

        </table>

        </div>

</body>
</html>