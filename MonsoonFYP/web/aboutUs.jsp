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

    <title>Monsoon Hair Saloon - About Us</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/NavbarAndFooter.css" rel="stylesheet">
    <link href="blog.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/6F7421C3-831C-7744-9837-FFD4276FB677/main.js" charset="UTF-8"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
    <!--TimePicker-->
    <link type="text/css" href="css/bootstrap.min.css" />
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
        <nav class="navbar navbar-expand-md navbar-dark fixed-top mb-3">
        <img src="img/Monsoon Hair Logo (Black).png" id="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav m-auto">
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
                    <% CustomerDAO custDAO = new CustomerDAO();
                        if(custDAO!=null){
                         String name = custDAO.retrieveCustomer((String) session.getAttribute("username")).getCustomerName();
                         String capsName = name.substring(0, 1).toUpperCase() + name.substring(1);
                        
                    %>
                    <p>Welcome <%out.println(capsName + "!");}%></p>
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
                        


<!-- Container element -->
<div class="parallax">
                                    
        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light" style="background-image:url(img/Demo1.jpg); background-repeat: no-repeat, repeat;background-size: cover;">
            <div class="col-md-5 p-lg-5 mx-auto my-5">
              <h1 class="display-4 font-weight-normal">About Us</h1>
              <p class="lead font-weight-normal">And an even wittier subheading to boot. Jumpstart your marketing efforts with this example based on Apple's marketing pages.</p>
            </div>
            <div class="product-device box-shadow d-none d-md-block"></div>
            <div class="product-device product-device-2 box-shadow d-none d-md-block"></div>
          </div>

        <div class="section mt-5">
            <div class="row">
                <div class="col-lg-6">
                    <img class="featurette-image img-fluid mx-auto" src="img/headlines.jpg" alt="Generic placeholder image">
                </div>

                <div class="col-lg-6">
                    <h2>About Us</h2>
                    <p> 
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin dictum ligula sed purus efficitur, non sodales velit pretium. 
                        In eleifend ultricies tincidunt. Donec laoreet dapibus efficitur. Duis volutpat purus sit amet lectus hendrerit porta. Integer 
                        lacinia finibus tellus vitae eleifend. Vivamus ornare, neque sit amet lobortis hendrerit, neque nunc dignissim ipsum, 
                        vel feugiat sapien urna facilisis nisi. Curabitur malesuada mauris eu tempus dictum. Proin rutrum magna volutpat gravida fermentum.    
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin dictum ligula sed purus efficitur, non sodales velit pretium. 
                        In eleifend ultricies tincidunt. Donec laoreet dapibus efficitur. Duis volutpat purus sit amet lectus hendrerit porta. Integer 
                        lacinia finibus tellus vitae eleifend. Vivamus ornare, neque sit amet lobortis hendrerit, neque nunc dignissim ipsum, 
                        vel feugiat sapien urna facilisis nisi. Curabitur malesuada mauris eu tempus dictum. Proin rutrum magna volutpat gravida fermentum.
                    </p>


                </div>
            </div>

            <div class="row mt-5 ml-2">
                <div class="col-lg-6">
                     <h2>About Us</h2>
                    <p> 
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin dictum ligula sed purus efficitur, non sodales velit pretium. 
                        In eleifend ultricies tincidunt. Donec laoreet dapibus efficitur. Duis volutpat purus sit amet lectus hendrerit porta. Integer 
                        lacinia finibus tellus vitae eleifend. Vivamus ornare, neque sit amet lobortis hendrerit, neque nunc dignissim ipsum, 
                        vel feugiat sapien urna facilisis nisi. Curabitur malesuada mauris eu tempus dictum. Proin rutrum magna volutpat gravida fermentum.    
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Proin dictum ligula sed purus efficitur, non sodales velit pretium. 
                        In eleifend ultricies tincidunt. Donec laoreet dapibus efficitur. Duis volutpat purus sit amet lectus hendrerit porta. Integer 
                        lacinia finibus tellus vitae eleifend. Vivamus ornare, neque sit amet lobortis hendrerit, neque nunc dignissim ipsum, 
                        vel feugiat sapien urna facilisis nisi. Curabitur malesuada mauris eu tempus dictum. Proin rutrum magna volutpat gravida fermentum.
                    </p>
                </div>
                <div class="col-lg-6">
                    <img class="featurette-image img-fluid mx-auto" src="img/headlines.jpg" alt="Generic placeholder image">
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
