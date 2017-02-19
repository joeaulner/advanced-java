package com.apress.survey;

import java.util.Arrays;
import java.util.Date;

public class SurveyData {
    private String firstName;
    private String surname;
    private String gender;
    private int month;
    private int day;
    private int year;
    private Date birthDate;
    private String[] hobbies;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Date getBirthDate() {
        return new Date(year - 1900, month - 1, day);
    }

    public String[] getHobbies() {
        return hobbies;
    }

    public void setHobbies(String[] hobbies) {
        this.hobbies = hobbies;
    }

    public boolean hasHobby(String hobby) {
        return hobbies != null && Arrays.asList(hobbies).contains(hobby);
    }
}
