<%-- 
    Document   : ViewInventory
    Created on : Jun 3, 2018, 6:32:51 PM
    Author     : Xuan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tempest.entities.Item"%>
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

        <title>Monsoon Hair Saloon - View Inventory</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">


        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link href="blog.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css" rel="stylesheet" type="text/css" />

        <!--TimePicker-->
        <link type="text/css" href="css/bootstrap.min.css" />
        <link type="text/css" href="css/bootstrap-timepicker.min.css" />
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
            <div class ="container mt-5">
                <div class="row">
                    <div class="col-12 mt-5">              
                        <form role="form" action="deleteItem" method = "post">    
                            <%
                                ArrayList<Item> itemList = (ArrayList<Item>) session.getAttribute("itemList");
                            %>

                            <%  if (itemList != null && !itemList.isEmpty()) {           %>
                            <table class="table table-hover" id="appointments">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Date Added</th>
                                        <th scope="col">Comments</th>
                                        <th scope="col">Outlet</th>
                                        <th scope="col">Selected</th>
                                    </tr>
                                </thead>

                                <tbody >            
                                    <%
                                        for (Item i : itemList) {
                                    %> 
                                    <tr>
                                        <td><%= i.getId()%></td>
                                        <td><%= i.getName()%></td>
                                        <td><%= i.getDescription()%></td>
                                        <td><%= i.getPrice()%></td>
                                        <td><%= i.getQuantity()%></td>
                                        <td><%= i.getDateAdded()%></td>
                                        <td><%= i.getComments()%></td>
                                        <td><%= i.getOutletId()%></td> 
                                        <td><input TYPE="checkbox" NAME="item" VALUE="<%=i.getId() + "," + i.getOutletId()%>"></td>
                                    </tr>

                                    <%
                                        }
                                    } else {
                                    %>
                                <h1>No Inventory!</h1>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                            <%  if (itemList != null && !itemList.isEmpty()) {           %>
                            <input type="submit" value="Delete Item" class="col-3 btn btn-lg btn-success btn-block " >
                            <%
                                }
                            %>
                        </form><br>
                        <a href="AddNewItem.jsp" style="text-decoration:none"> <input type="submit" value="Add New Item" class="col-3 btn btn-lg btn-success btn-block mb-3 "> </a> 
                        <a href="AdminHomepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="col-3 btn btn-lg btn-success btn-block "> </a> 
                        </body>
                        </html>
