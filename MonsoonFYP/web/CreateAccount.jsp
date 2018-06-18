<%-- 
    Document   : CreateAccount
    Created on : May 13, 2018, 11:07:56 AM
    Author     : Xuan
--%>

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

            <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/6F7421C3-831C-7744-9837-FFD4276FB677/main.js" charset="UTF-8"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    
    </head>
    
    
    <body background="img/blurImage_Demo1.jpg">
        
        
        <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <img src="img/Monsoon Hair Logo (Black).png" id="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav m-auto">
            <li class="nav-item">
              <a class="nav-link" href="#">Home</a>
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
                  <p>Account cart to be displayed</p>
                </div>
            </div>
        </div>
      </nav>
    </header>
        
        
        
    <div class="container">    
        <div class="wrapper">
            <form class="form-signin" action="createaccount" method = "post"  style="border-radius:5%">       
                <h2 class="form-signin-heading" style="text-align:center">MONSOON lOGO</h2>
                <img src="#" class="img-responsive" alt="" />
             
            <div class="form-row">
                
                <div class="col-md-12 mb-3">
                 <!--<label for="validationServer01">Name</label>-->
                 <input type="text" name="name" class="form-control is-valid" id="validationServer01"  placeholder="Name" value="Username" required>
                 <div class="valid-feedback">
                   Looks good!
                 </div>
               </div>
                 
                <div class="col-md-12 mb-3">
                  <!--<label for="validationServer02">Mobile Number</label>-->
                  <input type="text" name="mobile" class="form-control is-valid" id="validationServer02"  placeholder="mobilenumber" value="Mobile Number" required>
                  <div class="valid-feedback">
                    Looks good!
                  </div>
                </div>
                 
                <div class="col-md-12 mb-3">
                  <!--<label for="validationServerUsername">Email</label>-->
                  <div class="input-group">
                    <input type="text" name="email" class="form-control is-invalid" id="validationServerUsername"  placeholder="Email" aria-describedby="inputGroupPrepend3" required>
                    <div class="invalid-feedback">
                      Please choose a username.
                    </div>
                  </div>
                </div>
            </div>
             
            <div class="form-row">
              <div class="col-md-12 mb-3">
                <!--<label for="validationServer03">Password</label>-->
                <input type="password" name="password" class="form-control is-invalid" id="validationServer03"  placeholder="Password" required>
                <div class="invalid-feedback">
                  Please provide a valid password. 
                </div>
              </div>
              <div class="col-md-12 mb-3">
                <!--<label for="validationServer04">Confirm Password</label>-->
                <input type="password" name="confirmPassword" class="form-control is-invalid" id="validationServer04"  placeholder="Confirm Password" required>
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
                
        <button class="btn btn-primary" type="submit">Submit form</button>
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
    </div>
    </body>
</html>
