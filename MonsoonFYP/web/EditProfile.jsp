<%-- 
    Document   : EditProfile
    Created on : May 27, 2018, 7:36:34 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.entities.Customer"%>
<%@page import="com.tempest.daos.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tempest.daos.CustomerDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monsoon - Edit Profile</title>

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
        <script src="js/jquery.js"></script> 
        <script src="js/moment.min.js"></script> 
        <script src="js/combodate.js"></script> 
    </head>
    <body>
        <% CustomerDAO custDAO = new CustomerDAO();
            String name = custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerName();
        %>

        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top">
                <img src="img/Monsoon Hair Logo (Black).png" id="logo">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home </a>
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
                            <% 
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
                <div class="col-12">   
                    <form role="form" action="EditProfile" method = "post" enctype='multipart/form-data'>
                        <div class="col-12 mb-3">
                            <input name="email" type="hidden" class="form-control" value="<%= custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerEmail() %>">
                        </div>
                        
                        <div class="col-12 mb-3">
                            Change Email: <input name="newEmail" type="text" class="form-control" value="<%= custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerEmail() %>">
                        </div>

                        <div class="col-12 mb-3">
                            Change Contact Number: <input name="newNumber" type="text" class="form-control" value="<%= custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerNumber() %>">
                        </div>

                        <div class="col-12 mb-3">
                            <input name="photo" type="file" class="form-control">
                        </div>

                        <input type="submit" value="Submit" class="btn btn-lg btn-success btn-block mb-3">
                        <%
                            ArrayList<String> error = (ArrayList<String>) session.getAttribute("errorMsg");
                            if (error != null) {
                        %>
                        <br>
                        <%
                            for (String str : error) {
                                out.println(str);
                        %>
                        <br>
                        <%
                                }
                                session.setAttribute("errorMsg", null);
                            }
                        %>  
                    </form>
                    <a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="btn btn-lg btn-success btn-block "> </a> 
                </div>
            </div>
        </div>
    </body>
</html>
