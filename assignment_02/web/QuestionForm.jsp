<html>
<head>
    <title>New Question</title>
</head>
<body>
<h1>Add a New Question</h1>
<form action="Questions.jsp?reqType=newQuestion" method="post">
    <div>
        <label>Question</label>
<%
    String value = request.getParameter("question");
    if (value == null) {
        value = "";
    }
%>
        <input name="question"
               type="text"
               value="<%= value %>"
               <%= value.equals("") ? "" : "readonly" %>>
    </div>
    <div>
        <label>Answer</label>
        <input name="answer" type="text">
    </div>
    <input type="submit" value="Submit">
</form>
<%@ include file="WEB-INF/Footer.jspf" %>
</body>
</html>