/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.entities;

import java.io.InputStream;
import java.sql.Blob;

/**
 *
 * @author Xuan
 */
public class Customer {
    private String customerName;
    private String customerEmail;
    private double customerPoints;
    private String customerPassword;
    private String customerNumber;
    private Blob customerPicture;
    
    public Customer(String customerName, String customerEmail, double customerPoints, String customerPassword, String customerNumber, Blob customerPicture) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPoints = customerPoints;
        this.customerPassword = customerPassword;
        this.customerNumber = customerNumber;
        this.customerPicture = customerPicture;
    }
    
    public Customer(String customerName, String customerEmail, double customerPoints, String customerPassword, String customerNumber) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPoints = customerPoints;
        this.customerPassword = customerPassword;
        this.customerNumber = customerNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public double getCustomerPoints() {
        return customerPoints;
    }

    public void setCustomerPoint(double customerPoints) {
        this.customerPoints = customerPoints;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(String customerNumber) {
        this.customerNumber = customerNumber;
    }

    public Blob getCustomerPicture() {
        return customerPicture;
    }

    public void setCustomerPicture(Blob customerPicture) {
        this.customerPicture = customerPicture;
    }
    
}
