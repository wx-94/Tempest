<%-- 
    Document   : ChangePassword
    Created on : 12 May, 2018, 11:20:46 AM
    Author     : Xuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Page</title>
    </head>
    <body>
        <form role="form" action="changepassword" method = "post">
            <input class="form-control" type="password" name="oldpassword" placeholder="Old Password">
            <br>
            <input class="form-control" type="password" name="newpassword" placeholder="New Password">
            <br>
            <input class="form-control" type="password" name="confirmnewpassword" placeholder="Confirm New Password">
            <br>
            <input type="submit" value="Submit" class="btn btn-lg btn-success btn-block">
        </form>
    </body>
</html>
