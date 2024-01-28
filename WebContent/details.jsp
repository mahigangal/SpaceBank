<%@ page import="java.sql.*" %>
<%@ page contentType='text/html;charset=UTF-8' language="java" %>

<%@ include file="jdbc.jsp" %>

<html>
<head>
    <title>Spacecraft Details</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Titillium Web', sans-serif;
            height: 100vh;
            overflow: hidden;
            background-color: #000;
            cursor: default;
            background-image: url('<%= request.getContextPath() %>/img/Space.jpg');
            background-size: cover;
            background-position: center;
        }

        .container {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            color: #fff;
            width: 100%;
        }

        h1 {
            font-family: 'Bangers', cursive;
            text-align: center;
            color: #FFFFFF;
            font-size: 3em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            white-space: nowrap;
            overflow: hidden;
            border-right: 2px solid #fff;
            animation: typing 4s steps(30, end);
            display: inline-block;
        }

       @keyframes typing {
            0% {
                width: 0;
                text-align: center;
            }
          
            100% {
                width: 100%;
                text-align: center;
            }
        }

        p {
            color: #fff;
            text-align: center;
            font-size: 1.2em;
            line-height: 1.5;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        String spacecraftId = request.getParameter("spacecraftId");
        String spacecraftName = request.getParameter("spacecraftName");

        // Use spacecraftId to fetch details from the database
        // Assuming you have a database connection and result set (rs) ready
 

        try {
            getConnection();
            String sql = "SELECT * FROM SpaceStation WHERE stnId = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, spacecraftId); 
            ResultSet rs = stmt.executeQuery(); 

            if (rs.next()) {
                // Extract details from the result set
                int population = rs.getInt("pop");
                int food = rs.getInt("food");
                int oxygen = rs.getInt("oxygen");
                int energy = rs.getInt("energy");
                int water = rs.getInt("water");
                double survivalTime = rs.getDouble("survivalTime");

                String details = "Spacecraft Name: " + spacecraftName + "<br>"
                        + "Population: " + population + "<br>"
                        + "Food: " + food + "<br>"
                        + "Oxygen: " + oxygen + "<br>"
                        + "Energy: " + energy + "<br>"
                        + "Water: " + water + "<br>"
                        + "Survival Time: " + survivalTime + " years";
    %>
                <h1>Details for <%= spacecraftName %></h1>
                <p><%= details %></p>
    <%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    %>
    <script src="scripts.js"></script>
    <script>
        // Add event listener to hide cursor after animation
        document.querySelector('.container h1').addEventListener('animationend', function () {
            
        });
    </script>
</body>
</html>
