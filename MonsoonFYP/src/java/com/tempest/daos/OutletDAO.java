/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.Outlet;
import com.tempest.utility.BCrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author jacky
 */
public class OutletDAO {
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public Outlet retrieveOutlet(String number) throws SQLException {
        Outlet o = null;
        conn = ConnectionManager.getConnection();

        if (number != null && !number.isEmpty()) {

            //getting PreparedStatement to execute query
            stmt = conn.prepareStatement("SELECT * FROM OUTLET WHERE outletNumber = ?");
            stmt.setString(1, number);
            //Resultset returned by query
            rs = stmt.executeQuery();

            while (rs.next()) {
                String outletName = rs.getString("outletName");
                String outletAddress = rs.getString("outletAddress");
                String outletNumber = rs.getString("outletNumber");                
            }
        }
        ConnectionManager.close(conn, stmt, rs);
        return o;
    }
    
    public static void updateAddress(Outlet outlet) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Outlet SET Address = ? where outletNumber = ?");
            stmt.setString(1, outlet.getOutletAddress());
            stmt.setString(2, outlet.getOutletNumber());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }
    
    public static ArrayList<Outlet> retrieveAll() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;    
        ArrayList<Outlet> outletList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Outlet");
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Outlet o = new Outlet(rs.getString("outletName"), rs.getString("outletAddress"), rs.getString("outletNumber"));
                outletList.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return outletList;
    }
}
