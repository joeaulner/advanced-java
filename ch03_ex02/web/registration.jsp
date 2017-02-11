<html>
<head>
    <title>Register User</title>
</head>
<body>
<h1>Register User</h1>

<jsp:useBean id="user" scope="session" class="com.apress.faq.User">
    <jsp:setProperty name="user" property="*" />
</jsp:useBean>

Welcome new user, these are the values you submitted:
<p>Your first name is <%= user.getFirstName() %>.</p>
<p>
    Your last name is
    <jsp:getProperty name="user" property="surname" />.
</p>
<p>
    Your age is
    <jsp:getProperty name="user" property="age" />.
</p>
You selected these topics:

<%
    String[] topics = request.getParameterValues("topics");
    if (topics == null) {
        topics = new String[]  { "No topics" };
    }
    for (int i = 0; i < topics.length; ++i) {
%>
<br>
<%= topics[i] %>
<%
    }
%>
<p>
    This request was submitted at
    <%= request.getParameter("submitTime") %>
</p>
<p>Go to <a href="welcome.jsp">Topic List Page</a></p>
<%@ include file="WEB-INF/footer.jspf" %>
</body>
</html>