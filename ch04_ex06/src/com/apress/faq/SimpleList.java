package com.apress.faq;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

public class SimpleList extends SimpleTagSupport {
    private String topic;

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getTopic() {
        return topic;
    }

    public void doTag() throws JspException {
        Questions questions = new Questions();
        questions.setTopic(topic);

        // Get list of questions and the iterator for the keys
        Map qmap = questions.getQuestions();
        Iterator keys = qmap.keySet().iterator();

        while (keys.hasNext()) {
            try {
                Object key = keys.next();

                // store the parameters for invoke()
                getJspContext().setAttribute("qid", key);
                getJspContext().setAttribute("Question", qmap.get(key));

                // process the body
                getJspBody().invoke(null);
            } catch (IOException ex) {
                throw new JspException("Exception processing body");
            }
        }
    }
}
