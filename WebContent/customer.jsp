<%@ page import="java.sql.*, java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SpaceFile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #000000;
            background-image: url('img/Space.jpg');
            background-size: cover;
            background-position: center;
        }

        .ribbon {
            background-color: #000000;
            padding: 10px 0;
            text-align: center;
            color: white;
            font-size: 16px;
        }

        .ribbon a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
        }

        .navbar {
            background-color: #000000;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: #ffffff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            margin-top: 20px;
        }

        .table th,
        .table td {
            text-align: center;
        }

        .alert {
            margin-top: 20px;
    
        }
        .profile-image-container {
            text-align: center;
        }

        .profile-image {
            max-width: 25%; 
            display: inline-block;
            margin: auto; 
            opacity: 1;
        }
    </style>
</head>

<body>

    <div class="ribbon">
        <h2>SpaceFile</h2>
    </div>

    <div class="navbar">
        <a href="listprod.jsp">Services </a>
        <a href="index.jsp">Main Page</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                

                <%
                    String userName = (String) session.getAttribute("authenticatedUser");

                    if (userName == null || userName.isEmpty()) {
                %>
                    <div class="alert alert-danger" role="alert">
                        Error: You are not logged in. Please <a href="login.jsp">login</a> to access this page.
                    </div>
                <%
                    } else {
                        try {
                            getConnection(); %> 
                            <div class="profile-image-container">
                                <img src="img/astronaut.png" alt="Profile Image" class="profile-image">
                            </div>

                            <%
                            String customerSql = "SELECT * FROM Users WHERE name = ?";
                            PreparedStatement customerPstmt = con.prepareStatement(customerSql);
                            customerPstmt.setString(1, userName);
                            ResultSet rs = customerPstmt.executeQuery();


                            
            

                               
                                    
                            closeConnection();
                        } catch (SQLException ex) {
                            out.println(ex);
                        }
                    }
                %>

            </div>
        </div>
    </div>

</body>

</html>
