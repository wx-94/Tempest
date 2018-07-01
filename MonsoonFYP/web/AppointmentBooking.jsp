<!DOCTYPE HTML>
<%@page import="com.tempest.daos.HairServicesDAO"%>
<%@page import="com.tempest.entities.HairServices"%>
<%@page import="com.tempest.daos.StaffDAO"%>
<%@page import="com.tempest.entities.Staff"%>
<%@page import="com.tempest.daos.OutletDAO"%>
<%@page import="com.tempest.entities.Outlet"%>
<%@page import="com.tempest.daos.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <title>Monsoon Hair Saloon - Appointment Booking</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Style Sheets -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link href="css/blog.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link type="text/css" href="css/bootstrap.min.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <!--TimePicker-->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

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
            #apptMenu{
                margin-top: 20%;
            }

            #shopLocationCard{
                margin-top: 4.5%;
            }

            .username{
                text-align: center;
            } 

            .navbar-dark .navbar-nav .nav-link {
                color:black;
            }
        </style>
    </head>

    <body>
        <!--Navigation Bar-->
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top">
                <img src="img/Monsoon Hair Logo (Black).png" id="logo">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Homepage.jsp">Home </a>
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
                            <%
                                CustomerDAO custDAO = new CustomerDAO();
                                String name = custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerName();
                                String capsName = name.substring(0, 1).toUpperCase() + name.substring(1);
                            %>
                            <p>Welcome <%out.println(capsName + "!");%></p>
                            <br>
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
                <!--User Selection form-->
                <div class="col-3">
                    <div class="card w-10 " id="apptMenu" >
                        <div class="card-body">                           
                            <form role="form" action="bookAppointment" method = "post">
                                <!--                                <div class="username col-md-12 text center mb-3 ">
                                                                    Username
                                <% out.print((String) session.getAttribute("username"));%>
                                </div>-->
                                <input class="form-control" type="text" name="username" value=<% out.print((String) session.getAttribute("username"));%>

                                       <div class="form-group col-md-12">
                                    <label>Select Outlet</label>
                                    <select id="inputState" name="outletChosen" class="form-control">                                 
                                        <%  ArrayList<Outlet> totalOutlets = OutletDAO.retrieveAllOutlets();
                                            for (Outlet outlet : totalOutlets) {
                                        %>
                                        <option value="<%=outlet.getOutletName()%>"><%=outlet.getOutletName()%></option> 
                                        <% }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group col-md-12">
                                    <label>Select Stylist</label>
                                    <select id="inputState" name="stylistChosen" class="form-control">
                                        <%  ArrayList<Staff> staffs = StaffDAO.retrieveAllStaffs();
                                            for (Staff staff : staffs) {
                                                if (!staff.getStaffPosition().equals("cashier")) {
                                        %>
                                        <option value="<%=staff.getStaffName()%>"><%=staff.getStaffName()%></option> 
                                        <% }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group col-md-12">
                                    <label>Select Hair Service</label>
                                    <select id="inputState" name="hairService" class="form-control"> 
                                        <%  ArrayList<HairServices> hairService = HairServicesDAO.retrieveAllHairServices();
                                            for (HairServices hair : hairService) {%>
                                        <option value="<%=hair.getHairService()%>"><%=hair.getHairService()%></option> 
                                        <% }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group col-md-12">
                                    <label>Select Date</label>
                                    <input type="date" name="date" style="width:100%">
                                </div>

                                <div class="form-group col-md-12">
                                    <label>Select Time</label>
                                    <input type="text" id="time" data-format="HH:mm" data-template="HH : mm" name="time" class="time col-12">
                                    <script>
                                        $(document).ready(function () {
                                            $('input.time').timepicker({});
                                        });
                                        $('.time').timepicker({
                                            timeFormat: 'H:mm ',
                                            interval: 30,
                                            minTime: '10',
                                            maxTime: '6:00pm',
                                            defaultTime: '10',
                                            startTime: '10:00',
                                            dynamic: false,
                                            dropdown: true,
                                            scrollbar: true
                                        });
                                    </script>                              
                                </div>   
                                <%
                                    String msg = (String) session.getAttribute("success");
                                    if (msg != null) {
                                        out.println("<b><p style=color:red;font-size:12px;>");
                                        out.println(msg);
                                        out.println("</p></b>");
                                        session.setAttribute("success", null);
                                    }
                                %>
                                <input type="submit" value="Book Appointment" class="btn btn-lg btn-success btn-block mb-2">    
                            </form>
                            <a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="btn btn-lg btn-success btn-block"> </a> 

                        </div>
                    </div>


                    <div class="col-9" id="shopLocationCard"> 
                        <div class="card w-100 mb-5" >
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <img src="img/shop.jpg" alt="Smiley face" height="200" width="350">
                                    </div>

                                    <div class="col-6">
                                        <h5> MONSOON @ Novena Square, Novena</h5>
                                        <p> 238 Thomson Road, Novena Square #03-29/30 Singapore 307683</p>
                                        <p>  Weekdays : 11am - 9pm<br>
                                            Saturday: 11am - 8pm<br>
                                            Sunday & PH: 11am - 7pm</p>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card w-100 mb-5">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <img src="img/shop.jpg" alt="Smiley face" height="200" width="350">
                                    </div>

                                    <div class="col-6">
                                        <h5> MONSOON @ Novena Square, Novena</h5>
                                        <p> 238 Thomson Road, Novena Square #03-29/30 Singapore 307683</p>
                                        <p>  Weekdays : 11am - 9pm<br>
                                            Saturday: 11am - 8pm<br>
                                            Sunday & PH: 11am - 7pm</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card w-100 mb-5">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <img src="img/shop.jpg" alt="Smiley face" height="200" width="350">
                                    </div>

                                    <div class="col-6">
                                        <h5> MONSOON @ Novena Square, Novena</h5>
                                        <p> 238 Thomson Road, Novena Square #03-29/30 Singapore 307683</p>
                                        <p>  Weekdays : 11am - 9pm<br>
                                            Saturday: 11am - 8pm<br>
                                            Sunday & PH: 11am - 7pm</p>                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>      



            <!-- Footer -->
            <footer class="page-footer font-small blue-grey lighten-5 mt-4">

                <div style="background-color: #000205;">
                    <div class="container">

                        <!-- Grid row-->
                        <div class="row py-4 d-flex align-items-center">

                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                                <h6 class="mb-0">Get connected with us on social networks!</h6>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-7 text-center text-md-right">

                                <!-- Facebook -->
                                <a class="fb-ic">
                                    <i class="fa fa-facebook white-text mr-4"> </i>
                                </a>
                                <!-- Twitter -->
                                <a class="tw-ic">
                                    <i class="fa fa-twitter white-text mr-4"> </i>
                                </a>
                                <!--Instagram-->
                                <a class="ins-ic">
                                    <i class="fa fa-instagram white-text"> </i>
                                </a>

                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row-->

                    </div>
                </div>

                <!-- Footer Links -->
                <div class="container text-center text-md-left mt-5">

                    <!-- Grid row -->
                    <div class="row mt-3 dark-grey-text">

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mb-4">

                            <!-- Content -->
                            <h6 class="text-uppercase font-weight-bold">Company name</h6>
                            <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                            <p>Here you can use rows and columns here to organize your footer content. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

                            <!-- Links -->
                            <h6 class="text-uppercase font-weight-bold">Products</h6>
                            <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                            <p>
                                <a class="dark-grey-text" href="#!">MDBootstrap</a>
                            </p>
                            <p>
                                <a class="dark-grey-text" href="#!">MDWordPress</a>
                            </p>
                            <p>
                                <a class="dark-grey-text" href="#!">BrandFlow</a>
                            </p>
                            <p>
                                <a class="dark-grey-text" href="#!">Bootstrap Angular</a>
                            </p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

                            <!-- Links -->
                            <h6 class="text-uppercase font-weight-bold">Services</h6>
                            <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                            <p>
                                <a class="dark-grey-text" href="#!">Your Account</a>
                            </p>
                            <p>
                                <a class="dark-grey-text" href="#!">Become an Affiliate</a>
                            </p>
                            <p>
                                <a class="dark-grey-text" href="#!">Shipping Rates</a>
                            </p>
                            <p>
                                <a class="dark-grey-text" href="#!">Help</a>
                            </p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

                            <!-- Links -->
                            <h6 class="text-uppercase font-weight-bold">Contact</h6>
                            <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                            <p>
                                <i class="fa fa-home mr-3"></i> Singapore</p>
                            <p>
                                <i class="fa fa-envelope mr-3"></i> info@example.com</p>
                            <p>
                                <i class="fa fa-phone mr-3"></i> + 01 234 567 88</p>
                            <p>
                                <i class="fa fa-print mr-3"></i> + 01 234 567 89</p>

                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row -->

                </div>
                <!-- Footer Links -->

                <!-- Copyright -->
                <div class="footer-copyright text-center text-black-50 py-3">© 2018 Copyright:
                    <a class="dark-grey-text" href="https://mdbootstrap.com/bootstrap-tutorial/"> Monsoon.com</a>
                </div>
                <!-- Copyright -->
            </footer>
    </body>
</html>



