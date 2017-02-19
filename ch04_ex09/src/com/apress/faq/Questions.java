package com.apress.faq;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class Questions {
    private String topic;
    private int numQuestions;
    private Map<String, Map> questions = new HashMap<String, Map>();

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public int getNumQuestions() {
        return numQuestions;
    }

    public void setNumQuestions(int numQuestions) {
        this.numQuestions = numQuestions;
    }

    public Map getQuestions() {
        return questions.get(topic);
    }

    public void setQuestions(Map<String, Map> questions) {
        this.questions = questions;
    }

    public Questions() {
        Map<String, String> topic = new TreeMap<String, String>();
        topic.put("EL_1", "How do I use implicit objects?");
        topic.put("EL_2", "How do I use the JSTL?");
        topic.put("EL_3", "How do I use the 'empty' operator?");
        questions.put("EL", topic);
    }
}
