<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head><title>Statement Example</title></head>
<body>
<h1>Statement Example</h1>

<sql:update dataSource="jdbc/DataSourceExample" var="count">
    insert into stock values ('${param.symbol}', '${param.name}')
</sql:update>

<c:if test="${count < 1}">
    Data was not inserted into database. Reason for failure is unknown
</c:if>
<c:if test="${count == 1}">
    Data successfully inserted into database

    <sql:query var="stocks" dataSource="jdbc/DataSourceExample">
        select * from stock
    </sql:query>

    <h2>All rows in STOCK table:</h2>
    <table border="1" width="50%">
        <tr>
            <th>Symbol</th>
            <th>Name</th>
        </tr>
        <c:forEach var="stock" items="${stocks.rows}">
            <tr>
                <td>${stock.symbol}</td>
                <td>${stock.name}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<p><a href="StockEntryForm.html">Insert new stock</a></p>
</body>
</html>