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
    <div class="navbar">
        <a href="index.jsp">Main Page</a>
        <a href="customer.jsp">Customer Info</a>
        <a href="logout.jsp">Log out</a>
    </div>

    <div class="header-ribbon">
        <div class="header-title">Welcome to SpaceBank's Services</div>

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

    <!-- ... (rest of your HTML) ... -->


        <%-- Service 2 --%>
        <div class="product-card">
            <img src="img/laundry.jpeg %>" class="product-image" alt="Laundry">
            <div class="product-details">
                <div class="product-price">$8.00</div>
                <div class="prouct-name">Laundromat</div>
                <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
            </div>
        </div>

        <%-- Service 3 --%>
        <div class="product-card">
            <img src="img/market.jpeg" class="product-image" alt="Market">
            <div class="product-details">
                <div class="prouct-name">Market</div>
                <div class="add-to-cart-link"><a href="listmarket.jsp">View</a></div>
            </div>
        </div>

        <%-- Service 4 --%>
        <div class="product-card">
            <img src="img/pool.jpeg" class="product-image" alt="Pool">
            <div class="product-details">
                <div class="product-price">$5.50</div>
                <div class="prouct-name">Swimming Pool</div>
                <div class="add-to-cart-link"><a href="#">Add to Cart</a></div>
            </div>
        </div>
        <%-- Service 5 --%>
        <div class="product-card">
            <img src="img/restaurant.jpeg" class="product-image" alt="Resto">
            <div class="product-details">
 
                <div class="prouct-name">Restaurant</div>
                <div class="add-to-cart-link"><a href="listrestaurant.jsp">View</a></div>

            </div>
        </div>
      
    </div>

</body>

</html>
