<%-- 
    Document   : ViewAppointmentsHistory
    Created on : May 29, 2018, 2:22:57 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.entities.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tempest.daos.CustomerDAO"%>
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

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />

        <!--TimePicker-->
        <link type="text/css" href="css/bootstrap-timepicker.min.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>


        <style>
            .navbar-dark .navbar-nav .nav-link {
                color: black;
            }
        </style>
    </head>
    <body>
        <!--Navigation Bar-->
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top">
                <img src="img/Monsoon Hair Logo.png" id="logo">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Homepage.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="aboutUs.jsp">About Us</a>
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
                            <% CustomerDAO custDAO = new CustomerDAO();
                                String name = custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerName();
                                String capsName = name.substring(0, 1).toUpperCase() + name.substring(1);
                            %>
                            <p>Welcome <%out.println(capsName + "!");%></p>
                            <br>
                            <%
                                String msg = (String) session.getAttribute("success");
                                if (msg != null) {
                                    out.println(msg);
                                    session.setAttribute("success", null);
                                }
                            %>
                            <!--<p>Account cart to be displayed</p>-->
                            <a href="EditProfile.jsp"> Edit Profile </a>
                            <br>
                            <a href="ChangePassword.jsp">Change Password</a>
                            <br>
                            <a href="AppointmentBooking.jsp"> Book Appointment </a>
                            <br>
                            <a href="viewAppointments"> View Appointments </a>
                            <br>
                            <a href="viewAppointmentsHistory"> View Appointments History </a>
                            <br>
                            <a href="ViewLoyaltyPointsHistoryController"> View Loyalty Points History </a>
                            <br>
                            <a href="AddItemsToCart.jsp"> Add Items to Cart </a>
                            <br>
                            <a href="ProcessLogOut.jsp"> Log out </a>

                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <div class ="container mt-5">
            <div class="row">
                <div class="col-12 mt-5">
                    <%
                        ArrayList<Appointment> appointmentList = (ArrayList<Appointment>) session.getAttribute("appointmentList");
                    %>

                    <%  if (appointmentList != null && !appointmentList.isEmpty()) { %>
                    <table class="table table-hover" id="appointments"> 
                        <thead>
                            <tr class="bg-warning">
                                <th scope="col">Appointment ID</th>
                                <th scope="col">Stylist</th>
                                <th scope="col">Outlet</th>
                                <th scope="col">Treatment</th>
                                <th scope="col">Date</th>
                                <th scope="col">Start Time</th>
                                <th scope="col">End Time</th>
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
                    <a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="btn btn-lg btn-success btn-block col-3 "> </a> 
                </div>
            </div>         
        </div>
    </tbody>
</table>
</body>
</html>
