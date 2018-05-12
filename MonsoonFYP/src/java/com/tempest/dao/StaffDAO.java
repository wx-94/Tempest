/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.tempest.entities.Staff;
import com.tempest.dbconnection.ConnectionManager;

/**
 *
 * @author jacky
 */
public class StaffDAO {

    public static boolean verifyStaff(String userID, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Staff where userID = ?");
            stmt.setString(1, userID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    return true;
                } else {
                    return false;
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

    public static Staff getStaff(String userID) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Staff where userID = ?");
            stmt.setString(1, userID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Staff s = new Staff(userID, rs.getString("password"), rs.getString("staffName"), rs.getString("staffOffice"), rs.getString("staffRank"));
                return s;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        return null;
    }
}
