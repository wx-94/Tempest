/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.Item;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Xuan
 */
public class InventoryDAO {
    
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    OutletDAO outletDAO = new OutletDAO();

    
    //retrieve all inventory
    public ArrayList<Item> retrieveAllInventory() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> itemlist = new ArrayList<>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM `outletinventory`");            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int productId = rs.getInt("productID");
                String name = rs.getString("productName");
                String description = rs.getString("productDesc");
                double price = rs.getDouble("productPrice");
                int quantity = rs.getInt("productQty");
                Date dateAdded = rs.getDate("dateAdded");
                String comments = rs.getString("comments");
                int outletId = rs.getInt("outletID");
                Item item = new Item(productId, name, description, price, quantity, dateAdded, comments, outletId);
                itemlist.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return itemlist;
    }
    
    
    //retrieve inventory by outlet
    public ArrayList<Item> retrieveInventoryByOutlet(int outletId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Item> itemlist = new ArrayList<>();
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from OutletInventory where outletID = ?");            
            stmt.setInt(1, outletId);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int productId = rs.getInt("productID");
                String name = rs.getString("productName");
                String description = rs.getString("productDesc");
                double price = rs.getDouble("productPrice");
                int quantity = rs.getInt("productQty");
                Date dateAdded = rs.getDate("dateAdded");
                String comments = rs.getString("comments");
                Item item = new Item(productId, name, description, price, quantity, dateAdded, comments, outletId);
                itemlist.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return itemlist;
    }
    
    //add inventory
    
    
    //delete inventory
    
    
    //update inventory
    
    
}
