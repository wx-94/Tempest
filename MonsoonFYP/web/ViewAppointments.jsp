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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="favicon.ico">

        <title>Monsoon Hair Saloon - Appointment</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">


        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link href="blog.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/6F7421C3-831C-7744-9837-FFD4276FB677/main.js" charset="UTF-8"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />

        <!--TimePicker-->
        <link type="text/css" href="css/bootstrap.min.css" />
        <link type="text/css" href="css/bootstrap-timepicker.min.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>


        <style>

        </style>
    </head>

    <body>
        <form role="form" action="DeleteAndUpdateAppointmentController" method = "post">    
            <%
                ArrayList<Appointment> appointmentList = (ArrayList<Appointment>) session.getAttribute("appointmentList");
            %>

            <%  if (appointmentList != null && !appointmentList.isEmpty()) {           %>
            <table id="appointments">
                <thead>
                    <tr>
                        <th>Appointment ID</th>
                        <th>Outlet</th>
                        <th>Stylist</th>
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
                        <td><%= a.getOutlet()%></td>
                        <td><%= a.getStaff()%></td>
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
            <%
                String errorMessage = (String) request.getAttribute("errorMsg");

                if (errorMessage != null) {
                    out.println(errorMessage);
                }
            %>
            <input type="submit" name="update" value="Update Appointment" >  
            <input type="submit" name="cancel" value="Cancel Appointment" >
        </form>                
        <a href="Homepage.jsp"> Return to Homepage</a>
    </body>
</html>
