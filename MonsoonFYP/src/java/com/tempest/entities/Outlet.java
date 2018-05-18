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
public class Outlet {
    private String outletName;
    private String outletAddress;
    private String outletNumber;

    public Outlet(String outletName, String outletAddress, String outletNumber) {
        this.outletName = outletName;
        this.outletAddress = outletAddress;
        this.outletNumber = outletNumber;
    }

    public String getOutletName() {
        return outletName;
    }

    public void setOutletName(String outletName) {
        this.outletName = outletName;
    }

    public String getOutletAddress() {
        return outletAddress;
    }

    public void setOutletAddress(String outletAddress) {
        this.outletAddress = outletAddress;
    }

    public String getOutletNumber() {
        return outletNumber;
    }

    public void setOutletNumber(String outletNumber) {
        this.outletNumber = outletNumber;
    }
    
}
