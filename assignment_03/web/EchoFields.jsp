<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Echo Input Fields</title>
</head>
<body>
<jsp:useBean id="data" scope="session" class="com.apress.survey.SurveyData"/>
<jsp:setProperty name="data" property="*"/>

<h1>Survey Data</h1>
Name: ${data.surname}, ${data.firstName} <br>
Gender: ${data.gender} <br>
Birth Date: <fmt:formatDate value="${data.birthDate}" pattern="MM/dd/yyyy"/>

<h4>Hobbies</h4>
<ul>
    <c:forEach var="hobby" items="${data.hobbies}">
        <li>${hobby}</li>
    </c:forEach>
</ul>

<a href="Welcome.jsp">Return to form.</a>
</body>
</html>
