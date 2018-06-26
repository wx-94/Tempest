<%-- 
    Document   : AdminEditProductDetails
    Created on : 11 Jun, 2018, 12:03:59 AM
    Author     : jacky
--%>

<%@page import="com.tempest.daos.InventoryDAO"%>
<%@page import="com.tempest.entities.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tempest.daos.CustomerDAO"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monsoon - Product Details</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css/NavbarAndFooter.css" rel="stylesheet">
        <link href="blog.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>

            input[type=button].btn-block, input[type=reset].btn-block, input[type=submit].btn-block {
                width: 25%;
                align-text: center;
            }


        </style>

    </head>
    <body>

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
        </header>

        <div class ="container mt-5">
            <div class="row">
                <div class="col-12 mt-5">                         
                    <form role="form" action="UpdateInventoryDetailsController" method = "post">    
                        <%
                            InventoryDAO inventoryDAO = new InventoryDAO();
                            ArrayList<Item> inventoryList = inventoryDAO.retrieveAllProduct();
                        %>

                        <%  if (inventoryList != null && !inventoryList.isEmpty()) {           %>
                        <table class="table table-hover" id="appointments">
                            <thead>
                                <tr class="bg-warning">
                                    <th scope="col">Item ID</th>
                                    <th scope="col">Name of Product</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>

                            <tbody >            
                                <%
                                    for (Item i : inventoryList) {
                                %> 
                                <tr>
                                    <td><%= i.getId()%></td>
                                    <td><input Type="text" Name="name" Value="<%= i.getName()%>"></td>
                                    <td><input Type="text" Name="description" Value="<%= i.getDescription()%>"></td>
                                    <td><input Type="text" Name="price" Value="<%= i.getPrice()%>"></td>
                                </tr>

                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>            
                        <input type="submit" class="btn btn-lg btn-success btn-block mb-3" value="Update Item Information" > 
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
                    <a href="AdminHomepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="btn btn-lg btn-success btn-block "> </a> 
                </div>
            </div>
        </div>
    </body>
</html>
