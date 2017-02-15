package com.apress.faq;

public class Question {
    public String question;
    public String answer;

    public Question(String question) {
        this.question = question;
    }

    public Question(String question, String answer) {
        this.question = question;
        this.answer = answer;
    }
}
