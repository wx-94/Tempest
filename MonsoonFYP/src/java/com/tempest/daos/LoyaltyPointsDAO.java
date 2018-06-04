/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.LoyaltyPoints;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author jacky
 */
public class LoyaltyPointsDAO {
    public ArrayList<LoyaltyPoints> retrieveAllPoints() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<LoyaltyPoints> pointsList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from LoyaltyPoints");
            rs = stmt.executeQuery();

            while (rs.next()) {
                LoyaltyPoints points = new LoyaltyPoints(rs.getInt("pointsID "), rs.getDate("dateOfChanges"), rs.getDouble("loyaltyPointsAdd"), rs.getDouble("loyaltyPointsAdd"), rs.getString("type"),rs.getString("customerID"),rs.getInt("appointmentID "));
                pointsList.add(points);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return pointsList;
    }
    
    public ArrayList<LoyaltyPoints> retrieveAllPointsByCustomer(String customer) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<LoyaltyPoints> pointsList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from LoyaltyPoints where customerID = ?");
            stmt.setString(1, customer);
            rs = stmt.executeQuery();

            while (rs.next()) {                
                LoyaltyPoints points = new LoyaltyPoints(rs.getInt("pointsID "), rs.getDate("dateOfChanges"), rs.getDouble("loyaltyPointsAdd"), rs.getDouble("loyaltyPointsAdd"), rs.getString("type"),rs.getString("customerID"),rs.getInt("appointmentID "));
                pointsList.add(points);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return pointsList;
    }
    
    public void updatePoints(int pointsID, double pointsAdd, double pointsMinus) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE LoyaltyPoints SET loyaltyPointsAdd = ?, loyaltyPointsMinus = ?  where pointsID = ?");
            stmt.setInt(1, pointsID);
            stmt.setDouble(2, pointsAdd);
            stmt.setDouble(2, pointsMinus);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }
    
    public boolean createLoyaltyPoints(LoyaltyPoints loyaltyPoints) throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;
        //getting PreparedStatement to execute query
        PreparedStatement stmt = conn.prepareStatement("INSERT into LoyaltyPoints(dateOfChanges,loyaltyPointsAdd,loyaltyPointsMinus,type,customerID,appointmentID) VALUES(?,?,?,?,?,?)");
        
        stmt.setDate(1, loyaltyPoints.getDateOfChanges());
        stmt.setDouble(2, loyaltyPoints.getLoyaltyPointsAdd());
        stmt.setDouble(3, loyaltyPoints.getLoyaltyPointsMinus());
        stmt.setString(4, loyaltyPoints.getType());
        stmt.setString(5, loyaltyPoints.getCustomerID());
        stmt.setInt(6, loyaltyPoints.getAppointmentID());
        int check = stmt.executeUpdate();
        
        if (check == 1) {
            success = true;
        }
        
        conn.commit();
        ConnectionManager.close(conn, stmt);
        return success;
    }
}
