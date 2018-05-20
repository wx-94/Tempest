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
public class HairServices {
    private String hairService;
    private int duration;
    private double minCost;
    private double maxCost;
    private double loyaltyPoints;

    public HairServices(String hairService, int duration, double minCost, double maxCost, double loyaltyPoints) {
        this.hairService = hairService;
        this.duration = duration;
        this.minCost = minCost;
        this.maxCost = maxCost;
        this.loyaltyPoints = loyaltyPoints;
    }

    public String getHairService() {
        return hairService;
    }

    public void setHairService(String hairService) {
        this.hairService = hairService;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getMinCost() {
        return minCost;
    }

    public void setMinCost(double minCost) {
        this.minCost = minCost;
    }

    public double getMaxCost() {
        return maxCost;
    }

    public void setMaxCost(double maxCost) {
        this.maxCost = maxCost;
    }

    public double getLoyaltyPoints() {
        return loyaltyPoints;
    }

    public void setLoyaltyPoints(double loyaltyPoints) {
        this.loyaltyPoints = loyaltyPoints;
    }
    
}
