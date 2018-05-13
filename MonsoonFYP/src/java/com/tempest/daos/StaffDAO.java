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
         conn = ConnectionManager.getConnection();

        if (userID != null && !userID.isEmpty()) {

            //getting PreparedStatement to execute query
            stmt = conn.prepareStatement("SELECT * FROM STAFF WHERE userID = ?");
            stmt.setString(1, userID);
            //Resultset returned by query
            rs = stmt.executeQuery();
        
            String staffPassword = rs.getString("password");
            if (BCrypt.checkpw(password, staffPassword)) {
                    return true;
                }
        }
        return false;
    }
    
    public Staff retrieveStaff(String userID, String password) throws SQLException {
        Staff s = null;
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
        ConnectionManager.close(conn, stmt, rs);
        return s;
    }


}
