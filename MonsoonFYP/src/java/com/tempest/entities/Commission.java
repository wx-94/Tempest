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
public class Commission {
    private int commissionID;
    private String stylistID;
    private double price;
    private Date date;
    private String category;
    private String hairService;

    public Commission(int commissionID, String stylistID, double price, Date date, String category, String hairService) {
        this.commissionID = commissionID;
        this.stylistID = stylistID;
        this.price = price;
        this.date = date;
        this.category = category;
        this.hairService = hairService;
    }

    public Commission(String stylistID, double price, Date date, String category, String hairService) {
        this.stylistID = stylistID;
        this.price = price;
        this.date = date;
        this.category = category;
        this.hairService = hairService;
    }

    public int getCommissionID() {
        return commissionID;
    }

    public String getStylistID() {
        return stylistID;
    }

    public double getPrice() {
        return price;
    }

    public Date getDate() {
        return date;
    }

    public String getCategory() {
        return category;
    }

    public String getHairService() {
        return hairService;
    }

    public void setCommissionID(int commissionID) {
        this.commissionID = commissionID;
    }

    public void setStylistID(String stylistID) {
        this.stylistID = stylistID;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setHairService(String hairService) {
        this.hairService = hairService;
    }
    
    
    
}
