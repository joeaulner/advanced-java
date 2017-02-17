<%@ page import="java.util.*" %>
<html>
<head>
    <title>Topic Questions</title>
</head>
<body>
<h1>Topic Questions</h1>

<jsp:useBean id="questions" class="com.apress.faq.Questions">
    <jsp:setProperty name="questions" property="topic"/>
</jsp:useBean>

The number of questions in topic ${questions.topic} is ${questions.numQuestions}
<%
    Map topic = questions.getQuestions();
    Iterator keys = topic.keySet().iterator();
    while (keys.hasNext()) {
        String key = (String) keys.next();
        pageContext.setAttribute("key", key);
%>
<p>
    Question
    <a href="Questions.jsp?qid=${key}">${key}</a>:
    ${questions.questions[key]}
</p>
<%
    }
%>
</body>
</html>
