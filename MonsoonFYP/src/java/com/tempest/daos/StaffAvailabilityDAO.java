/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.StaffAvailability;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author Xuan
 */
public class StaffAvailabilityDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    OutletDAO outletDAO = new OutletDAO();
    CustomerDAO customerDAO = new CustomerDAO();
    StaffDAO staffDAO = new StaffDAO();
    HairServicesDAO hairServicesDAO = new HairServicesDAO();

    public boolean createStaffAvailability(StaffAvailability availability) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;
        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("INSERT into StaffAvailability(staffName,outletName,availableDate,availableStartTime,availableEndTime) VALUES(?,?,?,?,?)");

        stmt.setString(1, availability.getStaffName());
        stmt.setString(2, availability.getOutletName());
        stmt.setDate(3, availability.getAvailableDate());
        stmt.setTime(4, availability.getAvailableStartTime());
        stmt.setTime(5, availability.getAvailableEndTime());
        int check = stmt.executeUpdate();

        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }

    public boolean deleteStaffAvailability(StaffAvailability availability) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;

        //Need to add appointmentID to Appointment class and appointmentID column to database as well.
        //Uncomment below 3 lines when implemented
        String availabilityID = availability.getStaffAvailabilityID() + "";

        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("DELETE FROM StaffAvailability WHERE ID=?");
        stmt.setString(1, availabilityID);

        int check = stmt.executeUpdate();
        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }

    public void updateStaffAvailability(StaffAvailability newAvailability, String availabilityID) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE StaffAvailability SET staffName = ?, outletName = ?, availableDate = ?, availableStartTime = ?, availableEndTime = ?  where ID = ?");

            stmt.setString(1, newAvailability.getStaffName());
            stmt.setString(2, newAvailability.getOutletName());
            stmt.setDate(3, newAvailability.getAvailableDate());
            stmt.setTime(4, newAvailability.getAvailableStartTime());
            stmt.setTime(5, newAvailability.getAvailableEndTime());
            stmt.setInt(6, Integer.parseInt(availabilityID));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }

    public ArrayList<StaffAvailability> retrieveAllAvailabilityByStaff(String staffName) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<StaffAvailability> availabilityList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from StaffAvailability where staffname = ?");
            stmt.setString(1, staffName);

            rs = stmt.executeQuery();

            while (rs.next()) {
                int availabilityID = rs.getInt("ID");
                String staff = rs.getString("staffName");
                String outlet = rs.getString("outletName");
                Date availableDate = rs.getDate("availableDate");
                Time availableStartTime = rs.getTime("availableStartTime");
                Time availableEndTime = rs.getTime("availableEndTime");

                StaffAvailability availability = new StaffAvailability(availabilityID, staff, outlet, availableDate, availableStartTime, availableEndTime);
                availabilityList.add(availability);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return availabilityList;
    }

    public ArrayList<StaffAvailability> retrieveAllStaffAvailability() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<StaffAvailability> availabilityList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from StaffAvailability");
            rs = stmt.executeQuery();

            while (rs.next()) {
                int availabilityID = rs.getInt("ID");
                String staff = rs.getString("staffName");
                String outlet = rs.getString("outletName");
                Date availableDate = rs.getDate("availableDate");
                Time availableStartTime = rs.getTime("availableStartTime");
                Time availableEndTime = rs.getTime("availableEndTime");

                StaffAvailability availability = new StaffAvailability(availabilityID, staff, outlet, availableDate, availableStartTime, availableEndTime);
                availabilityList.add(availability);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return availabilityList;
    }

    public StaffAvailability retrieveStaffAvailability(String staffAvailibilityID) throws SQLException {
        StaffAvailability a = null;
        conn = ConnectionManager.getConnection();

        if (staffAvailibilityID != null && !staffAvailibilityID.isEmpty()) {

            //getting PreparedStatement to execute query
            stmt = conn.prepareStatement("SELECT * FROM StaffAvailability WHERE ID = ?");
            stmt.setInt(1, Integer.parseInt(staffAvailibilityID));
            //Resultset returned by query
            rs = stmt.executeQuery();

            while (rs.next()) {
                int availabilityID = rs.getInt("ID");
                String staff = rs.getString("staffName");
                String outlet = rs.getString("outletName");
                Date availableDate = rs.getDate("availableDate");
                Time availableStartTime = rs.getTime("availableStartTime");
                Time availableEndTime = rs.getTime("availableEndTime");

                a = new StaffAvailability(availabilityID, staff, outlet, availableDate, availableStartTime, availableEndTime);

            }
        }
        ConnectionManager.close(conn, stmt, rs);
        return a;
    }
}
