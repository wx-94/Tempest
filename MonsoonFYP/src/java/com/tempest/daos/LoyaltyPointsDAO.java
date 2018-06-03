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
    public static ArrayList<LoyaltyPoints> retrieveAllPoints() {
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
    
    public static ArrayList<LoyaltyPoints> retrieveAllPointsByCustomer(String customer) {
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
}
