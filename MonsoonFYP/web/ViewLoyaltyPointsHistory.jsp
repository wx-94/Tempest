<%-- 
    Document   : ViewLoyaltyPointsHistory
    Created on : 30 May, 2018, 10:21:24 AM
    Author     : jacky
--%>
<%@page import="com.tempest.daos.CustomerDAO"%>
<%@page import="com.tempest.entities.LoyaltyPoints"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Monsoon Hair Saloon - Loyalty Points</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/NavbarAndFooter.css" rel="stylesheet">
    <link href="blog.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style></style>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="Homepage.jsp">Home <span class="sr-only">(current)</span></a>
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

    <%
        ArrayList<LoyaltyPoints> loyaltyList = (ArrayList<LoyaltyPoints>) session.getAttribute("loyaltyList");
    %>

    <%  if (loyaltyList != null && !loyaltyList.isEmpty()) {           %>
    <table class="table table-hover"id="points">
        <thead>
            <tr class="bg-warning">
                <th scope="col">Points ID</th>
                <th scope="col">Date</th>
                <th scope="col">Loyalty Points Added(+)</th>
                <th scope="col">Loyalty Points Minus(-)</th>                    
                <th scope="col">Type</th>
            </tr>
        </thead>

        <tbody >            
            <%
                for (LoyaltyPoints points : loyaltyList) {
            %> 
            <tr>
                <td><%= points.getPointsID()%></td>
                <td><%= points.getDateOfChanges()%></td>
                <td><%= points.getLoyaltyPointsAdd()%></td>
                <td><%= points.getLoyaltyPointsMinus()%></td>
                <td><%= points.getType()%></td>
            </tr>

            <%
                }
            } else {
            %>

        <div class ="container mt-5">
            <div class="row">
                <div class="col-12 text-center mt-5">      
                    <h1>No loyalty points awarded!</h1>
                </div>
            </div>
        </div>   
        <%
            }
        %>
    </tbody>
</table>

<a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="col-12 btn btn-lg btn-success btn-block "> </a> 
</body>
</html>
