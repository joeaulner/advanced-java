package com.apress.faq;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

public class ListQuestions extends TagSupport {
    private String topic;
    private Iterator qids;
    private Map qmap;

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public int doStartTag() throws JspTagException {
        Questions questions = new Questions();
        questions.setTopic(topic);

        qmap = questions.getQuestions();
        qids = qmap.keySet().iterator();
        try {
            // write some preliminary data to the response
            pageContext.getOut().write("<h2>Questions for Topic</h2>");
            pageContext.getOut().write("\nThe number of questions in topic" +
                    topic + " is " + qmap.size());
        } catch (IOException ex) {
            throw new JspTagException("Error writing to out");
        }
        return EVAL_BODY_INCLUDE;
    }

    public int doAfterBody() throws JspTagException {
        // create the link for a single question
        // each time this method is called by the page class,
        // the Iterator advances to the next question
        if (qids.hasNext()) {
            String qid = (String) qids.next();
            String s = "<p>Question <a href=\"Questions.jsp?qid=" + qid +
                    "\">" + qid + "</a>: " +
                    qmap.get(qid) + "</p>";
            try {
                pageContext.getOut().write(s);
            } catch (IOException ex) {
                throw new JspTagException("Error writing to out");
            }
            return EVAL_BODY_AGAIN;
        } else {
            return SKIP_BODY;
        }
    }

    public int doEndTag() throws JspTagException {
        try {
            pageContext.getOut().write("<p>Click a link to see the answer</p>");
        } catch (IOException ex) {
            throw new JspTagException("Error writing to out");
        }
        return EVAL_PAGE;
    }
}
