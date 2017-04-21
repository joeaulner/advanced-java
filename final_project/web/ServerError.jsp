<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Server Error - Final Project</title>
</head>
<body>
<h1>Server Error</h1>
${requestScope['javax.servlet.error.message']}
</body>
</html>
