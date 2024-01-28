<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
    <title>SpaceCart</title>
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
        .header {
            background-color: #000000;
            color: white;
            text-align: center;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .cart-table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .cart-table th, .cart-table td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: left;
        }

        .cart-table th {
            background-color: #4CAF50;
            color: white;
        }

        .total-section {
            margin-top: 20px;
            text-align: right;
        }

        .total-label {
            font-weight: bold;
        }

        .action-buttons {
            text-align: center;
            margin-top: 150px;
        }
        
        .action-buttons a {
            background-color: #000000;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 15px;
            display: inline-block;
            transition: background-color 0.3s ease; 
        }
        
        .action-buttons a:hover {
            background-color: #ffffff;
            color: #000000; 
        }
        .continue-shopping {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .checkout-button {
            display: inline-block;
            background-color: #3E71B7;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }
        .carttext{
            color: azure;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Your SpaceCart</h1>
</div>

<%
    // Get the current list of products
    @SuppressWarnings({"unchecked"})
    HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

    if (productList == null) {
        out.println("<div class='carttext'><p>Your space cart is empty!</p></div>");
        %>

        <div class='action-buttons'>
            <a class='continue-shopping' href='listprod.jsp'>Back</a>
        </div>
    <%
    } else {
        NumberFormat currFormat = NumberFormat.getCurrencyInstance();

        out.println("<table class='cart-table'><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
        out.println("<th>Price</th><th>Subtotal</th><th>Action</th></tr>");

        double total = 0;
        Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, ArrayList<Object>> entry = iterator.next();
            ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
            if (product.size() < 4) {
                out.println("<tr><td colspan='6'>Invalid product data</td></tr>");
                continue;
            }

            out.print("<tr><td>" + product.get(0) + "</td>");
            out.print("<td>" + product.get(1) + "</td>");

            // Update the quantity with an input field for user modification
            out.print("<td align='center'>");
            out.print("<form action='updatequantity.jsp' method='post'>");
            out.print("<input type='hidden' name='productId' value='" + product.get(0) + "'>");
            out.print("<input type='number' name='quantity' value='" + product.get(3) + "' min='1' required>");
            out.print("<input type='submit' value='Update'></form>");
            out.print("</td>");

            Object price = product.get(2);
            Object itemqty = product.get(3);
            double pr = 0;
            int qty = 0;

            try {
                pr = Double.parseDouble(price.toString());
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Invalid price for product: " + product.get(0) + "</td></tr>");
            }
            try {
                qty = Integer.parseInt(itemqty.toString());
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Invalid quantity for product: " + product.get(0) + "</td></tr>");
            }

            out.print("<td align='right'>" + currFormat.format(pr) + "</td>");
            out.print("<td align='right'>" + currFormat.format(pr * qty) + "</td>");

            // Add a form with a button to remove the item
            out.print("<td><form action='removecart.jsp' method='post'>");
            out.print("<input type='hidden' name='productId' value='" + product.get(0) + "'>");
            out.print("<input type='submit' value='Remove'></form></td>");

            out.println("</tr>");
            total = total + pr * qty;
        }
        out.println("<tr><td colspan='5' align='right'><b>Order Total</b></td>"
                + "<td align='right'>" + currFormat.format(total) + "</td></tr>");
        out.println("</table>");

        out.println("<div class='action-buttons'>");
        out.println("<a class='continue-shopping' href='listprod.jsp'>Continue Shopping</a>");
        out.println("<a class='checkout-button' href='order.jsp'>Check Out</a>");
        out.println("</div>");
    }
%>

</body>
</html>
