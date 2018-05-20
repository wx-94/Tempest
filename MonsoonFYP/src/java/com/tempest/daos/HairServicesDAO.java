/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.HairServices;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author jacky
 */
public class HairServicesDAO {

    public static ArrayList<HairServices> retrieveAllHairServices() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<HairServices> hairServicesList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from HairServices");
            rs = stmt.executeQuery();

            while (rs.next()) {
                HairServices hairService = new HairServices(rs.getString("hairService"), rs.getInt("duration"),rs.getDouble("minCost"), rs.getDouble("maxCost"), rs.getDouble("loyaltyPoints"));
                hairServicesList.add(hairService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return hairServicesList;
    }
    
    public HairServices retrieveHairService(String hairService) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        HairServices h = null;
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from HairServices WHERE hairService = ?");
            stmt.setString(1, hairService);
            //Resultset returned by query
            rs = stmt.executeQuery();
                        
            while (rs.next()) {
                String treatment = rs.getString("hairService");
                int duration = rs.getInt("duration");
                double minCost = rs.getDouble("minCost");
                double maxCost = rs.getDouble("maxCost");
                double loyaltyPoints = rs.getDouble("loyaltyPoints");
                h = new HairServices(treatment,duration,minCost,maxCost,loyaltyPoints);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return h;
    }
}
