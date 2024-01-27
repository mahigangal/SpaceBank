<!DOCTYPE html>
<html lang="en">

<head>
    <title>Spacebank</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            height: 100vh;
            overflow: hidden;
            background-color: #f5f5f5;
        }

        .navbar {
            display: flex;
            justify-content: center;
            background-color: #4CAF50;
            overflow: hidden;
        }

        .navbar a {
            float: none;
            display: inline-block;
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

        .background-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('<%= request.getContextPath() %>/Backgroud%20Image/bg.jpg');
            background-size: cover;
            background-position: center;
            z-index: -1;
        }

        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #fff;
        }

        h1,
        h2,
        h3,
        h4 {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }

        h1 {
            font-size: 3em;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 2em;
            margin: 10px 0;
        }

        h3 {
            font-size: 1.5em;
            margin: 10px 0;
        }

        h4 {
            font-size: 1.2em;
            margin: 5px 0;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #3E71B7;
        }
    </style>
</head>

<body>
    <div class="navbar">
        <a href="login.jsp">Login</a>
        <a href="listprod.jsp">Services</a>
        <a href="useraccount.jsp">User Account</a>
        <a href="admin.jsp">Administrators</a>
        <a href="logout.jsp">Log out</a>
    </div>

    <div class="background-container"></div>
    <div class="container">
        <h1>Welcome to Space Bank</h1>

        <%
            String userName = (String) session.getAttribute("authenticatedUser");
            if (userName != null)
                out.println("<h3>Signed in as: " + userName + "</h3>");
        %>
    </div>
</body>

</html>
