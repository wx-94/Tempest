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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link href="blog.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--- Scripts --->
        <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Homepage.jsp">Home </a>
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
                            <%
                                String capsName = name.substring(0, 1).toUpperCase() + name.substring(1);
                            %>
                            <p>Welcome <%out.println(capsName + "!");%></p>
                            <br>
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
                <div class="col-12 border border-dark mt-5">   
                    <form role="form" id="editProfileForm" action="EditProfile" method = "post" enctype='multipart/form-data'>
                        <div class="col-12 mb-3">
                            <input name="email" type="hidden" class="form-control" value="<%= custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerEmail()%>">
                        </div>

                        <div class="col-12 mb-3">
                            Change Email: <input name="newEmail" type="text" id="email" class="form-control" value="<%= custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerEmail()%>" required>
                        </div>

                        <div class="col-12 mb-3">
                            Change Contact Number: <input name="newNumber" type="text" id="mobile" class="form-control" value="<%= custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerNumber()%>" required>
                        </div>

                        <div class="col-12 mb-3">
                            <input name="photo" type="file" class="form-control">
                        </div>

                        <input type="submit" value="Submit" class="col-6 btn btn-lg btn-success btn-block mb-3">
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
                        <%
                            String msg = (String) session.getAttribute("success");
                            if (msg != null) {
                                out.println("<p style='color:red'>" + msg + "</p>");
                                session.setAttribute("success", null);
                            }
                        %>
                    </form>
                    <a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="col-6 btn btn-lg btn-success btn-block mb-3 "> </a>
                </div>
            </div>
        </div>

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
        <script type="text/javascript">
//  $.validator.setDefaults( {
//          submitHandler: function () {
//                  alert( "submitted!" );
//          }
//  } );
            $(document).ready(function () {
                $("#editProfileForm").validate({
                    rules: {
                        mobile: {
                            required: true,
                            digits: true,
                            maxlength: 8,
                            minlength: 8,
                            phoneSG: true
                        },
                        email: {
                            required: true,
                            email: true
                        }
                    },
                    messages: {
                        mobile: {
                            required: "Please enter your mobile number",
                            digits: "Please enter only numeric digits",
                            minlength: "Your mobile number must consist of 8 numeric digits only",
                            maxlength: "Your mobile number must consist of 8 numeric digits only",
                        },
                        email: "Please enter a valid email address"
                    },
                    errorElement: "em",
                    errorPlacement: function (error, element) {
                        // Add the `help-block` class to the error element
                        error.addClass("help-block");

                        if (element.prop("type") === "checkbox") {
                            error.insertAfter(element.parent("label"));
                        } else {
                            error.insertAfter(element);
                        }
                    },
                    highlight: function (element, errorClass, validClass) {
                        $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
                    },
                    unhighlight: function (element, errorClass, validClass) {
                        $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
                    }

                });
                //Method to check if phone number start with 8 or 9
                jQuery.validator.addMethod("phoneSG", function (value, element) {
                    phoneNumberFirst = value.charAt(0);
                    return phoneNumberFirst == 8 || phoneNumberFirst == 9
                }, "Please enter a valid mobile number that starts with 8 or 9");
            });
        </script>
    </body>
</html>
