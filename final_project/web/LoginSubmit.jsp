<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<c:catch var="exception">
    <sql:query var="userResults" dataSource="${dataSource}">
        select * from users where email=? and password=?
        <sql:param value="${user.email}"/>
        <sql:param value="${user.password}"/>
    </sql:query>
    <c:if test="${userResults.rowCount == 0}">
    </c:if>
</c:catch>

<html>
<f:view>
    <head>
        <title>Logged In</title>
    </head>
    <body>
    <h:outputText value="#{user.email}"/>
    <h:outputText value="#{user.password}"/>
    </body>
</f:view>
</html>
