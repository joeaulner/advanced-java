<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head><title>Statement Example</title></head>
<body>
<h1>Statement Example</h1>

<c:set var="dataSource" value="jdbc/DataSourceExample"/>

<c:catch var="exception">
    <sql:query var="existingStockResults" dataSource="${dataSource}">
        select * from stocks where symbol=?
        <sql:param value="${param.symbol}"/>
    </sql:query>

    <c:if test="${existingStockResults.rowCount == 0}">
        <c:set var="existingStock" value="${null}"/>
        <sql:update dataSource="${dataSource}" var="count">
            insert into stocks (symbol, name) values (?, ?)
            <sql:param value="${param.symbol}"/>
            <sql:param value="${param.name}"/>
        </sql:update>
    </c:if>
    <c:if test="${existingStockResults.rowCount > 0}">
        <c:set var="existingStock" value="${existingStockResults.rows[0]}"/>
        <sql:update dataSource="${dataSource}" var="count">
            update stocks set name=? where symbol=?
            <sql:param value="${param.name}"/>
            <sql:param value="${existingStock.symbol}"/>
        </sql:update>
    </c:if>

    <c:if test="${count < 1}">
        Data was not updated or inserted into database. Reason for failure is unknown
    </c:if>
    <c:if test="${count == 1}">
        <c:if test="${existingStock == null}">
            Data successfully inserted into database
        </c:if>
        <c:if test="${existingStock != null}">
            Data successfully updated in the database
            <p>
                <b>Symbol</b>: ${param.symbol}<br>
                <b>Old Name</b>: ${existingStock.name}<br>
                <b>New Name</b>: ${param.name}
            </p>
        </c:if>

        <sql:query var="stocks" dataSource="${dataSource}">
            select * from stocks
        </sql:query>

        <h2>All rows in STOCKS table:</h2>
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
</c:catch>
<c:if test="${exception != null}">
    ${exception}
</c:if>
<p><a href="StockEntryForm.html">Insert new stock</a></p>
</body>
</html>