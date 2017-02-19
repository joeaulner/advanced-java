<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Assignment 2</title>
</head>
<body>
<jsp:useBean id="hobbies" scope="page" class="com.apress.survey.Hobbies"/>

<h1>Arbitrary Survey</h1>

<form action="EchoFields.jsp">
    <div>
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName" value="${data.firstName}" minlength="3" maxlength="30">
    </div>
    <div>
        <label for="surname">Last Name</label>
        <input type="text" id="surname" name="surname" value="${data.surname}" minlength="3" maxlength="30">
    </div>
    <div>
        <h4>Gender</h4>
        <input type="radio" name="gender" required
               <c:if test="${data.gender == 'male'}">checked</c:if>
               value="male"> Male <br>
        <input type="radio" name="gender" required
               <c:if test="${data.gender == 'female'}">checked</c:if>
               value="female"> Female
    </div>
    <div>
        <h4>Birth Date</h4>
        <div>
            Month: <input type="number" name="month" min="1" max="12" value="${data.month}" required>
        </div>
        <div>
            Day: <input type="number" name="day" min="1" max="31" value="${data.day}" required>
        </div>
        <div>
            Year: <input type="number" name="year" min="1900" max="2017" value="${data.year}" required>
        </div>
    </div>
    <div>
        <h4>Hobbies:</h4>
        <c:forEach var="hobby" items="${hobbies.allHobbies}">
            <div>
                <label>${hobby}</label>
                <input type="checkbox" name="hobbies"
                       <c:if test="${data.hasHobby(hobby)}">checked</c:if>
                       value="${hobby}">
            </div>
        </c:forEach>
    </div>
    <p>
        <button type="submit">Submit</button>
    </p>
</form>
</body>
</html>
