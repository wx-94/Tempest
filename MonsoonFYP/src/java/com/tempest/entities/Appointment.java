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
 * @author jacky
 */
public class Appointment {
    private int appointmentID;
    private String outlet;
    private String customer;
    private String staff;
    private Date dateOfAppointment;
    private Time startTimeOfAppointment;
    private Time endTimeOfAppointment;
    private String treatment;

    public Appointment(int appointmentID, String outlet, String customer, String staff, Date dateOfAppointment, Time startTimeOfAppointment, Time endTimeOfAppointment, String treatment) {
        this.appointmentID = appointmentID;
        this.outlet = outlet;
        this.customer = customer;
        this.staff = staff;
        this.dateOfAppointment = dateOfAppointment;
        this.startTimeOfAppointment = startTimeOfAppointment;
        this.endTimeOfAppointment = endTimeOfAppointment;
        this.treatment = treatment;
    }
    
    public Appointment(String outlet, String customer, String staff, Date dateOfAppointment, Time startTimeOfAppointment, Time endTimeOfAppointment, String treatment) {
        this.outlet = outlet;
        this.customer = customer;
        this.staff = staff;
        this.dateOfAppointment = dateOfAppointment;
        this.startTimeOfAppointment = startTimeOfAppointment;
        this.endTimeOfAppointment = endTimeOfAppointment;
        this.treatment = treatment;
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public void setAppointmentID(int appointmentID) {
        this.appointmentID = appointmentID;
    }

    public String getOutlet() {
        return outlet;
    }

    public void setOutlet(String outlet) {
        this.outlet = outlet;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public Date getDateOfAppointment() {
        return dateOfAppointment;
    }

    public void setDateOfAppointment(Date dateOfAppointment) {
        this.dateOfAppointment = dateOfAppointment;
    }

    public Time getStartTimeOfAppointment() {
        return startTimeOfAppointment;
    }

    public void setStartTimeOfAppointment(Time startTimeOfAppointment) {
        this.startTimeOfAppointment = startTimeOfAppointment;
    }

    public Time getEndTimeOfAppointment() {
        return endTimeOfAppointment;
    }

    public void setEndTimeOfAppointment(Time endTimeOfAppointment) {
        this.endTimeOfAppointment = endTimeOfAppointment;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

}
