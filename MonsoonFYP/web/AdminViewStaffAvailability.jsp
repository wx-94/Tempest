<%-- 
    Document   : AdminViewStaffAvailibility
    Created on : Jun 24, 2018, 4:25:38 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.entities.StaffAvailability"%>
<%@page import="com.tempest.daos.StaffAvailabilityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="favicon.ico">

        <title>Monsoon Hair Saloon - AdminViewStaffAvailibility</title>

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
                <img src="img/Monsoon Hair Logo.png" id="logo">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarCollapse">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="AdminHomepage.jsp">Home</a>
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
                            <a href="AdminViewStaffAvailability.jsp">View Current Appointments</a></br>
                            <a href="ProcessLogOut.jsp">Log Out</a>

                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <div class="container">
            <div class="row  mt-5">
                <div class="col-12">              
                    <form role="form" action="deleteStaffAvailability" method = "post">

                        <%
                            ArrayList<StaffAvailability> staffAvailabilityList = (ArrayList<StaffAvailability>) session.getAttribute("staffAvailabilityList");
                        %>

                        <%  if (staffAvailabilityList != null && !staffAvailabilityList.isEmpty()) {           %>

                        <table class="table table-hover" id="availability">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Stylist</th>
                                    <th scope="col">Outlet</th>
                                    <th scope="col">Available Date</th>
                                    <th scope="col">Available Start Time</th>
                                    <th scope="col">Available End Time</th>
                                    <th scope="col">Selected</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (StaffAvailability a : staffAvailabilityList) {
                                %> 
                                <tr>
                                    <td><%= a.getStaffAvailabilityID()%></td>
                                    <td><%= a.getStaffName()%></td>
                                    <td><%= a.getOutletName()%></td>
                                    <td><%= a.getAvailableDate()%></td>
                                    <td><%= a.getAvailableStartTime()%></td>
                                    <td><%= a.getAvailableEndTime()%></td>
                                    <td><input TYPE="checkbox" NAME="staffAvailabilityID" VALUE="<%=a.getStaffAvailabilityID()%>"></td>
                                </tr>

                                <%
                                    }
                                } else {
                                %>
                            <h1>No schedule available!</h1>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <%  if (staffAvailabilityList != null && !staffAvailabilityList.isEmpty()) {           %>
                        <input type="submit" value="Delete Availability" >
                        <%
                            }
                        %>
                    </form><br>
                    <br>
                    <a href="AddNewAvailability.jsp" style="text-decoration:none"> <input type="submit" value="Add New Availability" class="col-3 btn btn-lg btn-success btn-block "> </a> 
                    <a href="AdminHomepage.jsp" style="text-decoration:none"> <input  value="Back" class="col-3 btn btn-lg btn-success btn-block mt-3"> </a>   
        </div>
    </body>
</html>
