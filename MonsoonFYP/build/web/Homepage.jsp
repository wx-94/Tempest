<%-- 
    Document   : Homepage
    Created on : 12 May, 2018, 12:04:37 AM
    Author     : jacky
--%>

<%@page import="com.tempest.daos.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
    </head>
    <body>
        <% CustomerDAO custDAO = new CustomerDAO();
            String name = custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerName();
            String capsName = name.substring(0, 1).toUpperCase() + name.substring(1);
        %>
        <h1>Welcome <%out.println(capsName + "!");%></h1>
        <br>
        <%
            String msg = (String) session.getAttribute("success");
            if (msg != null) {
                out.println(msg);
                session.setAttribute("success", null);
            }
        %>
        <br>
        <a href="EditProfile.jsp"> Edit Profile </a>
        <br>
        <a href="AppointmentBooking.jsp"> Book Appointment </a>
        <br>
        <a href="viewAppointments"> View Appointments </a>
        <br>
        <a href="viewAppointmentsHistory"> View Appointments History </a>
        <br>
        <a href="ViewLoyaltyPointsHistoryController"> View Loyalty Points History </a>
        <br>
        <a href="ProcessLogOut.jsp"> Log out </a>
    </body>
</html>
