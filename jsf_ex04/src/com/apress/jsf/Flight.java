package com.apress.jsf;

import java.util.Date;

public class Flight {
    String flightNum;
    private Airport origination;
    private Airport destination;
    private Date departDate;
    private String departTime;
    private Date returnDate;
    private String returnTime;

    public String getFlightNum() {
        return flightNum;
    }

    public void setFlightNum(String flightNum) {
        this.flightNum = flightNum;
    }

    public Airport getOrigination() {
        return origination;
    }

    public void setOrigination(Airport origination) {
        this.origination = origination;
    }

    public Airport getDestination() {
        return destination;
    }

    public void setDestination(Airport destination) {
        this.destination = destination;
    }

    public Date getDepartDate() {
        return departDate;
    }

    public void setDepartDate(Date departDate) {
        this.departDate = departDate;
    }

    public String getDepartTime() {
        return departTime;
    }

    public void setDepartTime(String departTime) {
        this.departTime = departTime;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }

    public String toString() {
        return "Flight " + flightNum + " departing " + origination + " at " +
                departTime + " arriving "  + destination + " 2 hours later";
    }
}
