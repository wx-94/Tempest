<%-- 
    Document   : CreateAccount
    Created on : May 13, 2018, 11:07:56 AM
    Author     : Xuan
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Creation Page</title>
    </head>
    <body>
        <form role="form" action="createaccount" method = "post">
            <input class="form-control" type="text" name="name" placeholder="Name">
            <br>
            <input class="form-control" type="text" name="mobile" placeholder="Mobile Number">
            <br>
            <input class="form-control" type="text" name="email" placeholder="Email">
            <br>
            <input class="form-control" type="password" name="password" placeholder="Password">
            <br>
            <input class="form-control" type="password" name="confirmPassword" placeholder="Confirm Password">
            <br>
            <input type="submit" value="Submit" class="btn btn-lg btn-success btn-block">

            <%
                ArrayList<String> error = (ArrayList<String>) session.getAttribute("errorMsg");
                if (error != null) {
            %>
            <br>
            <%
                for (String str : error) {
                    out.println(str);
            %>
            <br>
            <%
                    }
                    session.setAttribute("errorMsg", null);
                }
            %>  
        </form>
    </body>
</html>
