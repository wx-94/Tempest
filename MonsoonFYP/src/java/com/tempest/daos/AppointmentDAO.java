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
import java.sql.Time;

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
        stmt = conn.prepareStatement("INSERT into Appointment(customerEmail,staffID,outletName,treatment,appointmentDate, appointmentStartTime, appointmentEndTime) VALUES(?,?,?,?,?,?,?)");

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
        
    public boolean deleteAppointment(Appointment appointment) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;
        
        //Need to add appointmentID to Appointment class and appointmentID column to database as well.
        //Uncomment below 3 lines when implemented
        //String appointmentID = appointment.getAppointmentID();
        
        //getting PreparedStatement to execute query
        //stmt = conn.prepareStatement("DELETE FROM BID WHERE appointmentID=" + appointmentID);

        int check = stmt.executeUpdate();
        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }
    
    public boolean updateBid(Appointment appointment, Appointment newAppointment) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;

        //Uncomment and change below lines when deleteAppointment stuff is implemented.
        //getting PreparedStatement to execute query
        //stmt = conn.prepareStatement("UPDATE BID SET amount=" + newAmount + " WHERE bidID=" + bid.getBidID() + " AND userid=\"" + bid.getUserID() + "\"");

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
        ArrayList<Appointment> appointmentList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Appointment where customerEmail = ?");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Outlet outlet = outletDAO.retrieveOutlet(rs.getString("outletName"));
                Customer customer = customerDAO.retrieveCustomer(rs.getString("customerEmail"));
                Staff staff = staffDAO.retrieveStaff(rs.getString("staffID"));
                Date dateOfAppointment = rs.getDate("appointmentDate");
                Time appointmentStartTime = rs.getTime("appointmentStartTime");
                Time appointmentEndTime = rs.getTime("appointmentEndTime");
                HairServices hairServices = hairServicesDAO.retrieveHairService(rs.getString("treatment"));
                Appointment appointment = new Appointment(outlet, customer, staff, dateOfAppointment, appointmentStartTime, appointmentEndTime, hairServices);
                appointmentList.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return appointmentList;
    }
}
