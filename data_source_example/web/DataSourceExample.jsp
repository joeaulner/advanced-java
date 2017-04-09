<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
    <title>DataSource Example</title>
</head>
<body>
<h1>DataSource Example</h1>

<c:catch var="exception">
    <sql:query var="customers" dataSource="jdbc/DataSourceExample">
        select * from customer
    </sql:query>

    <c:if test="${customers.getRowCount() == 0}">
        No results from query
    </c:if>
    <c:if test="${customers.getRowCount() > 0}">
        <table width="100%" border="1">
            <tr align="left">
                <th>Customer Num</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
            <c:forEach var="customer" items="${customers.rows}">
                <tr>
                    <td>${customer.customer_id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</c:catch>
<c:if test="${exception != null}">
    ${exception}
</c:if>
</body>
</html>