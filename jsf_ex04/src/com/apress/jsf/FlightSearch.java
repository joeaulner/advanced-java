package com.apress.jsf;

import javax.faces.context.FacesContext;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class FlightSearch {
    private Airport origination;
    private Airport destination;
    private Date departDate;
    private String departTime;
    private Date returnDate;
    private String returnTime;
    private String tripType;
    private ArrayList matchingFlights = new ArrayList();

    private String flightNum;
    private Flight matchingFlight;

    public Airport getOrigination() {
        return origination;
    }

    public void setOrigination(Airport origination) {
        this.origination = origination;
        ((Flight) matchingFlights.get(0)).setOrigination(origination);
        ((Flight) matchingFlights.get(1)).setOrigination(origination);
    }

    public Airport getDestination() {
        return destination;
    }

    public void setDestination(Airport destination) {
        this.destination = destination;
        ((Flight) matchingFlights.get(0)).setDestination(destination);
        ((Flight) matchingFlights.get(1)).setDestination(destination);
        ((Flight) matchingFlights.get(0)).setFlightNum("133");
        ((Flight) matchingFlights.get(1)).setFlightNum("233");
    }

    public Date getDepartDate() {
        return departDate;
    }

    public void setDepartDate(Date departDate) {
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

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
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

    public String reset() {
        this.setDepartDate(null);
        this.setDepartTime("");
        this.setDestination(null);
        this.setOrigination(null);
        this.setReturnDate(null);
        this.setReturnTime("");
        this.setTripType("");
        return "success";
    }

    public String search() {
        return origination.code.equals("BOS") && destination.code.equals("ORD") ?
                "success" :
                "no flights";
    }

    public Flight getMatchingFlight() {
        for (Object f : matchingFlights) {
            Flight flight = (Flight) f;
            if (flight.flightNum.equals(flightNum)) {
                return flight;
            }
        }
        return null;
    }

    public void setMatchingFlight(Flight flight) {
        matchingFlight = flight;
    }

    public String getFlightNum() {
        return flightNum;
    }

    public void setFlightNum(String flightNum) {
        this.flightNum = flightNum;
    }

    public String select() {
        FacesContext context = FacesContext.getCurrentInstance();
        Map requestParams = context.getExternalContext().getRequestParameterMap();
        flightNum = (String) requestParams.get("flightNum");
        return "select";
    }
}
