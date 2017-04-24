<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<html>
<f:view>
    <c:if test="${!user.authenticated}">
        <c:redirect url="Login.faces" />
    </c:if>
    <head>
        <title>Home - Final Project</title>
        <%@ include file="WEB-INF/Stylesheets.jsp"%>
    </head>
    <body>
    <div class="col-8 sm-col-6 md-col-4 p3">
        <h1>Welcome ${user.firstName}!</h1>
        <p>Here's what you've told us about yourself:</p>
        <p>
            <b>Full Name:</b> ${user.firstName} ${user.lastName}
        </p>
        <p>
            <b>Gender:</b> ${user.gender}
        </p>
        <p>
            <b>Age: </b> ${user.age}
        </p>
        <h:form styleClass="flex justify-between">
            <span>
                <h:outputLink value="ChangePassword.faces">Change Password</h:outputLink>
            </span>
            <span>
                All finished? <h:commandLink action="#{user.logout}">Logout</h:commandLink>
            </span>
        </h:form>
    </div>
    </body>
</f:view>
</html>
