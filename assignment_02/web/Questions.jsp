<%@ page import="com.apress.faq.Question" %>
<html>
<head>
    <title>Questions</title>
</head>
<body>
<h1>All Questions</h1>

<jsp:useBean id="questions" scope="session" class="com.apress.faq.AllQuestions"/>

<%
    String reqType = request.getParameter("reqType");
    if (reqType != null) {
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        questions.submitQuestion(question, answer);
    }
%>

<ol>
<%
    for (Question question : questions.getAllQuestions()) {
%>
    <li>
        <%= question.question %>
<%
        if (question.answer == null) {
%>
        <div>
            - <a href="QuestionForm.jsp?question=<%= question.question %>">answer question</a>
        </div>
<%
        } else {
%>
        <div>- <%= question.answer %></div>
<%
        }
%>
    </li>
<%
    }
%>
</ol>
<p>
    <a href="QuestionForm.jsp">Add a New Question</a>
</p>
<p>
    Go to <a href="Welcome.jsp">Topic List Page</a>
</p>
<%@ include file="WEB-INF/Footer.jspf" %>
</body>
</html>