package com.apress.jsf;

public class Airport {
    String code;
    String name;

    public Airport() {

    }

    public Airport(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String toString() {
        return code;
    }
}
