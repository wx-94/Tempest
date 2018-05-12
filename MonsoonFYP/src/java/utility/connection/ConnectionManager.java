/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jacky
 */
public class ConnectionManager {

    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/MonsoonDB?useSSL=false"; //need change url

    /**
     *Attempts to establish a connection to the given database URL. The DriverManager attempts to select an appropriate driver from the set of registered JDBC drivers.
     * @return Connection
     * @throws SQLException if a database access error occurs
     */
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName(DRIVER_NAME).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, "root", "");
    }

    /**
     *Releases Connection object's database and JDBC resources immediately instead of waiting for them to be automatically released.
     * @param conn  Connection to be closed
     * @param stmt  Statement of query
     * @param rs    ResultSet of query
     */
    public static void close(Connection conn,
            Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     *Releases Connection object's database and JDBC resources immediately instead of waiting for them to be automatically released.
     * @param conn  Connection to be closed
     * @param stmt  Statement of query
     */
    public static void close(Connection conn, Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


