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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item Page</title>
    </head>
    <body>
        <script src="js/jquery.js"></script> 
        <script src="js/moment.min.js"></script> 
        <script src="js/combodate.js"></script> 
        <form role="form" action="addItem" method = "post">                               
            Select Outlet
            <select id="inputState" name="outletChosen" class="form-control">                                 
                <%  ArrayList<Outlet> totalOutlets = OutletDAO.retrieveAllOutlets();
                    for (Outlet outlet : totalOutlets) {
                %>
                <option value="<%=outlet.getOutletName()%>"><%=outlet.getOutletName()%></option> 
                <% }
                %>
            </select><br>
            Product Id: <input name="Id" type="text" class="form-control"><br>
            Product Name: <input name="Name" type="text" class="form-control"><br>
            Product Description: <input name="Description" type="text" class="form-control"><br>
            Price: <input name="Price" type="text" class="form-control"><br>
            Quantity: <input name="Quantity" type="text" class="form-control"><br>
            Date Added: <input id="date" type="text" data-format="DD-MM-YYYY" data-template="D MMM YYYY" name="date" value="01-01-2018"><br>
            Comments: <input name="Comments" type="text" class="form-control"><br>

            <input type="submit" value="Add Item" class="btn btn-lg btn-success btn-block mb-2">      
        </form>
    </body>
</html>
