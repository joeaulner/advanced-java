package com.apress.faq;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.util.Iterator;
import java.util.Map;

public class ListQuestionsInBody extends BodyTagSupport {
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

        if (qids.hasNext()) {
            Object qid = qids.next();
            setVariables(qid, qmap.get(qid));
            return EVAL_BODY_INCLUDE;
        } else {
            return SKIP_BODY;
        }
    }

    public int doAfterBody() throws JspTagException {
        if (qids.hasNext()) {
            Object key = qids.next();
            setVariables(key, qmap.get(key));
            return EVAL_BODY_BUFFERED;
        } else {
            return SKIP_BODY;
        }
    }

    public int doEndTag() throws JspTagException {
        return EVAL_PAGE;
    }

    private void setVariables(Object key, Object value) {
        pageContext.setAttribute("question", value);
        pageContext.setAttribute("qid", key);
    }
}
