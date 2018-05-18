/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.entities;

/**
 *
 * @author jacky
 */
public class Staff {
    private String userID;         	
    private String password;
    private String staffName;
    private String staffOffice;
    private String staffPosition;

    public Staff(String userID, String password, String staffName, String staffOffice, String staffPosition) {
        this.userID = userID;
        this.password = password;
        this.staffName = staffName;
        this.staffOffice = staffOffice;
        this.staffPosition = staffPosition;
    }

    public String getUserID() {
        return userID;
    }

    public String getPassword() {
        return password;
    }

    public String getStaffName() {
        return staffName;
    }

    public String getStaffOffice() {
        return staffOffice;
    }

    public String getStaffPosition() {
        return staffPosition;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
