<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <link rel="icon" href="favicon.ico">

            <title>Monsoon Hair Saloon - Login</title>

            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/log.css" rel="stylesheet">

            <!-- Custom styles for this template -->
            <link href="css/carousel.css" rel="stylesheet">
            <link href="css/NavbarAndFooter.css" rel="stylesheet">
    <style>
        
        .input-lg, .form-group-lg .form-control {
            height: 46px;
            padding: 10px 16px;
            font-size: 18px;
            line-height: 1.33;
            border-radius: 6px;
            margin-bottom: 8%;
            margin-top: 8%;
        }
            
        
        .radio, .checkbox {
            position: relative;
            display: block;
            margin-top: 10px;
            margin-bottom: 15px;
            margin-left: 8%;
        }
          
    
        .wrapper {
            margin-top: 10%;
            margin-bottom: 80px;
        }
        </style>
    </head>
    
<body background="img/loginBg.jpeg">
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <img src="img/Monsoon Hair Logo (Black).png" id="logo">
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
              <a class="nav-link" href="#">Contact Us</a>
            </li>
          </ul>
        </div>
        
        <div class="admin">
            <div class="dropdown">
            <img src="img/cart.svg" width="30" height="30">
                <div class="dropdown-content">
                </div>
            </div>
            
            <div class="dropdown">
            <img src="img/account.svg" width="30" height="30">
                <div class="dropdown-content">
                </div>
            </div>
        </div>
      </nav>
    </header>
    
    

        <div class="wrapper">
         <form class="form-signin"  action="authenticate" method = "post" style="border-radius:5%">       
           <img src="img/Monsoon Hair Logo (Black).png"  width="300">
           <!--<form role="form" action="authenticate" method = "post">-->
             <img src="#" class="img-responsive" alt="" />
             <input type="text" name="username" placeholder="Username" required class="form-control input-lg" />  
              <input type="password" name="password" class="form-control input-lg" id="password" placeholder="Password" required="" />  

                     <%
                         String errorMessage = (String) request.getAttribute("errorMsg");

                         if (errorMessage != null) {
                             out.println(errorMessage);
                         }
                     %>
                  <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                     <%
                         String msg = (String) session.getAttribute("success");
                         if (msg!= null){
                             out.println("<p style='color:red'>"+msg+"</p>");
                             session.setAttribute("success", null);
                         }
                     %>
                     
                  <div>
                     <a href="CreateAccount.jsp">Create Account</a><br>
                     <a href="ForgetPassword.jsp">Forget Password?</a>
                 </div>
                     
                 </form>
             </div>
      </body>
</html>
