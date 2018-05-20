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

    public Appointment(Outlet outlet, Customer customer, Staff staff, Date dateOfAppointment, Time startTimeOfAppointment, Time endTimeOfAppointment, HairServices treatment) {
        this.outlet = outlet;
        this.customer = customer;
        this.staff = staff;
        this.dateOfAppointment = dateOfAppointment;
        this.startTimeOfAppointment = startTimeOfAppointment;
        this.endTimeOfAppointment = endTimeOfAppointment;
        this.treatment = treatment;
    }

    public Outlet getOutlet() {
        return outlet;
    }

    public void setOutlet(Outlet outlet) {
        this.outlet = outlet;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
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

    public HairServices getTreatment() {
        return treatment;
    }

    public void setTreatment(HairServices treatment) {
        this.treatment = treatment;
    }

}
