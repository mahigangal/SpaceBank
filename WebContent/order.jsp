<%@ page import="java.sql.*, java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>SpaceBank Order Processing</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Cambria, sans-serif';
            height: 100vh;
            overflow: hidden;
            background-image: url('<%= request.getContextPath() %>/img/Space.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white; /* Text color for better visibility on a dark background */
        }

        h2 {
            color: white;
            text-align: center; /* Center the text */
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid white;
            padding: 10px;
            text-align: center;
        }

        th.additional-details {
            background-color: #333;
            color: white;
        }

        td.additional-details {
            background-color: #555;
            color: white;
        }

        strong {
            color: yellow;
        }
    </style>
</head>
<body>

<% 
String fname = (String) session.getAttribute("authenticatedUser");

HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

// Check if valid customer id was entered
if (fname == null ) {
    out.println("<p><strong><b>Invalid customer id. Go back to the previous page and try again</b></strong></p>");
} else {
    try  {
        getConnection();
        String sql = "SELECT * FROM Users WHERE firstname = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1,fname);
            ResultSet rst = ps.executeQuery();

            if (!rst.next()) {
                out.println("<p><strong><b>Invalid customer id. Go back to the previous page and try again</b></strong></p>");
            } else {
                // Check if the shopping cart is empty
                if (productList == null || productList.isEmpty()) {
                    out.println("<p><strong><b>Shopping cart is empty!</b></strong></p>");
                } else {
                    // Save order information to the database
                    String sql2 = "INSERT INTO ordersummary (totalAmount) VALUES (?)";

                    try (PreparedStatement ps2 = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS)) {
                        ps2.setDouble(1, 0.0); // Placeholder for totalAmount, will be updated later

                        int rows = ps2.executeUpdate();

                        if (rows == 0) {
                            out.println("<p>Error: Order creation failed.</p>");
                        } else {
                            // Retrieve the auto-generated orderId
                            try (ResultSet rst2 = ps2.getGeneratedKeys()) {
                                if (rst2.next()) {
                                    int orderId = rst2.getInt(1);

                                    String sql3 = "INSERT INTO orderproduct (orderId, servId, quantity, price) VALUES (?, ?, ?, ?)";

                                    try (PreparedStatement ps3 = con.prepareStatement(sql3)) {
                                        Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
                                        double totalAmount = 0.0;

                                        out.println("<h2>Your Order Summary</h2>");
                                        out.println("<table>");
                                        out.println("<tr><th>Service ID</th><th>Service Name</th><th>Quantity</th><th>Price</th><th>Subtotal</th></tr>");

                                        while (iterator.hasNext()) {
                                            Map.Entry<String, ArrayList<Object>> entry = iterator.next();
                                            ArrayList<Object> product = entry.getValue();
                                            String productId = (String) product.get(0);
                                            String productName = (String) product.get(1);
                                            String price = (String) product.get(2);
                                            double pr = Double.parseDouble(price);
                                            int qty = ((Integer) product.get(3)).intValue();

                                            totalAmount += qty * pr;

                                            ps3.setInt(1, orderId);
                                            ps3.setString(2, productId);
                                            ps3.setInt(3, qty);
                                            ps3.setDouble(4, pr);

                                            ps3.executeUpdate();

                                            // Display each ordered item in the table
                                            double subtotal = qty * pr;
                                            out.println("<tr><td>" + productId + "</td><td>" + productName + "</td><td>" + qty + "</td><td>$" + pr + "</td><td>$" + subtotal + "</td></tr>");
                                        }

                                        // Additional details row
                                        out.println("<tr class='additional-details'><td colspan='5'><strong>Additional Details</strong></td></tr>");

                                        // Additional details data row
                                        out.println("<tr class='additional-details'><td colspan='2'>Total Amount:</td><td colspan='3'>$" + totalAmount + "</td></tr>");
                                        out.println("<tr class='additional-details'><td colspan='2'>Order Completed will be shipped soon...</td><td colspan='3'></td></tr>");
                                        out.println("<tr class='additional-details'><td colspan='2'>Your order reference number is:</td><td colspan='3'>" + orderId + "</td></tr>");
                                        out.println("<tr class='additional-details'><td colspan='2'>Shipping to customer: Name:</td><td colspan='3'>" + rst.getString("firstname") + " " + rst.getString("lastname") + "</td></tr>");

                                        out.println("</table>");

                                        // Update total amount for the order record
                                        String sql4 = "UPDATE ordersummary SET totalAmount = ? WHERE orderId = ?";

                                        try (PreparedStatement ps4 = con.prepareStatement(sql4)) {
                                            ps4.setDouble(1, totalAmount);
                                            ps4.setInt(2, orderId);

                                            ps4.executeUpdate();
                                        }

                                        // Clear cart if the order is placed successfully
                                        session.setAttribute("productList", null);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeConnection();
    }
}
%>
</body>
</html>
