<%-- 
    Document   : AppointmentBooking
    Created on : 17 May, 2018, 9:28:46 PM
    Author     : jacky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Booking</title>
    </head>
    <body>
        <form role="form" action="appointmentBooking" method = "post">
            <%
                //check if customer has already login
                String username = (String) session.getAttribute("username");
                String password = (String) session.getAttribute("password");
                if (username != null && password != null){
                
                }
            %>
            
            <input class="form-control" type="text" name="username" placeholder="Username/Email">
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
            <%
                String msg = (String) session.getAttribute("success");
                if (msg!= null){
                    out.println(msg);
                    session.setAttribute("success", null);
                }
                %>
        </form>
    </body>
</html>
