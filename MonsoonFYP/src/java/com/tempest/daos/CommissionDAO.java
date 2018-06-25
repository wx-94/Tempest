/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.daos;

import com.tempest.dbconnection.ConnectionManager;
import com.tempest.entities.Commission;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author jacky
 */
public class CommissionDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    StaffDAO staffDAO = new StaffDAO();
    HairServicesDAO hairServicesDAO = new HairServicesDAO();

    public boolean createCommission(Commission commission) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;
        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("INSERT into Commission(stylistID,amount,date,category,hairService) VALUES(?,?,?,?,?)");

        stmt.setString(1, commission.getStylistID());
        stmt.setDouble(2, commission.getPrice());
        stmt.setDate(3, commission.getDate());
        stmt.setString(4, commission.getCategory());
        stmt.setString(5, commission.getHairService());
        int check = stmt.executeUpdate();

        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }

    public boolean deleteCommission(Commission commission) throws SQLException {
        conn = ConnectionManager.getConnection();
        conn.setAutoCommit(false);
        boolean success = false;

        int commissionID = commission.getCommissionID();

        //getting PreparedStatement to execute query
        stmt = conn.prepareStatement("DELETE FROM `Commission` WHERE commissionID = ?");
        stmt.setInt(1, commissionID);

        int check = stmt.executeUpdate();
        if (check == 1) {
            success = true;
        }

        conn.commit();
        ConnectionManager.close(conn, stmt, rs);
        return success;
    }

    public void updateCommission(Commission commission, Double amount) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE Commission SET amount = ? where commissionID = ?");

            stmt.setDouble(1, amount);
            stmt.setInt(2, commission.getCommissionID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
    }

    public ArrayList<Commission> retrieveAllCommissionByYearByMonth(String month, String year) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Commission> commissionList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Commission where MONTH(date) = ? and YEAR(date)=?");
            stmt.setString(1, month);
            stmt.setString(2, year);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int commissionID = rs.getInt("commissionID");
                String stylistID = rs.getString("stylistID");
                Double amount = rs.getDouble("amount");
                Date date = rs.getDate("date");
                String category = rs.getString("category");
                String hairServices = rs.getString("hairService");


                Commission commission = new Commission(commissionID,stylistID,amount,date,category,hairServices);
                commissionList.add(commission);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return commissionList;
    }
    
    public ArrayList<Commission> retrieveAllCommissionByStylistByYearByMonth(String stylist, String month, String year) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Commission> commissionList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Commission where MONTH(date) = ? and YEAR(date)=? and stylistID = ?");
            stmt.setString(1, month);
            stmt.setString(2, year);
            stmt.setString(3, stylist);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int commissionID = rs.getInt("commissionID");
                String stylistID = rs.getString("stylistID");
                Double amount = rs.getDouble("amount");
                Date date = rs.getDate("date");
                String category = rs.getString("category");
                String hairServices = rs.getString("hairService");


                Commission commission = new Commission(commissionID,stylistID,amount,date,category,hairServices);
                commissionList.add(commission);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return commissionList;
    }
}
