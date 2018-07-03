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

        <title>Monsoon Hair Saloon - DashBoard</title>

        <!-- Bootstrap core CSS -->
        <!--Need to fix the issue of bootstrap file not loading-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/log.css" rel="stylesheet">
        <!--<<l!--temp link-->
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>


        <style>
            .table-wrapper-2 {
                display: block;
                max-height: 300px;
                overflow-y: auto;
                -ms-overflow-style: -ms-autohiding-scrollbar;
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
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="AdminHomepage.jsp">Home</a>
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
                            <a class="nav-link" href="contactUs.jsp">Contact Us</a>
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
                            <a href="AdminEditProductDetails.jsp">Edit Item Information</a></br>
                            <a href="ViewStaffAvailabilityController">View Staff Availability</a></br>
                            <a href="ProcessLogOut.jsp">Log Out</a>

                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <div class="container mt-5">
            <div class="row">
                <div class="col-12 mb-5 mt-5">n n  

            </div>   
        </div>
    </body>
</html>
