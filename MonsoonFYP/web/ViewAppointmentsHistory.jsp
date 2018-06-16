<%-- 
    Document   : ViewAppointmentsHistory
    Created on : May 29, 2018, 2:22:57 PM
    Author     : Xuan
--%>

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

    <title>Monsoon Hair Saloon</title>

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
        .navbar-dark .navbar-nav .nav-link {
           color: white;
        }
    </style>
    </head>
    <body>
        <!--Navigation Bar-->
        <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <img src="img/Monsoon Hair Logo (Black).png" width="200" height="75" id="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav m-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
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
        
        <!--User Account and Shopping Cart-->
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
                  <p>Account cart to be displayed</p>
                </div>
            </div>
        </div>
      </nav>
    </header>
        
        <div class ="container mt-5">
            <div class="row">
                <div class="col-12">
                <%
                    ArrayList<Appointment> appointmentList = (ArrayList<Appointment>) session.getAttribute("appointmentList");
                %>

                <%  if (appointmentList != null && !appointmentList.isEmpty()) { %>
                    <table class="table table-hover" id="appointments"> 
                        <thead>
                          <tr class="bg-warning">
                            <th scope="col">Appointment ID</th>
                            <th scope="col">Outlet</th>
                            <th scope="col">Treatment</th>
                            <th scope="col">Date</th>
                            <th scope="col">Start Time</th>
                            <th scope="col">End Time</th>
                            <th scope="col">Selected</th>
                            <th scope="col"></th>
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
                <a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="btn btn-lg btn-success btn-block "> </a> 
                </div>
            </div>         
        </div>
        </tbody>
    </table>
</body>
</html>
