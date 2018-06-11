<%-- 
    Document   : AddItemToCart
    Created on : 11 Jun, 2018, 4:08:12 PM
    Author     : jacky
--%>

<%@page import="com.tempest.entities.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tempest.daos.InventoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Items To Cart</title>
    </head>
    <body>
        <form role="form" action="AddItemsToCartController" method = "post">    
            <%
                InventoryDAO inventoryDAO = new InventoryDAO();
                ArrayList<Item> inventoryList = inventoryDAO.retrieveAllProduct();
            %>

            <%  if (inventoryList != null && !inventoryList.isEmpty()) {           %>
            <table id="appointments">
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Name of Product</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>

                <tbody >            
                    <%
                        for (Item i : inventoryList) {
                    %> 
                    <tr>
                        <td><%= i.getId()%></td>
                        <td><%= i.getName()%></td>
                        <td><%= i.getDescription()%></td>
                        <td><%= i.getPrice()%></td>
                        <td>  <select name="quantity">
                                <%for (int num = 0; num < 100; num++) {
                                %>
                                <option value="<%=num%>"> <%=num%> </option>
                                <%}%>
                            </select></td>
                    </tr>

                    <%
                            }
                        }
                    %>
                </tbody>
            </table>            
            <input type="submit" value="Add Items To Cart" >   
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
        <a href="Homepage.jsp"> Go back</a>
    </body>
</html>
