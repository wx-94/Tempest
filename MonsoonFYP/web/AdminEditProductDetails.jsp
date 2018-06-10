<%-- 
    Document   : AdminEditProductDetails
    Created on : 11 Jun, 2018, 12:03:59 AM
    Author     : jacky
--%>

<%@page import="com.tempest.daos.InventoryDAO"%>
<%@page import="com.tempest.entities.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
    </head>
    <body>
        <form role="form" action="UpdateInventoryDetailsController" method = "post">    
            <%
                InventoryDAO inventoryDAO = new InventoryDAO();
                ArrayList<Item> inventoryList = inventoryDAO.retrieveAllInventory();
            %>

            <%  if (inventoryList != null && !inventoryList.isEmpty()) {           %>
            <table id="appointments">
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Name of Product</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Outlet</th>
                        <th>Quantity</th>
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
                        <td><%= i.getDescription()%></td>
                        <td><%= i.getPrice()%></td>
                        <td><%= i.getOutletId()%></td>
                        <td><%= i.getQuantity()%></td>
                    </tr>

                    <%
                        }
                    } else {
                    %>
                <h1>No bookings made!</h1>
                <%
                    }
                %>
                </tbody>
            </table>
            <input type="submit" value="Update Item Information" >            
        </form>                
        <a href="AdminHomepage.jsp"> Go back</a>
    </body>
</html>
