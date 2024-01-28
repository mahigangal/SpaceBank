<%@ page contentType='text/html;charset=UTF-8' language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Screen</title>
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
    }

    .login-container {
        text-align: center;
        background-color: rgba(0, 0, 0, 0.5);
        padding: 20px;
        border-radius: 10px;
        max-width: 600px; /* Set a maximum width for the container */
        width: 100%; /* Ensure container takes full width within max-width */
    }

    h3 {
		font-family: 'Cambria', sans-serif;
        color: #FFFFFF;
        margin-bottom: 20px;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    table {
        width: 100%;
        margin-top: 20px;
    }

    td {
        text-align: right;
        color: white;
    }

    input {
        padding: 10px;
        margin-top: 5px;
        width: 100%;
        box-sizing: border-box;
    }

    .submit {
        background-color: black;
        color: white;
        cursor: pointer;
        padding: 10px;
        margin-top: 20px;
        width: 100%; /* Make the button take full width */
        box-sizing: border-box;
        border: none;
        border-radius: 5px;
    }

    .submit:hover {
        background-color: gray;
    }

    .image-container {
        margin-top: 20px;
    }

    .spacecraft-image {
        max-width: 100%; /* Adjust this value to control the image size */
        height: auto;
        border-radius: 10px;
    }
</style>

</head>
<body>
    <div class="login-container">
        <h3>Log in to SpaceBank</h3>
        <%
            // Print prior error login message if present
            if (session.getAttribute("loginMessage") != null)
                out.println("<p>" + session.getAttribute("loginMessage").toString() + "</p>");
        %>

        <form name="MyForm" method="post" action="validateLogin.jsp">
            <table>
                <tr>
                    <td><font face="Arial, Helvetica, sans-serif" size="2">Username:</font></td>
                    <td><input type="text" name="username" size=10 maxlength=10></td>
                </tr>
                <tr>
                    <td><font face="Arial, Helvetica, sans-serif" size="2">Password:</font></td>
                    <td><input type="password" name="password" size=10 maxlength="10"></td>
                </tr>
            </table>
            <input class="submit" type="submit" name="Submit2" value="Log In">
        </form>

        <div class="image-container">
            <img src="<%= request.getContextPath() %>/img/spacecraft1.png" alt="Spacecraft Image" class="spacecraft-image">
        </div>
    </div>
</body>
</html>