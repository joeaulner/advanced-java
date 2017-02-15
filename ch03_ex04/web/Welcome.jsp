<%@ page errorPage="WEB-INF/ErrorPage.jsp"
    import="java.util.Iterator, com.apress.faq.*" %>

<%
    User user = (User) session.getAttribute("user");
    String reqType = request.getParameter("reqType");
    if (user == null && reqType == null) {
%>
    <jsp:forward page="RegistrationForm.html"/>
<%
    } else if (user == null) {
%>
    <jsp:forward page="Registration.jsp">
        <jsp:param name="submitTime"
                   value="<%= (new java.util.Date()).toString() %>"/>
    </jsp:forward>
<%
    }
%>
<html>
<head>
    <meta name="Cache-control" content="no-cache">
    <title>Java FAQ Welcome Page</title>
</head>

<body>
<h1>Java FAQ Welcome Page</h1>
Welcome to the Java FAQ

<%! FaqCategories faqs = new FaqCategories(); %>
Click a link below for answers to the given topic.
<%
    Iterator categories = faqs.getAllCategories();
    while (categories.hasNext()) {
        String category = (String) categories.next();
%>
<p>
    <a href="<%= replaceUnderscore(category) %>.jsp"><%= category %></a>
</p>
<%
    }
%>

<%@ include file="WEB-INF/Footer.jspf" %>
</body>
</html>

<%!
    public String replaceUnderscore(String s) {
        return s.replace(' ', '_');
    }
%>