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
        <%
            ArrayList<LoyaltyPoints> loyaltyList = (ArrayList<LoyaltyPoints>) session.getAttribute("loyaltyList");
        %>

        <%  if (loyaltyList != null && !loyaltyList.isEmpty()) {           %>
        <table id="points">
            <thead>
                <tr>
                    <th>Points ID</th>
                    <th>Date</th>
                    <th>Loyalty Points Added(+)</th>
                    <th>Loyalty Points Minus(-)</th>                    
                    <th>Type</th>
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

    <a href="Homepage.jsp"> Go back</a>
    </body>
</html>
