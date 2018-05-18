<%-- 
    Document   : AppointmentBooking
    Created on : 17 May, 2018, 9:28:46 PM
    Author     : jacky
--%>

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
    </head>
    <body>
        <form role="form" action="appointmentBooking" method = "post">

            <input class="form-control" type="text" name="username" placeholder="Username/Email">
            <!should auto fill in username?>


            <div class="form-group">
                <label>Select Outlet</label>
                <select name="outletChosen">
                    <%  ArrayList<Outlet> totalOutlets = OutletDAO.retrieveAllOutlets();
                        for (Outlet outlet : totalOutlets) {
                            out.println("<option value=" + outlet.getOutletName() + ">" + outlet.getOutletName() + "</option>");
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Select Stylist</label>
                <select name="stylistChosen">
                    <%  ArrayList<Staff> staffs = StaffDAO.retrieveAllStaffs();
                        for (Staff staff : staffs) {
                            if (!staff.getStaffPosition().equals("cashier")) {
                                out.println("<option value=" + staff.getStaffName() + ">" + staff.getStaffName() + "</option>");
                            }
                        }
                    %>
                </select>
            </div>
                    <%
                        //need have drop down of DATE and START TIME
                        %>
                
            <%
                String errorMessage = (String) request.getAttribute("errorMsg");

                if (errorMessage != null) {
                    out.println(errorMessage);
                }
            %>
            <input type="submit" value="Book Appointment" class="btn btn-lg btn-success btn-block">      
        </form>
    </body>
</html>
