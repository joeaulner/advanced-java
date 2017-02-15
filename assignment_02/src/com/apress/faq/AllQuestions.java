package com.apress.faq;

import java.util.ArrayList;

public class AllQuestions {
    private ArrayList<Question> allQuestions;

    public AllQuestions() {
        allQuestions = new ArrayList<Question>();
    }

    public ArrayList<Question> getAllQuestions() {
        return allQuestions;
    }

    public void submitQuestion(String question, String answer) {
        boolean found = false;
        for (Question q : allQuestions) {
            if (q.question.equals(question)) {
                q.answer = answer;
                found = true;
            }
        }
        if (!found) {
            allQuestions.add(new Question(question));
        }
    }
}
