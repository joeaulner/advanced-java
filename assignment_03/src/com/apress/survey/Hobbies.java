package com.apress.survey;

public class Hobbies {
    private String[] allHobbies;

    public Hobbies() {
        allHobbies = new String[] {
                "Reading",
                "Video Games",
                "Hiking",
                "Fishing",
                "Shopping"
        };
    }

    public String[] getAllHobbies() {
        return allHobbies;
    }
}
