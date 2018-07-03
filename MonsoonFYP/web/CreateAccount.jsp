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
                    <label class="col-sm-12 control-label" >Full Name</label>
                    <div class="col-sm-12">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-12 control-label" >Mobile Number</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile Number" required/>
                        </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-12 control-label" >Email</label>
                    <div class="col-sm-12">
                            <input type="text" class="form-control" id="email" name="email" placeholder="Email" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-12 control-label">Password</label>
                    <div class="col-sm-12">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
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
                                <input type="checkbox" id="agree" name="agree" value="agree" /> Please agree to our policy
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
                      
<!--            <form class="needs-validation form-signin" novalidate action="createaccount" method = "post" id="createAccountform" >
                <h2 class="form-signin-heading" style="text-align:center">MONSOON lOGO</h2>
                <img src="#" class="img-responsive" alt="" />
                
                <div class="form-row">
                    
                    <div class="col-md-12 mb-3">
                 <label for="validationCustom01">Name</label>
                 <input type="text" name="name" class="form-control" id="validationCustom01"  placeholder="Name"  required>
                 <div class="valid-feedback">
                   Looks good!
                 </div>
               </div>
                    
                    <div class="col-md-12 mb-3">
                  <label for="validationCustom02">Mobile Number</label>
                  <input type="text" name="mobile" class="form-control" id="validationCustom02"  placeholder="Mobile Number"  required>
                  <div class="valid-feedback">
                    Looks good!
                  </div>
                </div>

                <div class="col-md-12 mb-3">
                  <label for="validationCustom03">Email</label>
                  <div class="input-group">
                    <input type="text" name="email" class="form-control" id="validationCustom03"  placeholder="Email" aria-describedby="inputGroupPrepend3" required>
                    <div class="invalid-feedback">
                      Please provide an email.
                    </div>
                  </div>
                </div>
            </div>

            <div class="form-row">
              <div class="col-md-12 mb-3">
                <label for="validationCustom04">Password</label>
                <input type="password" name="password" class="form-control" id="validationCustom04"  placeholder="Password" required>
                <div class="invalid-feedback">
                  Please provide a valid password.
                </div>
              </div>
              <div class="col-md-12 mb-3">
                <label for="validationCustom05">Confirm Password</label>
                <input type="password" name="confirmPassword" class="form-control" id="validationCustom05"  placeholder="Confirm Password" required>
                <div class="invalid-feedback">
                  Password and confirm password does not match.
                </div>
              </div>

                </div>
                <div class="form-group">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                    <label class="form-check-label" for="invalidCheck">
                      Agree to terms and conditions
                    </label>
                    <div class="invalid-feedback">
                      You must agree before submitting.
                    </div>
                  </div>
                </div>
                <button class="btn btn-primary" type="submit" >Submit form</button>
               
              </form>-->
              
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
                                name: "required",

                                mobile: {
                                    required: true,
                                    digits:true,
                                    maxlength: 8,
                                    minlength: 8,
                                    phoneSG: true
                                },
                                password: {
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
                                email: {
                                    required: true,
                                    email: true
                                },
                                agree: "required"
                        },
                        messages: {
                                name: "Please enter your name",
                                mobile:{
                                required:"Please enter your mobile number",
                                digits: "Please enter only numeric digits",
                                minlength: "Your mobile number must consist of 8 numeric digits only",
                                maxlength: "Your mobile number must consist of 8 numeric digits only",
                                },

                                password: {
                                    required: "Please provide a password",
                                    minlength: "Your password must be at least 8 characters long"
                                },
                                confirmPassword: {
                                    required: "Please confirm your password",
                                    minlength: "Your password must be at least 8 characters long",
                                    equalTo: "Please enter the same password as above"
                                },
                                email: "Please enter a valid email address",
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