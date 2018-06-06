/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tempest.entities;

import java.sql.Time;

/**
 *
 * @author jacky
 */
public class Outlet {
    private String outletName;
    private String outletAddress;
    private String outletNumber;
    private Time weekdayStart;
    private Time weekdayEnd;
    private Time weekendStart;
    private Time weekendEnd;
    private Time publicHolStart;
    private Time publicHolEnd;

    public Outlet(String outletName, String outletAddress, String outletNumber, Time weekdayStart, Time weekdayEnd, Time weekendStart, Time weekendEnd, Time publicHolStart, Time publicHolEnd) {
        this.outletName = outletName;
        this.outletAddress = outletAddress;
        this.outletNumber = outletNumber;
        this.weekdayStart = weekdayStart;
        this.weekdayEnd = weekdayEnd;
        this.weekendStart = weekendStart;
        this.weekendEnd = weekendEnd;
        this.publicHolStart = publicHolStart;
        this.publicHolEnd = publicHolEnd;
    }

    public String getOutletName() {
        return outletName;
    }

    public void setOutletName(String outletName) {
        this.outletName = outletName;
    }

    public String getOutletAddress() {
        return outletAddress;
    }

    public void setOutletAddress(String outletAddress) {
        this.outletAddress = outletAddress;
    }

    public String getOutletNumber() {
        return outletNumber;
    }

    public void setOutletNumber(String outletNumber) {
        this.outletNumber = outletNumber;
    }

    public Time getWeekdayStart() {
        return weekdayStart;
    }

    public Time getWeekdayEnd() {
        return weekdayEnd;
    }

    public Time getWeekendStart() {
        return weekendStart;
    }

    public Time getWeekendEnd() {
        return weekendEnd;
    }

    public Time getPublicHolStart() {
        return publicHolStart;
    }

    public Time getPublicHolEnd() {
        return publicHolEnd;
    }

    public void setWeekdayStart(Time weekdayStart) {
        this.weekdayStart = weekdayStart;
    }

    public void setWeekdayEnd(Time weekdayEnd) {
        this.weekdayEnd = weekdayEnd;
    }

    public void setWeekendStart(Time weekendStart) {
        this.weekendStart = weekendStart;
    }

    public void setWeekendEnd(Time weekendEnd) {
        this.weekendEnd = weekendEnd;
    }

    public void setPublicHolStart(Time publicHolStart) {
        this.publicHolStart = publicHolStart;
    }

    public void setPublicHolEnd(Time publicHolEnd) {
        this.publicHolEnd = publicHolEnd;
    }
    
    
}
