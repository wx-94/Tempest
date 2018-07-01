<%-- 
    Document   : ChangePassword
    Created on : 12 May, 2018, 11:20:46 AM
    Author     : Xuan
--%>

<%@page import="com.tempest.daos.CustomerDAO"%>
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
        <link href="css/log.css" rel="stylesheet">


        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>


    <body background="img/blurImage_Demo1.jpg">

        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top">
                <a class="navbar-brand" href="#">Monsoon</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Homepage.jsp">Home</a>
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

        <div class="container">
            <form>
                <div class="wrapper">
                    <form class="form-signin" action="changepassword" method = "post"  style="border-radius:5%">        
                        <h2 class="form-signin-heading" style="text-align:center">MONSOON lOGO</h2>
                        <img src="#" class="img-responsive" alt="" />
                        <!--first row-->
                        <div class="form-row">
                            <div class="col-md-12 mb-3">
                                <!--<label for="validationServer01">Name</label>-->
                                <input type="text" class="form-control is-valid" id="validationServer01" name="username" placeholder="username" value="Email" required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                            <div class="col-md-12 mb-3">
                                <!--<label for="validationServer02">Mobile Number</label>-->
                                <input type="text" class="form-control is-valid" id="validationServer02" name="oldpassword" placeholder="oldpassword" value="Old Password" required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>

                            <div class="col-md-12 mb-3">
                                <!--<label for="validationServerUsername">Email</label>-->
                                <div class="input-group">
                                    <input type="text" class="form-control is-invalid" id="validationServerUsername" name="newpassword"  placeholder="New password" aria-describedby="inputGroupPrepend3" required>
                                    <div class="invalid-feedback">
                                        Please choose a username.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--second row-->
                        <div class="form-row">
                            <div class="col-md-12 mb-3">
                                <!--<label for="validationServer04">Confirm Password</label>-->
                                <input type="text" class="form-control is-invalid" id="validationServer04" name="confirmnewpassword" placeholder="Confirm Password" required>
                                <div class="invalid-feedback">
                                    Password and confirm password does not match.
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
                                <label class="form-check-label" for="invalidCheck3">
                                    Agree to terms and conditions
                                </label>
                                <div class="invalid-feedback">
                                    You must agree before submitting.
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit" value="Submit">Submit form</button>
                </div>
                <br>
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
        </div>
    </body>
</html>
