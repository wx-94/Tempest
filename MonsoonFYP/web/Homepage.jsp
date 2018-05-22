<%-- 
    Document   : Homepage
    Created on : 12 May, 2018, 12:04:37 AM
    Author     : jacky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
    </head>
    <body>
        <h1>Welcome back!</h1>
        <br>
        <a href="AppointmentBooking.jsp"> Book Appointment </a>
        <br>
        <a href="ViewAppointments.jsp"> View Appointments </a>
        <br>
        <form action="viewAppointments" method="post">
            <a href="ViewAppointments.jsp">View Appointments</a>
            <input type="hidden" name="mess" value="View Appointments"/>
        </form>
        <br>
        <a href="ProcessLogOut.jsp"> Log out </a>
    </body>
</html>
