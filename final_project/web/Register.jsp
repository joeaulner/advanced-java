<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<f:view>
    <head>
        <title>Register - Final Project</title>
        <%@ include file="WEB-INF/Stylesheets.jsp"%>
    </head>
    <body>
    <h:form styleClass="col-8 sm-col-6 md-col-4 p3">
        <h1>Register</h1>
        <div class="form-group">
            <h:outputLabel value="Email" for="email"/>
            <h:inputText id="email" styleClass="form-control"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Password" for="password"/>
            <h:inputSecret id="password" styleClass="form-control"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Confirm Password" for="confirmPassword"/>
            <h:inputSecret id="confirmPassword" styleClass="form-control"/>
        </div>
        <div class="flex justify-between">
            <h:commandButton value="Register" action="#{user.register}" styleClass="btn btn-default"/>
            <span>
                Existing user? Login <h:outputLink value="Login.faces">here</h:outputLink>.
            </span>
        </div>
    </h:form>
    </body>
</f:view>
</html>
