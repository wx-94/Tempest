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
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

            if (email != null) {

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
                Blob customerPicture = rs.getBlob("photo");
                c = new Customer(customerName, customerEmail, customerPoints, customerPassword, customerNumber, customerPicture);

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

    public static void updateProfile(Customer customer, String newNumber, String newEmail, InputStream inputStream) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Customer SET number = ?, photo = ?, email = ? where email = ?");

            if (newNumber != null & !newNumber.isEmpty()) {
                stmt.setInt(1, Integer.parseInt(newNumber));
            } else {
                stmt.setInt(1, Integer.parseInt(customer.getCustomerNumber()));
            }

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                stmt.setBlob(2, inputStream);
            } else {
                stmt.setBlob(2, customer.getCustomerPicture());
            }

            if (newEmail != null && !newEmail.isEmpty()) {
                stmt.setString(3, newEmail);
                stmt.setString(4, customer.getCustomerEmail());
            } else {
                stmt.setString(3, customer.getCustomerEmail());
                stmt.setString(4, customer.getCustomerEmail());
            }

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }
    
    public static void updateProfileNoPhoto(Customer customer, String newNumber, String newEmail) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Customer SET number = ?, email = ? where email = ?");

            if (newNumber != null & !newNumber.isEmpty()) {
                stmt.setInt(1, Integer.parseInt(newNumber));
            } else {
                stmt.setInt(1, Integer.parseInt(customer.getCustomerNumber()));
            }

            if (newEmail != null && !newEmail.isEmpty()) {
                stmt.setString(2, newEmail);
                stmt.setString(3, customer.getCustomerEmail());
            } else {
                stmt.setString(2, customer.getCustomerEmail());
                stmt.setString(3, customer.getCustomerEmail());
            }

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }

    public ArrayList<String> retrieveAllNumbers() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<String> numList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select number from Customer");
            rs = stmt.executeQuery();

            while (rs.next()) {
                String number = rs.getString("number");
                numList.add(number);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return numList;
    }
    
    public ArrayList<String> retrieveAllEmails() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<String> emailList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select email from Customer");
            rs = stmt.executeQuery();

            while (rs.next()) {
                String email = rs.getString("email");
                emailList.add(email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return emailList;
    }
    
}
