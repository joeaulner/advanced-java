package com.apress.jsf;

import java.util.ArrayList;
import java.util.List;

public class FlightSearch {
    private String origination;
    private String destination;
    private String departDate;
    private String departTime;
    private String returnDate;
    private String returnTime;
    private String tripType;
    private ArrayList matchingFlights = new ArrayList();

    public String getOrigination() {
        return origination;
    }

    public void setOrigination(String origination) {
        this.origination = origination;
        ((Flight) matchingFlights.get(0)).setOrigination(origination);
        ((Flight) matchingFlights.get(1)).setOrigination(origination);
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
        ((Flight) matchingFlights.get(0)).setDestination(destination);
        ((Flight) matchingFlights.get(1)).setDestination(destination);
        ((Flight) matchingFlights.get(0)).setFlightNum("133");
        ((Flight) matchingFlights.get(1)).setFlightNum("233");
    }

    public String getDepartDate() {
        return departDate;
    }

    public void setDepartDate(String departDate) {
        this.departDate = departDate;
        ((Flight) matchingFlights.get(0)).setDepartDate(departDate);
        ((Flight) matchingFlights.get(1)).setDepartDate(departDate);
    }

    public String getDepartTime() {
        return departTime;
    }

    public void setDepartTime(String departTime) {
        this.departTime = departTime;
        ((Flight) matchingFlights.get(0)).setDepartTime(departTime);
        ((Flight) matchingFlights.get(1)).setDepartTime(departTime);
    }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
        ((Flight) matchingFlights.get(0)).setReturnDate(returnDate);
        ((Flight) matchingFlights.get(1)).setReturnDate(returnDate);
    }

    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
        ((Flight) matchingFlights.get(0)).setReturnTime(returnTime);
        ((Flight) matchingFlights.get(1)).setReturnTime(returnTime);
    }

    public String getTripType() {
        return tripType;
    }

    public void setTripType(String tripType) {
        this.tripType = tripType;
    }

    public ArrayList getMatchingFlights() {
        return matchingFlights;
    }

    public void setMatchingFlights(List matchingFlights) {
        this.matchingFlights.addAll(matchingFlights);
    }
}
