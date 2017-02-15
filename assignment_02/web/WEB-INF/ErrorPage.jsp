<%@ page isErrorPage="true" import="java.io.PrintWriter" %>

<html>
<head>
    <title>Error</title>
</head>
<body>
<h1>Error</h1>
There was an error somewhere.
<p>Here is the stack trace</p>
<p>
    <% request.setAttribute("ex", exception); %>
    <jsp:include page="FormatStackTrace.jsp"/>
</p>
<%@ include file="/WEB-INF/Footer.jspf" %>
</body>
</html>