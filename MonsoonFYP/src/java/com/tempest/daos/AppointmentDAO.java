/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.entities.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.tempest.dbconnection.ConnectionManager;
import java.sql.Date;
import java.sql.SQLException;

/**
 *
 * @author jacky
 */
public class AppointmentDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    OutletDAO outletDAO = new OutletDAO();
    CustomerDAO customerDAO = new CustomerDAO();
    StaffDAO staffDAO = new StaffDAO();
    HairServicesDAO hairServicesDAO = new HairServicesDAO();
    
    public boolean createAppointment(Appointment appt) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;
        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("INSERT into Appointment(name,staff,outlet,treatment,appointmentDate, appointmentStart, appointmentEnd) VALUES(?,?,?,?,?,?,?)");

        stmt.setString(1, appt.getCustomer().getCustomerEmail());
        stmt.setString(2, appt.getStaff().getStaffName());
        stmt.setString(3, appt.getOutlet().getOutletName());
        stmt.setString(4, appt.getTreatment().getHairService());
        stmt.setDate(5, appt.getDateOfAppointment());
        stmt.setTime(6, appt.getStartTimeOfAppointment());
        stmt.setTime(7, appt.getEndTimeOfAppointment());
        int check = stmt.executeUpdate();

        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }

    public ArrayList<Appointment> retrieveAllAppointmentsByCustomer() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Appointment> apptList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Outlet where customerEmail = ?");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Customer c = customerDAO.retrieveCustomer(rs.getString("customerEmail"));
                Staff f = staffDAO.retrieveStaff(rs.getString("staffID"));
                Outlet o = outletDAO.retrieveOutlet(rs.getString("outletName"));
                HairServices h = hairServicesDAO.retrieveHairServices(rs.getString("treatment"));
               
                Appointment a = new Appointment(c,f,o, h, rs.getDate("appointmentDate"), rs.getTime("appointmentStartTime"), rs.getTime("appointmentEndTime"));
                apptList.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return apptList;
    }
}
