/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.Customer;
import com.tempest.entities.Staff;
import com.tempest.utility.BCrypt;
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

    public Customer retrieveCustomer(String email, String password) throws SQLException {
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
                if (BCrypt.checkpw(password, customerPassword)) {
                    c = new Customer(customerName, customerEmail, customerPoints, customerPassword, customerNumber);
                }
            }
        }
        ConnectionManager.close(conn, stmt, rs);
        return c;
    }
}
