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
    private Outlet outlet;
    private Customer customer;
    private Staff staff;
    private Date dateOfAppointment;
    private Time startTimeOfAppointment;
    private Time endTimeOfAppointment;
    private HairServices treatment;

    public Appointment(Customer customer, Staff staff, Outlet outlet, HairServices treatment, Date dateOfAppointment, Time startTimeOfAppointment, Time endTimeOfAppointment) {
        this.outlet = outlet;
        this.customer = customer;
        this.staff = staff;
        this.outlet = outlet;
        this.treatment = treatment;
        this.dateOfAppointment = dateOfAppointment;
        this.startTimeOfAppointment = startTimeOfAppointment;
        this.endTimeOfAppointment = endTimeOfAppointment;
    }

    public HairServices getTreatment() {
        return treatment;
    }

    public Outlet getOutlet() {
        return outlet;
    }

    public Customer getCustomer() {
        return customer;
    }

    public Staff getStaff() {
        return staff;
    }

    public Date getDateOfAppointment() {
        return dateOfAppointment;
    }

    public Time getStartTimeOfAppointment() {
        return startTimeOfAppointment;
    }

    public Time getEndTimeOfAppointment() {
        return endTimeOfAppointment;
    }
    
    
    
}
