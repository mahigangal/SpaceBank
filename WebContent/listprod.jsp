<%@ page import="java.sql.*, java.net.URLEncoder, java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Spacebank</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #4CAF50;
            overflow: hidden;
            display: flex;
            justify-content: flex-end;
            padding: 10px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
        }

        .header-ribbon {
            position: relative;
            background-color: #4CAF50;
            color: white;
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
        }

        .user-info {
            position: absolute;
            top: 20px;
            right: 20px;
            color: #333;
            font-size: 15px;
        }

        .links {
            background-color: #4CAF50;
            overflow: hidden;
            display: flex;
            justify-content: center;
            padding: 10px;
        }

        .links a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
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
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }

        .product-card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px;
        }

        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            margin: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            display: flex;
            flex-direction: column;
            height: 400px;
            width: 300px;
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
            color: #4CAF50;
        }

        .add-to-cart-link {
            align-self: flex-end;
            margin-top: auto;
            padding: 10px;
        }
    </style>
</head>

<body>
    <div class="navbar">
        <a href="index.jsp">New Main Page</a>
        <a href="customer.jsp">Customer Info</a>
        <a href="logout.jsp">Log out</a>
    </div>

    <div class="header-ribbon">
        <div class="header-title">Welcome to Spacebanks</div>
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

    <form method="get" action="listprod.jsp">
        <input type="text" name="productName" placeholder="Product Name">
        <select name="category">
            <option value="">All</option>
            <option value="Beverages">Beverages</option>
            <option value="Condiments">Condiments</option>
            <option value="Dairy Products">Dairy Products</option>
            <option value="Produce">Produce</option>
            <option value="Confections">Confections</option>
            <option value="Grains/Cereals">Grains/Cereals</option>
        </select>
        <input type="submit" value="Submit">
        <input type="reset" value="Reset"> (Leave blank for all products)
    </form>
    <!-- <%
    // Get the context path
    String contextPath = request.getContextPath();
%>

<p>Context Path: <%= contextPath %></p> -->
<div class="product-card-container">
        <%-- Service 1 --%>
        <div class="product-card">
            <img src="<%= request.getContextPath() %>WebContent/img/gym.jpeg" class="product-image" alt="Gym">
                  
            <div class="product-details">
                <div class="product-price">$5.00</div>
                <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
            </div>
        </div>

        <%-- Service 2 --%>
        <div class="product-card">
            <img src="<%=  request.getContextPath() %>/WebContent/img/laundry.jpeg %>" class="product-image" alt="Laundry">
            <div class="product-details">
                <div class="product-price">$8.00</div>
                <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
            </div>
        </div>

        <%-- Service 3 --%>
        <div class="product-card">
            <img src="<%=  request.getContextPath() %>/WebContent/img/market.jpeg%>" class="product-image" alt="Market">
            <div class="product-details">
                <!-- <div class="product-price">$X.XX</div> -->
                <div class="add-to-cart-link"><a href="#">View</a></div>
            </div>
        </div>

        <%-- Service 4 --%>
        <div class="product-card">
            <img src="<%= request.getContextPath() %>/WebContent/img/pool.jpeg %>" class="product-image" alt="Pool">
            <div class="product-details">
                <div class="product-price">$3.00</div>
                <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
            </div>
        </div>
        <%-- Service 5 --%>
        <div class="product-card">
            <img src="<%=  request.getContextPath() %>/WebContent/img/laundry.jpeg %>" class="product-image" alt="Resto">
            <div class="product-details">
                <div class="product-price">$15.00</div>
                <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
            </div>
        </div>
      
    </div>
</body>
</html>
