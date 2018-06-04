/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.Customer;
import com.tempest.utility.BCrypt;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Xuan
 */
public class CustomerDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    public boolean verifyCustomer(String email, String password) throws SQLException {
        try {
            conn = ConnectionManager.getConnection();

            if (email != null && !email.isEmpty()) {

                //getting PreparedStatement to execute query
                stmt = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE email = ?");
                stmt.setString(1, email);
                //Resultset returned by query
                rs = stmt.executeQuery();

                String customerPassword = "";
                if (rs.next()) {
                    customerPassword = rs.getString("password");
                }
                if (!customerPassword.isEmpty()) {
                    if (BCrypt.checkpw(password, customerPassword)) {
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

    public boolean createCustomer(Customer customer) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;
        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("INSERT into CUSTOMER(name,email,points,password,number) VALUES(?,?,?,?,?)");

        stmt.setString(1, customer.getCustomerName());
        stmt.setString(2, customer.getCustomerEmail());
        stmt.setDouble(3, customer.getCustomerPoints());
        stmt.setString(4, customer.getCustomerPassword());
        stmt.setString(5, customer.getCustomerNumber());

        int check = stmt.executeUpdate();

        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }

    public Customer retrieveCustomer(String email) throws SQLException {
        Customer c = null;
        conn = ConnectionManager.getConnection();

        if (email != null && !email.isEmpty()) {

            //getting PreparedStatement to execute query
            stmt = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE email = ?");
            stmt.setString(1, email);
            //Resultset returned by query
            rs = stmt.executeQuery();

            while (rs.next()) {
                String customerName = rs.getString("name");
                String customerEmail = rs.getString("email");
                double customerPoints = rs.getDouble("points");
                String customerPassword = rs.getString("password");
                String customerNumber = rs.getString("number");
                c = new Customer(customerName, customerEmail, customerPoints, customerPassword, customerNumber);

            }
        }
        ConnectionManager.close(conn, stmt, rs);
        return c;
    }

    public void updatePassword(Customer customer) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Customer SET password = ? where email = ?");
            stmt.setString(1, customer.getCustomerPassword());
            stmt.setString(2, customer.getCustomerEmail());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }
    
    public void updateLoyaltyPoints(String email, Double points) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Customer SET points = ? where email = ?");
            stmt.setDouble(1, points);
            stmt.setString(2, email);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }
    
    public static void updateProfile(Customer customer, String newNumber, InputStream inputStream) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Customer SET number = ?, photo = ? where email = ?");
            stmt.setInt(1, Integer.parseInt(newNumber));
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                stmt.setBlob(2, inputStream);
            }
            
            stmt.setString(3, customer.getCustomerEmail());
            
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }
}
