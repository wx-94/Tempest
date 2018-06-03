/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.entities;

import java.sql.Date;

/**
 *
 * @author Xuan
 */
public class Item {
    private int id;
    private String name;
    private String description;
    private double price;
    private int quantity;
    private Date dateAdded;
    private String comments;
    private int outletId;

    public Item(int id, String name, String description, double price, int quantity, Date dateAdded, String comments, int outletId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.dateAdded = dateAdded;
        this.comments = comments;
        this.outletId = outletId;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getOutletId() {
        return outletId;
    }

    public void setOutletName(int outletId) {
        this.outletId = outletId;
    }    
}
