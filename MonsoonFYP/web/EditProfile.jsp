<%-- 
    Document   : EditProfile
    Created on : May 27, 2018, 7:36:34 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.daos.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <% CustomerDAO custDAO = new CustomerDAO();
            String name = custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerName();
        %>
        
        <form role="form" action="EditProfile" method = "post" enctype='multipart/form-data'>
            Current Email: <input class="form-control" type="text" name="email">
            <br>
            Change Mobile Number: <input class="form-control" type="text" name="newNumber">
            <br>
            Upload/Change Profile Picture: <input class="form-control" type="file" name="photo">
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
