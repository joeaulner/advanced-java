package com.apress.jsf;

import javax.faces.model.SelectItem;

public class FlightTimes {
    private SelectItem[] times = new SelectItem[] {
            new SelectItem("Anytime", "Anytime"),
            new SelectItem("Morning", "Morning"),
            new SelectItem("Afternoon", "Afternoon"),
            new SelectItem("Evening", "Evening")
    };

    public SelectItem[] getTimes() {
        return times;
    }

    public void setTimes(SelectItem[] times) {
        this.times = times;
    }
}
