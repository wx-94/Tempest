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

    //retrieve item
    public Item retrieveItem(String itemIdOutletId) throws SQLException {
        Item item = null;
        String[] parts = itemIdOutletId.split(",");
        String itemId = parts[0]; 
        String outletId = parts[1]; 
        conn = ConnectionManager.getConnection();

        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("SELECT * FROM `outletinventory` WHERE productID = ? and outletID = ?");
        stmt.setInt(1, Integer.parseInt(itemId));
        stmt.setInt(2, Integer.parseInt(outletId));
        //Resultset returned by query
        rs = stmt.executeQuery();

        while (rs.next()) {
            int productId = rs.getInt("productID");
            String name = rs.getString("productName");
            String description = rs.getString("productDesc");
            double price = rs.getDouble("productPrice");
            int quantity = rs.getInt("productQty");
            Date dateAdded = rs.getDate("dateAdded");
            String comments = rs.getString("comments");
            item = new Item(productId, name, description, price, quantity, dateAdded, comments, Integer.parseInt(outletId));
        }

        ConnectionManager.close(conn, stmt, rs);
        return item;
    }

    //add inventory
    
    
    
    //delete inventory
    public boolean deleteItem(Item item) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;

        int itemId = item.getId();
        int outletId = item.getOutletId();

        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("DELETE FROM `outletinventory` WHERE productID = ? and outletID = ?");
        stmt.setInt(1, itemId);
        stmt.setInt(2, outletId);

        int check = stmt.executeUpdate();
        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }

    //update inventory
}
