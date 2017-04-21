<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<c:if test="${!user.authenticated}">
    <c:redirect url="Login.faces" />
</c:if>
<c:if test="${user.authenticated}}">
    <html>
    <f:view>
        <head>
            <title>Home - Final Project</title>
        </head>
        <body>
        <h1>Welcome!</h1>
        </body>
    </f:view>
    </html>
</c:if>
