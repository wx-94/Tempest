<%-- 
    Document   : AdminViewAllAppointments
    Created on : 4 Jun, 2018, 3:22:57 PM
    Author     : jacky
--%>

<%@page import="com.tempest.entities.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tempest.daos.AppointmentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Appointments Made</title>
    </head>
    <body>
        <form role="form" action="ShiftAppointmentWhenCompletedController" method = "post">    
            <%  
                AppointmentDAO appointmentDAO = new AppointmentDAO();                
                ArrayList<Appointment> appointmentList = appointmentDAO.retrieveAllAppointments();
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
            <input type="submit" value="Completed Appointments" >            
        </form>                
        <a href="AdminHomepage.jsp"> Go back</a>
    </body>
</html>
