<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.*, java.io.PrintWriter, java.net.URLEncoder, java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%!  
    public class ServiceLimits {
        public int quota;
        public int cap;
    }

    ServiceLimits getServiceLimits(String servId) {
        ServiceLimits limits = new ServiceLimits();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT quota, cap FROM services WHERE servId = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, servId);
            rs = ps.executeQuery();

            if (rs.next()) {
                limits.quota = rs.getInt("quota");
                limits.cap = rs.getInt("cap");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return limits;
    }
%>

<%
    PrintWriter responseWriter = response.getWriter();

    try {
        getConnection();

        String servId = request.getParameter("servId");
        String quantityParameter = request.getParameter("quota");

        if (quantityParameter != null && !quantityParameter.isEmpty()) {
            int newQuantity = Integer.parseInt(quantityParameter);

            HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

            if (productList != null && productList.containsKey(servId)) {
                ArrayList<Object> product = productList.get(servId);

                ServiceLimits limits = getServiceLimits(servId);

                if (newQuantity >= 1 && newQuantity <= limits.quota && newQuantity <= limits.cap) {
                    product.set(3, newQuantity);
                } else {
                    // If the requested quantity exceeds the available quota or cap, set it to the maximum allowed
                    int maxAllowed = Math.min(limits.quota, limits.cap);
                    
                    responseWriter.println("<p>Sorry, the requested quantity exceeds the available quota or cap. Setting to the maximum allowed: " + maxAllowed + ".</p>");
                    product.set(3, maxAllowed);
                }
            } else {
                responseWriter.println("<p>Invalid request. The item is not in the cart.</p>");
            }

            session.setAttribute("productList", productList);
        } else {
            responseWriter.println("<p>Invalid request. Please provide a valid quantity.</p>");
        }
    } finally {
        closeConnection();
    }

    response.sendRedirect("showcart.jsp");
%>
