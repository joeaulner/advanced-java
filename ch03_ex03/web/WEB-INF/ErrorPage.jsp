<%@ page isErrorPage="true" import="java.io.PrintWriter" %>

<html>
<head>
    <title>Error</title>
</head>
<body>
<h1>Error</h1>
There was an error somewhere.
<p>Here is the stack trace</p>
<p><% exception.printStackTrace(new PrintWriter(out)); %>/p>
<%@ include file="/WEB-INF/Footer.jspf" %>
</body>
</html>