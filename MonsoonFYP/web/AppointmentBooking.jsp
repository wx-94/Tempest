<%-- 
    Document   : AppointmentBooking
    Created on : 17 May, 2018, 9:28:46 PM
    Author     : jacky
--%>
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

    <title>Monsoon Hair Saloon</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    
    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/NavbarAndFooter.css" rel="stylesheet">
    <link href="blog.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/6F7421C3-831C-7744-9837-FFD4276FB677/main.js" charset="UTF-8"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
    <!--TimePicker-->
    <link type="text/css" href="css/bootstrap.min.css" />
    <link type="text/css" href="css/bootstrap-timepicker.min.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>
    
    
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
          <ul class="navbar-nav m-auto">
            <li class="nav-item">
              <a class="nav-link" href="#">Home </a>
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
                    <%
                        String msg = (String) session.getAttribute("success");
                        if (msg != null) {
                            out.println(msg);
                            session.setAttribute("success", null);
                        }
                    %>

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
       
        <div class ="container">
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
                                    <!--<input type="text" id="date" data-format="DD-MM-YYYY" data-template="D MMM YYYY" name="date" value="01-01-2018">-->
                                    <!--<input type="text" id="datepicker" name="date" data-format="DD-MM-YYYY" data-template="D MMM YYYY" value="01-01-2018"/>-->
                                    <input type="date" name="date">
                                </div>
                                    


<!--        <div class="input-group bootstrap-timepicker timepicker">
            <input id="timepicker1" type="text" class="form-control input-small">
            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
        </div>-->


                                <div class="form-group col-md-12">
                                    <label>Select Time</label>
<!--                                    <input id="timepicker1"  type="text" name="time" class="form-control input-small">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>-->

                                    <input type="text" id="time" data-format="HH:mm" data-template="HH : mm" name="time">
                                    <script>
                                        $(function () {
                                            $('#time').combodate({
                                                firstItem: 'name', //show 'hour' and 'minute' string at first item of dropdown
                                                minuteStep: 15
                                            });
                                        });
                                    </script>
                                    
                                </div>
                                <%
                                    String errorMessage = (String) request.getAttribute("errorMsg");
                                    if (errorMessage != null) {
                                        out.println(errorMessage);
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



