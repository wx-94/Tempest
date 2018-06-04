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
        
        stmt.setString(1, appt.getCustomer());
        stmt.setString(2, appt.getStaff());
        stmt.setString(3, appt.getOutlet());
        stmt.setString(4, appt.getTreatment());
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
        String appointmentID = appointment.getAppointmentID() + "";

        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("DELETE FROM Appointment WHERE appointmentID=?");
        stmt.setString(1, appointmentID);
        
        int check = stmt.executeUpdate();
        if (check == 1) {
            success = true;
        }
        
        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }
    
    public boolean updateAppointment(Appointment appointment, Appointment newAppointment) throws SQLException {
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
    
    public ArrayList<Appointment> retrieveAllAppointmentsByCustomer(String email) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Appointment> appointmentList = new ArrayList<>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Appointment where customerEmail = ?");
            stmt.setString(1, email);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int appointmentID = rs.getInt("appointmentID");                
                String customer = rs.getString("customerEmail");
                String staff = rs.getString("staffID");
                String outlet = rs.getString("outletName");
                String hairServices = rs.getString("treatment");
                Date dateOfAppointment = rs.getDate("appointmentDate");
                Time appointmentStartTime = rs.getTime("appointmentStartTime");
                Time appointmentEndTime = rs.getTime("appointmentEndTime");
                
                Appointment appointment = new Appointment(appointmentID, outlet, customer, staff, dateOfAppointment, appointmentStartTime, appointmentEndTime, hairServices);
                appointmentList.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return appointmentList;
    }
    
    public ArrayList<Appointment> retrieveAllAppointments() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Appointment> appointmentList = new ArrayList<>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Appointment");
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int appointmentID = rs.getInt("appointmentID");                
                String customer = rs.getString("customerEmail");
                String staff = rs.getString("staffID");
                String outlet = rs.getString("outletName");
                String hairServices = rs.getString("treatment");
                Date dateOfAppointment = rs.getDate("appointmentDate");
                Time appointmentStartTime = rs.getTime("appointmentStartTime");
                Time appointmentEndTime = rs.getTime("appointmentEndTime");
                
                Appointment appointment = new Appointment(appointmentID, outlet, customer, staff, dateOfAppointment, appointmentStartTime, appointmentEndTime, hairServices);
                appointmentList.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return appointmentList;
    }
    
    public Appointment retrieveAppointment(String appt) throws SQLException {
        Appointment a = null;
        conn = ConnectionManager.getConnection();

        if (appt != null && !appt.isEmpty()) {

            //getting PreparedStatement to execute query
            stmt = conn.prepareStatement("SELECT * FROM Appointment WHERE appointmentID = ?");
            stmt.setInt(1, Integer.parseInt(appt));
            //Resultset returned by query
            rs = stmt.executeQuery();

            while (rs.next()) {
                int appointmentID = rs.getInt("appointmentID");                
                String customer = rs.getString("customerEmail");
                String staff = rs.getString("staffID");
                String outlet = rs.getString("outletName");
                String hairServices = rs.getString("treatment");
                Date dateOfAppointment = rs.getDate("appointmentDate");
                Time appointmentStartTime = rs.getTime("appointmentStartTime");
                Time appointmentEndTime = rs.getTime("appointmentEndTime");
                a = new Appointment(appointmentID, outlet, customer, staff, dateOfAppointment, appointmentStartTime, appointmentEndTime, hairServices);
               
            }
        }
        ConnectionManager.close(conn, stmt, rs);
        return a;
    }
    
    public ArrayList<Appointment> retrieveAppointmentsHistoryByCustomer(String email) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Appointment> appointmentList = new ArrayList<>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from AppointmentsHistory where customerEmail = ?");
            stmt.setString(1, email);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int appointmentID = rs.getInt("appointmentID");                
                String customer = rs.getString("customerEmail");
                String staff = rs.getString("staffID");
                String outlet = rs.getString("outletName");                
                String hairServices = rs.getString("treatment");
                Date dateOfAppointment = rs.getDate("appointmentDate");
                Time appointmentStartTime = rs.getTime("appointmentStartTime");
                Time appointmentEndTime = rs.getTime("appointmentEndTime");
                Appointment appointment = new Appointment(appointmentID, outlet, customer, staff, dateOfAppointment, appointmentStartTime, appointmentEndTime, hairServices);
                appointmentList.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return appointmentList;
    }
    
    public boolean createAppointmentHistory(Appointment appt) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;
        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("INSERT into AppointmentsHistory(appointmentID,customerEmail,staffID,outletName,treatment,appointmentDate, appointmentStartTime, appointmentEndTime) VALUES(?,?,?,?,?,?,?,?)");
        
        stmt.setInt(1, appt.getAppointmentID());
        stmt.setString(2, appt.getCustomer());
        stmt.setString(3, appt.getStaff());
        stmt.setString(4, appt.getOutlet());
        stmt.setString(5, appt.getTreatment());
        stmt.setDate(6, appt.getDateOfAppointment());
        stmt.setTime(7, appt.getStartTimeOfAppointment());
        stmt.setTime(8, appt.getEndTimeOfAppointment());
        int check = stmt.executeUpdate();
        
        if (check == 1) {
            success = true;
        }
        
        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }
}
