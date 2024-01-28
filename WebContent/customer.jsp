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

        .profile-image-container {
            text-align: center;
        }

        .profile-image {
            max-width: 40%; 
            max-height: 40%;
            display: inline-block;
            margin: auto; 
            opacity: 1;
        }

        .user-info {
            text-align: center;
            color: white;
            margin-top: 20px;
        }

        h3 {
            font-family: 'Bangers', cursive;
            text-align: center;
            color: #fff;
            font-size: 3em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            white-space: nowrap;
            overflow: hidden;
            border-right: 2px solid #fff;
            animation: typing 4s steps(30, end);
            display: inline-block;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
        }

        @keyframes typing {
            from {
                width: 0;
            }
            to {
                width: 100%;
            }
        }

      
        .info-text {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .transaction-button {
            background-color: #000000;
            color: white;
            border: none;
            padding: 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .transaction-button:hover {
            background-color: #333;
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
                                <img src="img/atro.png" alt="Profile Image" class="profile-image">
                            </div>

                            <div class="user-info">
                                <%
                                    String customerSql = "SELECT * FROM Users where firstname = ?";
                                    PreparedStatement customerPstmt = con.prepareStatement(customerSql);
                                    customerPstmt.setString(1, userName);
                                    ResultSet rs = customerPstmt.executeQuery();

                                    if(rs.next()){
                                %>
                                <script>
                                    document.querySelector('.container h3').addEventListener('animationend', function () {
                                        
                                    }); 
                                </script>
                                <div class="h3">
                                    <div class="info-text">
                                        Welcome, <%= rs.getString("firstname") %> <%= rs.getString("lastname") %>!
                                    </div>
                                    <div class="info-text">
                                        Your SpaceStation ID: <%= rs.getString("stnId") %>
                                    </div>
                                    <div class="info-text">
                                        Your SpaceBucks: $ <%= rs.getInt("sbucks") %>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>

                          


                            <%
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
