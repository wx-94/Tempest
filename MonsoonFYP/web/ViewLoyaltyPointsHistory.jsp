<%-- 
    Document   : ViewLoyaltyPointsHistory
    Created on : 30 May, 2018, 10:21:24 AM
    Author     : jacky
--%>

<%@page import="com.tempest.entities.LoyaltyPoints"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loyalty Points History</title>
    </head>
    <body>
        
          <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <img src="img/Monsoon Hair Logo (Black).png" width="200" height="75" id="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav m-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
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
                  <p>Account cart to be displayed</p>
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
            <h1>No loyalty points awarded!</h1>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="Homepage.jsp" style="text-decoration:none"> <input type="submit" value="Back" class="btn btn-lg btn-success btn-block "> </a> 
    </body>
</html>
