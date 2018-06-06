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
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Monsoon Hair Saloon - AdminViewAllAppointments</title>

    <!-- Bootstrap core CSS -->
    <!--Need to fix the issue of bootstrap file not loading-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--temp link-->
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
    
    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/NavbarAndFooter.css" rel="stylesheet">
    <link href="blog.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/6F7421C3-831C-7744-9837-FFD4276FB677/main.js" charset="UTF-8"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
    
    <style>
    .carousel-item > img {
        position: absolute;
        top: 0;
        left: 0;
        min-width: 100%;
        height: 47rem;
    }
    
    
    .carousel-item {
        height: 40rem;
        background-color: #777;
    }
    </style>
    </head>
    
    <body>
             
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <img src="img/Monsoon Hair Logo (Black).png" id="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav m-auto">
            <li class="nav-item active">
              <a class="nav-link" href="Homepage.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Hair Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Outlets</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Tutorials</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">E-store</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Appointment Management</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact Us</a>
            </li>
          </ul>
        </div>
        
        <div class="admin">
            
            <div class="dropdown">
            <img src="img/cart.svg" width="30" height="30">
                <div class="dropdown-content">
                  <p>Shopping cart to be displayed</p>
                </div>
            </div>
            
            <div class="dropdown">
            <img src="img/account.svg" width="30" height="30">
                <div class="dropdown-content">
              
                <a href="viewInventory">View Inventory</a><br>
                <a href="AdminViewAllAppointments.jsp">View Current Appointments</a></br>
                <a href="ProcessLogOut.jsp">Log Out</a>
                    
                </div>
            </div>
            
<!--            <img src="img/cart.svg" />
            <img src="img/account.svg" />-->
        </div>
      </nav>
    </header>
        
        <div class="container mt-5">
        
        <form role="form" action="ShiftAppointmentWhenCompletedController" method = "post">    
            <%  
                AppointmentDAO appointmentDAO = new AppointmentDAO();                
                ArrayList<Appointment> appointmentList = appointmentDAO.retrieveAllAppointments();
            %>

            <%  if (appointmentList != null && !appointmentList.isEmpty()) {           %>
            
            <table class="table table-hover" id="appointments">
                <thead>
                  <tr>
                    <th scope="col">Appointment ID</th>
                    <th scope="col">Staff</th>
                    <th scope="col">Outlet</th>
                    <th scope="col">Date</th>
                    <th scope="col">Treatment</th>
                    <th scope="col">Start Time</th>
                    <th scope="col">End Time</th>
                    <th scope="col">Selected</th>
                  </tr>
                </thead>
                <tbody>
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
          <!--  <input type="submit" value="Completed Appointments" > -->
        <button type="submit" class="btn btn-success mb-3">Completed Appointments</button>
        <br>
        <a href="AdminHomepage.jsp" style="text-decoration:none"> <input  value="Back" class="btn btn-success"> </a> 
        </form>       
        
    </div>
    </body>
</html>