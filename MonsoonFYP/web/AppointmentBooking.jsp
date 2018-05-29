<%-- 
    Document   : AppointmentBooking
    Created on : 17 May, 2018, 9:28:46 PM
    Author     : jacky
--%>

<%@page import="com.tempest.daos.HairServicesDAO"%>
<%@page import="com.tempest.entities.HairServices"%>
<%@page import="com.tempest.daos.StaffDAO"%>
<%@page import="com.tempest.entities.Staff"%>
<%@page import="com.tempest.daos.OutletDAO"%>
<%@page import="com.tempest.entities.Outlet"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Booking</title>
        <script src="js/jquery-3.3.1.js"></script> 
        <script src="js/moment.js"></script> 
        <script src="js/combodate.js"></script> 
    </head>
    <body>
        <form role="form" action="bookAppointment" method = "post">
            Username
            <input class="form-control" type="text" name="username" value=<% out.print((String) session.getAttribute("username"));%>>

            <div class="form-group">
                <label>Select Outlet</label>
                <select name="outletChosen">
                    <%  ArrayList<Outlet> totalOutlets = OutletDAO.retrieveAllOutlets();
                        for (Outlet outlet : totalOutlets) {
                    %>
                    <option value="<%=outlet.getOutletName()%>"><%=outlet.getOutletName()%></option> 
                    <% }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Select Stylist</label>
                <select name="stylistChosen">
                    <%  ArrayList<Staff> staffs = StaffDAO.retrieveAllStaffs();
                        for (Staff staff : staffs) {
                            if (!staff.getStaffPosition().equals("cashier")) {
                    %>
                    <option value="<%=staff.getStaffName()%>"><%=staff.getStaffName()%></option> 
                    <% }
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Select Hair Service</label>
                <select name="hairService">
                    <%  ArrayList<HairServices> hairService = HairServicesDAO.retrieveAllHairServices();
                        for (HairServices hair : hairService) {%>
                    <option value="<%=hair.getHairService()%>"><%=hair.getHairService()%></option> 

                    <% }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Select Date</label>
                <input type="text" id="date" data-format="DD-MM-YYYY" data-template="D MMM YYYY" name="date" value="01-01-2018">
                <script>
                    $(function () {
                        $('#date').combodate(
                                {minYear: 2018,
                                    maxYear: 2020});
                    });
                </script>
            </div>

            <div class="form-group">
                <label>Select Time</label>
                <input type="text" id="time" data-format="HH:mm" data-template="HH : mm" name="time">
                <script>
                    $(function () {
                        $('#time').combodate({
                            firstItem: 'name', //show 'hour' and 'minute' string at first item of dropdown
                            minuteStep: 15
                        });
                    });
                </script>
            </div>
            <%
                String errorMessage = (String) request.getAttribute("errorMsg");
                if (errorMessage != null) {
                    out.println(errorMessage);
                }
            %>

            <input type="submit" value="Book Appointment" class="btn btn-lg btn-success btn-block">      
        </form>
        <a href="Homepage.jsp"> Go back</a>
    </body>
</html>
