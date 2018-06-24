/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.entities;

import java.sql.Date;
import java.sql.Time;
/**
 *
 * @author Xuan
 */
public class StaffAvailability {
    
    private int staffAvailabilityID;
    private String staffName;
    private String outletName;
    private Date availableDate;
    private Time availableStartTime;
    private Time availableEndTime;

    public StaffAvailability(int staffAvailabilityID, String staffName, String outletName, Date availableDate, Time availableStartTime, Time availableEndTime) {
        this.staffAvailabilityID = staffAvailabilityID;
        this.staffName = staffName;
        this.outletName = outletName;
        this.availableDate = availableDate;
        this.availableStartTime = availableStartTime;
        this.availableEndTime = availableEndTime;
    }
    
    public StaffAvailability(String staffName, String outletName, Date availableDate, Time availableStartTime, Time availableEndTime) {
        this.staffName = staffName;
        this.outletName = outletName;
        this.availableDate = availableDate;
        this.availableStartTime = availableStartTime;
        this.availableEndTime = availableEndTime;
    }

    public int getStaffAvailabilityID() {
        return staffAvailabilityID;
    }

    public void setStaffAvailabilityID(int staffAvailabilityID) {
        this.staffAvailabilityID = staffAvailabilityID;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getOutletName() {
        return outletName;
    }

    public void setOutletName(String outletName) {
        this.outletName = outletName;
    }

    public Date getAvailableDate() {
        return availableDate;
    }

    public void setAvailableDate(Date availableDate) {
        this.availableDate = availableDate;
    }

    public Time getAvailableStartTime() {
        return availableStartTime;
    }

    public void setAvailableStartTime(Time availableStartTime) {
        this.availableStartTime = availableStartTime;
    }

    public Time getAvailableEndTime() {
        return availableEndTime;
    }

    public void setAvailableEndTime(Time availableEndTime) {
        this.availableEndTime = availableEndTime;
    }
    
}
