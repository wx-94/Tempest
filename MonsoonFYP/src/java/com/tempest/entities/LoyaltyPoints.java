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
    private int appointmentID;
    private String outlet;
    private Date dateOfAppointment;
    private String treatment;
    private double loyaltyPoints;

    public LoyaltyPoints(int appointmentID, String outlet, Date dateOfAppointment, String treatment, double loyaltyPoints) {
        this.appointmentID = appointmentID;
        this.outlet = outlet;
        this.dateOfAppointment = dateOfAppointment;
        this.treatment = treatment;
        this.loyaltyPoints = loyaltyPoints;
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public String getOutlet() {
        return outlet;
    }

    public Date getDateOfAppointment() {
        return dateOfAppointment;
    }

    public String getTreatment() {
        return treatment;
    }

    public double getLoyaltyPoints() {
        return loyaltyPoints;
    }
}
