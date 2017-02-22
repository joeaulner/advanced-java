package com.apress.jsf;

import javax.faces.model.SelectItem;

public class FlightTypes {
    private SelectItem[] tripTypes = new SelectItem[] {
            new SelectItem("Roundtrip", "Roundtrip"),
            new SelectItem("One way", "One way")
    };

    public SelectItem[] getTripTypes() {
        return tripTypes;
    }

    public void setTripTypes(SelectItem[] tripTypes) {
        this.tripTypes = tripTypes;
    }
}
