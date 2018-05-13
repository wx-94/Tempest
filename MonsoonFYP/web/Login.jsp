<%-- 
    Document   : Login
    Created on : 9 May, 2018, 3:45:49 PM
    Author     : jacky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Monsoon Login</title>
    </head>
    <body>
        <form role="form" action="authenticate" method = "post">
            <input class="form-control" type="text" name="username" placeholder="Username">
            </div>
            <div class="form-group">
                <input class="form-control" type="password" name="password" placeholder="Password">
                <%
                    String errorMessage = (String) request.getAttribute("errorMsg");

                    if (errorMessage != null) {
                        out.println(errorMessage);
                    }
                %>
            </div>
            <input type="submit" value="Sign In" class="btn btn-lg btn-success btn-block">
        </form>
            <a href="CreateAccount.jsp">Create Account</a><br>
            <a href="ChangePassword.jsp">Change Password</a>
    </body>
</html>
