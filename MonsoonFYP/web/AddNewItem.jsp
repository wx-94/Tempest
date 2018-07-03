<%-- 
    Document   : AddNewItem
    Created on : Jun 3, 2018, 6:52:07 PM
    Author     : Xuan
--%>

<%@page import="com.tempest.daos.OutletDAO"%>
<%@page import="com.tempest.entities.Outlet"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <!--temp link-->
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
    
    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/NavbarAndFooter.css" rel="stylesheet">
    <link href="blog.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
   
    </style>
    </head>
    
    <body>
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
    

        <div class ="container">
            <div class="row mt-5">
                <div class="col-6 offset-3 mt-5">
                    <div class="card w-10 " id="apptMenu" >
                        <div class="card-body">                           
                            <form role="form" action="addItem" method = "post">                       
                                <div class="row">
      
                                    
                                    <div class="col-12 mb-3">
                                    Select Outlet
                                    <select id="inputState" name="outletChosen" class="form-control">                                 
                                        <%  ArrayList<Outlet> totalOutlets = OutletDAO.retrieveAllOutlets();
                                            for (Outlet outlet : totalOutlets) {
                                        %>
                                        <option value="<%=outlet.getOutletName()%>"><%=outlet.getOutletName()%></option> 
                                        <% }
                                        %>
                                    </select>
                                    </div>
                                    
                                    <div class="col-12 mb-3">
                                      <input name="Id" type="text" class="form-control" placeholder="Product Id">
                                    </div>

                                    <div class="col-12 mb-3">
                                      <input name="Name" type="text" class="form-control" placeholder="Product Name">
                                    </div>

                                    <div class="col-12 mb-3">
                                      <input name="Description" type="text" class="form-control" placeholder="Product Description">
                                    </div>

                                      <div class="col-12 mb-3">
                                      <input name="Price" type="text" class="form-control" placeholder="Price">
                                    </div>

                                      <div class="col-12 mb-3">
                                      <input Name="Quantity" type="text" class="form-control" placeholder="Quatity">
                                    </div>

                                      <div class="col-12 mb-3">
                                      <input id ="date"name="date" type="text" class="form-control" placeholder="Date Added">
                                    </div>
                                   </div>
                                 <input type="submit" value="Add Item" class="btn btn-lg btn-success btn-block mb-2">
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
                    <!--<a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="" class="btn btn-lg btn-success btn-block"> </a>--> 
                </div>
            </div>     
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
    </body>
</html>
