<%-- 
    Document   : AddNewAvailability
    Created on : Jun 24, 2018, 5:19:14 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.entities.Staff"%>
<%@page import="com.tempest.daos.StaffDAO"%>
<%@page import="com.tempest.entities.Outlet"%>
<%@page import="com.tempest.daos.OutletDAO"%>
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
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <title>Monsoon Hair Saloon - Add New Availability</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link href="css/blog.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />

        <!--TimePicker-->
        <link type="text/css" href="css/bootstrap.min.css" />
        <link type="text/css" href="css/bootstrap-timepicker.min.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>

        <script src="js/jquery.js"></script> 
        <script src="js/moment.min.js"></script> 
        <script src="js/combodate.js"></script> 

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
                margin-top: 10%;
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
                <img src="img/Monsoon Hair Logo.png" id="logo">
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
                            <%-- CustomerDAO custDAO = new CustomerDAO();
                             String name = custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerName();
                             String capsName = name.substring(0, 1).toUpperCase() + name.substring(1);
                            --%>
                            <p>Welcome <%--out.println(capsName + "!");--%></p>
                            <br>
                            <%
                                String msg = (String) session.getAttribute("success");
                                if (msg != null) {
                                    out.println(msg);
                                    session.setAttribute("success", null);
                                }
                            %>
                            <!--<p>Account cart to be displayed</p>-->
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

        <div class ="container">
            <div class="row">
                <!--User Selection form-->
                <div class="col-12">
                    <div class="card " id="apptMenu" >
                        <div class="card-body">                           
                            <form role="form" action="addStaffAvailability" method = "post">
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
                                    <label>Select Availability Date</label>
                                    <!--<input type="text" id="date" data-format="DD-MM-YYYY" data-template="D MMM YYYY" name="date" value="01-01-2018">-->
                                    <!--<input type="text" id="datepicker" name="date" data-format="DD-MM-YYYY" data-template="D MMM YYYY" value="01-01-2018"/>-->
                                    <input type="date" name="date" style="width:100%">
                                </div>

                                <!-- <div class="input-group bootstrap-timepicker timepicker">
                                      <input id="timepicker1" type="text" class="form-control input-small">
                                      <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                  </div>-->


                                <div class="form-group col-md-12">
                                    <label>Select Availability Start Time</label>
                                    <!--<input id="timepicker1"  type="text" name="time" class="form-control input-small">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>-->

                                    <input type="text" id="startTime" data-format="HH:mm" data-template="HH : mm" name="startTime">
                                    <script>
                                        $(function () {
                                            $('#time').combodate({
                                                firstItem: 'name', //show 'hour' and 'minute' string at first item of dropdown
                                                minuteStep: 30
                                            });
                                        });
                                    </script>

                                </div>

                                <div class="form-group col-md-12">
                                    <label>Select Availability End Time</label>
                                    <!--<input id="timepicker1"  type="text" name="time" class="form-control input-small">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>-->

                                    <input type="text" id="endTime" data-format="HH:mm" data-template="HH : mm" name="endTime">
                                    <script>
                                        $(function () {
                                            $('#time').combodate({
                                                firstItem: 'name', //show 'hour' and 'minute' string at first item of dropdown
                                                minuteStep: 30
                                            });
                                        });
                                    </script>

                                </div>

                                <input type="submit" value="Add Staff Availability" class="btn btn-lg btn-success btn-block mb-2">    
                            </form>
                            <a href="AdminHomepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="btn btn-lg btn-success btn-block"> </a> 
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

        <script>
            //            uiLibrary: 'bootstrap4'
            $('#datepicker').datepicker({
                //        uiLibrary: 'bootstrap4'
                format: "dd-mm-yyyy"

            });
        </script>

        <script type="text/javascript">
            $('#timepicker1').timepicker();
        </script>
    </body>
</html>
