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
            background-color: black;
        }

        .navbar {
            background-color: black;
            overflow: hidden;
            display: flex;
            justify-content: flex-end;
            padding: 10px;
        }

        .navbar a {
            color: beige;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
        }

        .header-ribbon {
            position: relative;
            background-color: black;
            color: beige;
            text-align: center;
            padding: 40px;
            font-size: 35px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
        }

        .header-title {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            overflow: hidden;
            white-space: nowrap;
            border-right: 2px solid #fff;
            animation: typing 4s steps(30, end);
            display: inline-block;
        }

        .user-info {
            position: absolute;
            top: 20px;
            right: 20px;
            color: beige;
            font-size: 15px;
        }

        .links {
            background-color: black;
            overflow: hidden;
            display: flex;
            justify-content: center;
            padding: 10px;
        }

        .links a {
            color: beige;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
        }

        .background-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('<%= request.getContextPath() %>/img/Space.jpg');
            background-size: cover;
            background-position: center;
            z-index: -1;
        }

        form {
            margin-bottom: 20px;
            text-align: center;
        }

        input[type="text"],
        select,
        input[type="submit"],
        input[type="reset"] {
            padding: 10px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: black;
            color: beige;
            cursor: pointer;
        }

        .product-card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px;
        }

        .product-card {
            border: 1px solid bisque;
            border-radius: 8px;
            overflow: hidden;
            margin: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: bisque;
            display: flex;
            flex-direction: column;
            height: 400px;
            width: 300px;
            animation: attention 2s infinite; /* Added animation to the product card */
        }

        .product-image {
            width: 100%;
            height: 60%;
            object-fit: contain;
        }

        .product-details {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-price {
            font-weight: bold;
            color: black;
        }

        .quota {
            color: #333;
        }

        .add-to-cart-link {
            align-self: flex-end;
            margin-top: auto;
            padding: 10px;
        }

        /* Animation for typing */
        @keyframes typing {
            from {
                width: 0;
            }
            to {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="navbar">
        <a href="index.jsp">Main Page</a>
        <a href="customer.jsp">Customer Info</a>
        <a href="logout.jsp">Log out</a>
    </div>

    <div class="header-ribbon">
        <div class="header-title">Welcome to SpaceBank</div>
        <div class="user-info">
            Welcome,
            <% 
                String userName = (String) session.getAttribute("authenticatedUser");
                if (userName != null) {
                    out.println("Signed in as: " + userName);
                }
            %>
        </div>
    </div>

    <div class="product-card-container">
        <%
            try {
                getConnection();
                String query = "SELECT * FROM services";
                PreparedStatement pstmt = con.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    String servId = rs.getString("servId");
                    String servName = rs.getString("servName");
                    double cost = rs.getDouble("cost");
                    String imageURL = rs.getString("servImageURL");
                    int quota = rs.getInt("quota");

                    // Add a class for styling based on quota
                    String attentionClass = (quota == 0) ? "attention" : "";
        %>

        <div class="product-card <%= attentionClass %>">
            <img src="<%= request.getContextPath() + "/" + imageURL %>" class="product-image" alt="<%= servName %>">
            <div class="product-details">
                <div class="product-price">$<%= String.format("%.2f", cost) %></div>
                <div class="prouct-name"><%= servName %></div>
                <% if (quota > 0) { %>
                    <div class="quota">Quota: <%= quota %></div>
                    <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
                <% } else { %>
                    <div class="quota">Quota: Hidden</div>
                    <% if ("Restaurant".equals(servName)) { %>
                        <div class="add-to-cart-link"><a href="listrestaurant.jsp">View</a></div>
                    <% } else if ("Market".equals(servName)) { %>
                        <div class="add-to-cart-link"><a href="listmarket.jsp">View</a></div>
                    <% } else { %>
                        <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
                    <% } %>
                <% } %>
            </div>
        </div>

        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Close resources
                closeConnection();
            }
        %>
    </div>
    <div class="background-container"></div>
</body>

</html>
