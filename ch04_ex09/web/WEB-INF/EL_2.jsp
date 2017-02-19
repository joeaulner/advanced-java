<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>JSTL Q2</title>
</head>
<body>
<h1>JSTL Question 2</h1>
<h2>How do I use the JSTL?</h2>

<jsp:useBean id="questions" class="com.apress.faq.Questions" scope="page">
    <jsp:setProperty name="questions" property="topic" value="EL"/>
</jsp:useBean>

<table border="1">
    <tr>
        <th>tag</th>
        <th>result</th>
    </tr>
    <%--this tag uses c:out to send the value of an EL to the response--%>
    <tr>
        <td>&lt;c:out value="${'${'}questions.topic}"/&gt;</td>
        <td><c:out value="${questions.topic}"/></td>
    </tr>
    <%--this tag uses c:set to set the property of a JavaBean--%>
    <c:set target="${questions}" property="topic" value="JSTL"/>
    <tr>
        <td>
            &lt;c:set target="${'${'}questions}"
                property="topic"
                value="JSTL"/&gt;
        </td>
        <td><c:out value="${questions.topic}"/></td>
    </tr>
    <%--this tag uses c:if to determine whether to create another row--%>
    <c:if test="${questions.topic == 'EL'}">
        <tr>
            <td>This row will not be created</td>
            <td></td>
        </tr>
    </c:if>
    <c:if test="${questions.topic == 'JSTL'}">
        <tr>
            <td>This row was created because the c:if tag result was true</td>
            <td></td>
        </tr>
    </c:if>
</table>

<h2>Multiplication table, 1 - 5</h2>

<%--use the forEach tag to create a table--%>
<table border="1">
    <tr>
        <td></td>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
    </tr>
    <c:forEach var="i" begin="1" end="5">
        <tr>
            <td><c:out value="${i}"/></td>
            <c:forEach var="j" begin="1" end="5">
                <td><c:out value="${i*j}"/></td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>

<h2>Formatting numbers</h2>
<br>
&lt;fmt:formatNumber value="23.456" type="number" /&gt; results in
<fmt:formatNumber value="23.456" type="number"/>
<br>
&lt;fmt:formatNumber value="23.456" type="currency" /&gt; results in
<fmt:formatNumber value="23.456" type="currency"/>
<br>
&lt;fmt:formatNumber value="23.456" type="percent" /&gt; results in
<fmt:formatNumber value="23.456" type="percent"/>
<br>
&lt;fmt:formatNumber value="23.456" type="percent" minFractionDigits="2" /&gt; results in
<fmt:formatNumber value="23.456" type="percent" minFractionDigits="2"/>
</body>
</html>
