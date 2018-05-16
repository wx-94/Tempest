/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.tempest.entities.Staff;
import com.tempest.dbconnection.ConnectionManager;
import com.tempest.utility.BCrypt;

/**
 *
 * @author jacky
 */
public class StaffDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    public boolean verifyStaff(String userID, String password) throws SQLException {

        try {
            conn = ConnectionManager.getConnection();

            if (userID != null && !userID.isEmpty()) {

                //getting PreparedStatement to execute query
                stmt = conn.prepareStatement("SELECT * FROM STAFF WHERE userID = ?");
                stmt.setString(1, userID);
                //Resultset returned by query
                rs = stmt.executeQuery();
                String staffPassword = "";
                if (rs.next()) {
                    staffPassword = rs.getString("password");
                }
                if (!staffPassword.isEmpty()) {
                    if (BCrypt.checkpw(password, staffPassword)) {
                        return true;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return false;
    }

    public Staff retrieveStaff(String userID, String password) throws SQLException {
        Staff s = null;
        try {
            conn = ConnectionManager.getConnection();

            if (userID != null && !userID.isEmpty()) {

                //getting PreparedStatement to execute query
                stmt = conn.prepareStatement("SELECT * FROM STAFF WHERE userID = ?");
                stmt.setString(1, userID);
                //Resultset returned by query
                rs = stmt.executeQuery();

                while (rs.next()) {
                    String staffID = rs.getString("userID");
                    String staffPassword = rs.getString("password");
                    String staffName = rs.getString("staffName");
                    String staffOffice = rs.getString("staffOffice");
                    String staffRank = rs.getString("staffRank");
                    if (BCrypt.checkpw(password, staffPassword)) {
                        s = new Staff(staffID, staffPassword, staffName, staffOffice, staffRank);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return s;
    }

    public static void updatePassword(Staff staff) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Staff SET password = ? where userID = ?");
            stmt.setString(1, staff.getPassword());
            stmt.setString(2, staff.getUserID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }

}
