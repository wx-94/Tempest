<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="Monsoon The Hair Phenomenon">
            <meta name="author" content="">
            <link rel="icon" href="favicon.ico">

            <title>Monsoon Hair Saloon - Create Account</title>
            <link href="css/bootstrap.min.css" rel="stylesheet">
            
            <!--- Style Sheets --->
            <link href="css/carousel.css" rel="stylesheet">
            <link href="css/NavbarAndFooter.css" rel="stylesheet">
            <link href="css/log.css" rel="stylesheet">
            <!--- Scripts --->
            <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
            <script type="text/javascript" src="js/jquery.validate.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            
            <style>
                header{
                    margin-bottom: 8%;
                }
                
                #logoCreate{
                    max-width: 100%;
                    max-height: 90%;
                }
            </style>
    </head>

    <body background="img/blurImage_Demo1.jpg">
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
                      <p>Account cart to be displayed</p>
                    </div>
                </div>
            </div>
          </nav>
    </header>
        
    <div class="container">
        <div class="wrapper">
             <form class="form-signin" id="signupForm" method="post" class="form-horizontal" action="createaccount">
                <img src="img/Monsoon Hair Logo.png" id="logoCreate">
                <div class="form-group mt-3">
                    <label class="col-sm-12 control-label" >User Id</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" id="id" name="id" placeholder="User Id" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-12 control-label">Old Password</label>
                    <div class="col-sm-12">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-12 control-label">New password</label>
                    <div class="col-sm-12">
                            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New password" required/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-12 control-label">Confirm password</label>
                    <div class="col-sm-12">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" required/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12 col-sm-offset-4">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="agree" name="agree" value="agree" />Please agree to our policy
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-4">
                        <button type="submit" class="btn btn-primary">Submit</button>
                            <%
                            ArrayList<String> errorList = (ArrayList<String>) session.getAttribute("errorMsg");
                            if (errorList != null) {
                             %>
                            <br>
                            <%
                                for (String str : errorList) {
                                    out.println(str);
                            %>
                            <br>
                            <%
                                    }
                                    session.setAttribute("errorMsg", null);
                                }
                            %>
                    </div>
                </div>
            </form>
        </div>
    </div>
        <script type="text/javascript">
        //  $.validator.setDefaults( {
        //          submitHandler: function () {
        //                  alert( "submitted!" );
        //          }
        //  } );

          $( document ).ready( function () {
                $( "#signupForm" ).validate( {
                        rules: {
                                id: "required",

                                newPassword: {
                                    required: true,
                                    minlength: 8,
                                    numCheck: true,
                                    upperCaseLetterCheck: true,
                                    lowerCaseLetterCheck: true,
                                    specialCharacterCheck: true
                                },
                                confirmPassword: {
                                    required: true,
                                    minlength: 8,
                                    equalTo: "#password"
                                },

                                agree: "required"
                        },
                        messages: {
                                name: "Please enter your name",
                               
                                password: {
                                    required: "Please provide a new password",
                                    minlength: "Your password must be at least 8 characters long"
                                },
                                confirmPassword: {
                                    required: "Please confirm your password",
                                    minlength: "Your password must be at least 8 characters long",
                                    equalTo: "Please enter the same password as above"
                                },
                                agree: "Please accept our policy"
                        },

                        errorElement: "em",
                        
                        errorPlacement: function ( error, element ) {
                                // Add the `help-block` class to the error element
                                error.addClass( "help-block" );

                                if ( element.prop( "type" ) === "checkbox" ) {
                                        error.insertAfter( element.parent( "label" ) );
                                } else {
                                        error.insertAfter( element );
                                }
                        },
                        highlight: function ( element, errorClass, validClass ) {
                                $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
                        },
                        unhighlight: function (element, errorClass, validClass) {
                                $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
                        }
                        
                } );
                       //Method to check if phone number start with 8 or 9
                       jQuery.validator.addMethod("phoneSG", function(value, element) {
                          phoneNumberFirst = value.charAt(0);     
                          return phoneNumberFirst == 8 || phoneNumberFirst == 9
                      }, "Please enter a valid mobile number that starts with 8 or 9");
                      
                      //Password checks
                      //Contains at least 1 number
                      jQuery.validator.addMethod("numCheck", function(value, element) {
                            if (value.search(/\d/) == -1) {
                                return false;
                            } 
                          return true
                      }, "Password must contain at least 1 numeric digit");
                      
                      //Contains at least 1 lower case letter
                      jQuery.validator.addMethod("lowerCaseLetterCheck", function(value, element) {
                            if (value.search(/[a-z]/) == -1) {
                                return false;
                            } 
                          return true
                      }, "Password must contain at least 1 lower-case letter");
                      
                      //Contains at least 1 upper case letter
                      jQuery.validator.addMethod("upperCaseLetterCheck", function(value, element) {
                            if (value.search(/[A-Z]/) == -1) {
                                return false;
                            } 
                          return true
                      }, "Password must contain at least 1 upper-case letter");   
                      
                      //Contains at least 1 special character
                      jQuery.validator.addMethod("specialCharacterCheck", function(value, element) {
                            if (value.search(/[\W\s_]/) == -1) {
                                return false;
                            } 
                          return true
                      }, "Password must contain at least 1 special character");
          } );
        </script>
    </body>
</html>