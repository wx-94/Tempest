<%-- 
    Document   : ViewInventory
    Created on : Jun 3, 2018, 6:32:51 PM
    Author     : Xuan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tempest.entities.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Inventory Page</title>
    </head>
    <body>
        <form role="form" action="deleteItem" method = "post">    
            <%
                ArrayList<Item> itemList = (ArrayList<Item>) session.getAttribute("itemList");
            %>

            <%  if (itemList != null && !itemList.isEmpty()) {           %>
            <table id="appointments">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Date Added</th>
                        <th>Comments</th>
                        <th>Outlet</th>
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
                        <td><input TYPE="checkbox" NAME="item" VALUE="<%=i.getId()+","+i.getOutletId()%>"></td>
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
            <input type="submit" value="Delete Item" >
            <%
                }
            %>
        </form><br>
        <a href="AddNewItem.jsp"> Add New Item</a><br>
        <a href="AdminHomepage.jsp"> Go Back</a>
    </body>
</html>
