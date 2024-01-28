<%@ page import="java.sql.*, java.net.URLEncoder, java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SpaceBank</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden; /* Prevent scrollbars caused by the absolute positioning of background-container */
        }

        .background-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-image: url('<%= request.getContextPath() %>/img/Space.jpg'); /* Replace with your background image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            filter: brightness(0.5); /* Optional: Adjust the brightness of the background */
        }

        .navbar {
            background-color: black;
            overflow: hidden;
            display: flex;
            justify-content: flex-end;
            padding: 10px;
            z-index: 1; /* Ensure the navbar is above the background */
        }

        /* ... (rest of your styles) ... */

    </style>
</head>

<body>
    <div class="background-container"></div> <!-- Background container div -->

    <!-- ... (rest of your HTML) ... -->

</body>

</html>
