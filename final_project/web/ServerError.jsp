<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Server Error - Final Project</title>
    <%@ include file="WEB-INF/Stylesheets.jsp" %>
</head>
<body>
<div class="col-8 sm-col-6 md-col-4 p3">
    <h1>Server Error</h1>
    ${requestScope['javax.servlet.error.message']}
</div>
</body>
</html>
