<%-- 
    Document   : viewAppointments
    Created on : May 22, 2018, 7:30:52 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.utility.DateConverter"%>
<%@page import="com.tempest.entities.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointments Made</title>
    </head>
    <body>
        <form role="form" action="DeleteAppointmentController" method = "post">    
        <%
            ArrayList<Appointment> appointmentList = (ArrayList<Appointment>) session.getAttribute("appointmentList");
        %>

        <%  if (appointmentList != null && !appointmentList.isEmpty()) {           %>
        <table id="appointments">
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Staff</th>
                    <th>Outlet</th>
                    <th>Treatment</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Selected</th>
                </tr>
            </thead>

            <tbody >            
                <%
                    for (Appointment a : appointmentList) {
                %> 
                <tr>
                    <td><%= a.getAppointmentID()%></td>
                    <td><%= a.getStaff()%></td>
                    <td><%= a.getOutlet()%></td>
                    <td><%= a.getTreatment()%></td>
                    <td><%= a.getDateOfAppointment()%></td>
                    <td><%= a.getStartTimeOfAppointment()%></td>
                    <td><%= a.getEndTimeOfAppointment()%></td> 
                    <td><input TYPE="checkbox" NAME="appointment" VALUE="<%=a.getAppointmentID()%>"></td>
                </tr>

                <%
                    }
                } else {
                %>
                <h1>No bookings made!</h1>
                <%
                    }
                %>
                </tbody>
        </table>
                <input type="submit" value="Cancel Appointment" >
            </form>                
        <a href="Homepage.jsp"> Go back</a>
    </body>
</html>
