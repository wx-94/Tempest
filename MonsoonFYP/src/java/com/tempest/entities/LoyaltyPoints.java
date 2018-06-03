/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.entities;

import java.sql.Date;

/**
 *
 * @author jacky
 */
public class LoyaltyPoints {
    private int pointsID;
    private Date dateOfChanges;
    private double loyaltyPointsAdd;
    private double loyaltyPointsMinus;
    private String type;
    private String customerID;
	private int appointmentID;

    public LoyaltyPoints(int pointsID, Date dateOfChanges, double loyaltyPointsAdd, double loyaltyPointsMinus, String type, String customerID, int appointmentID) {
        this.pointsID = pointsID;
        this.dateOfChanges = dateOfChanges;
        this.loyaltyPointsAdd = loyaltyPointsAdd;
        this.loyaltyPointsMinus = loyaltyPointsMinus;
        this.type = type;
        this.customerID = customerID; //customer email
		this.appointmentID = appointmentID;
    }

    public int getPointsID() {
        return pointsID;
    }

    public Date getDateOfChanges() {
        return dateOfChanges;
    }

    public double getLoyaltyPointsAdd() {
        return loyaltyPointsAdd;
    }

    public double getLoyaltyPointsMinus() {
        return loyaltyPointsMinus;
    }

    public String getType() {
        return type;
    }

    public String getCustomerID() {
        return customerID;
    }
	
	public int getAppointmentID() {
		return appointmentID;
	}

    public void setLoyaltyPointsAdd(double loyaltyPointsAdd) {
        this.loyaltyPointsAdd = loyaltyPointsAdd;
    }

    public void setLoyaltyPointsMinus(double loyaltyPointsMinus) {
        this.loyaltyPointsMinus = loyaltyPointsMinus;
    }


}
