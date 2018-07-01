<%-- 
    Document   : UpdateAppointment
    Created on : 13 Jun, 2018, 4:05:12 PM
    Author     : jacky
--%>

<%@page import="com.tempest.entities.HairServices"%>
<%@page import="com.tempest.daos.HairServicesDAO"%>
<%@page import="com.tempest.entities.Staff"%>
<%@page import="com.tempest.daos.StaffDAO"%>
<%@page import="com.tempest.daos.OutletDAO"%>
<%@page import="com.tempest.entities.Outlet"%>
<%@page import="com.tempest.daos.AppointmentDAO"%>
<%@page import="com.tempest.entities.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Appointment</title>
    </head>
    <body>
        <form role="form" action="UpdateAppointmentController" method = "post">
            <%
                String apptID = (String) session.getAttribute("updateApp");
                AppointmentDAO appDAO = new AppointmentDAO();
                OutletDAO outletDAO = new OutletDAO();
                if (apptID != null && !apptID.isEmpty()) {
                    Appointment app = appDAO.retrieveAppointment(apptID);
            %>
            <table>
                <tr>
                    <th>Appointment ID</th>
                    <th>Outlet</th>
                    <th>Stylist</th>
                    <th>Treatment</th>
                    <th>Date</th>
                    <th>Start Time</th>
                </tr>

                <tr>
                    <%--appointment ID--%>
                    <td>
                        <%=app.getAppointmentID()%>
                    </td>
                    <%--outlet--%>
                    <td>
                        <select name="outletChosen">                                 
                            <%  ArrayList<Outlet> totalOutlets = OutletDAO.retrieveAllOutlets();
                                for (Outlet outlet : totalOutlets) {
                                    if (outlet.getOutletName().equals(app.getOutlet())) {
                            %>
                            <option value="<%=outlet.getOutletName()%>" selected="selected"><%=outlet.getOutletName()%></option> 
                            <%      } else {
                            %>
                            <option value="<%=outlet.getOutletName()%>"><%=outlet.getOutletName()%></option> 
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                    <%--stylist--%>
                    <td>
                        <select name="stylistChosen">
                            <%  ArrayList<Staff> staffs = StaffDAO.retrieveAllStaffs();
                                for (Staff staff : staffs) {
                                    if (!staff.getStaffPosition().equals("cashier")) {
                                        if (staff.getStaffName().equals(app.getStaff())) {
                            %>
                            <option value="<%=staff.getStaffName()%>" selected="selected"><%=staff.getStaffName()%></option> 
                            <%          } else {
                            %>
                            <option value="<%=staff.getStaffName()%>"><%=staff.getStaffName()%></option>
                            <%
                                        }
                                    }
                                }
                            %>
                        </select>                    
                    </td>
                    <%--treatment--%>
                    <td>
                        <select name="hairService"> 
                            <%  ArrayList<HairServices> hairService = HairServicesDAO.retrieveAllHairServices();
                                for (HairServices hair : hairService) {
                                    if (hair.getHairService().equals(app.getTreatment())) {
                            %>
                            <option value="<%=hair.getHairService()%>" selected="selected"><%=hair.getHairService()%></option> 
                            <%      } else {
                            %>
                            <option value="<%=hair.getHairService()%>"><%=hair.getHairService()%></option> 
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                    <%--date--%>

                    <td><input type="text" name="date" value="<%=app.getDateOfAppointment()%>"></td>
                        <%--time--%>
                    <td><input type="text" name="time" value="<%=app.getStartTimeOfAppointment()%>"></td>
                </tr>
            </table>

            <%
                }
            %>
            <input type="submit" value="Update Appointment" >
        </form>
        <a href="ViewAppointments.jsp"> Return to Appointments Page</a><br>
        <a href="Homepage.jsp"> Return to Homepage</a>
    </body>
</html>
