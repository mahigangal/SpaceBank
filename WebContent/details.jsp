<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spacecraft Details</title>
</head>
<body>
    <%
        String spacecraftId = request.getParameter("spacecraft");

        // Use spacecraftId to fetch details from the database
        String details = ""; // Implement logic to retrieve details based on spacecraftId

        // Display the details
    %>
    <h1>Details for <%= spacecraftId %></h1>
    <p><%= details %></p>
</body>
</html>