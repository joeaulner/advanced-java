<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<f:view>
    <head>
        <title>Login - Final Project</title>
        <%@ include file="WEB-INF/Stylesheets.jsp"%>
    </head>
    <body>
    <h:form styleClass="col-8 sm-col-6 md-col-4 p3">
        <h1>Login</h1>
        <div class="form-group">
            <h:outputLabel value="Email" for="email"/>
            <h:inputText id="email"
                         value="#{user.email}"
                         required="true"
                         requiredMessage="Email address required"
                         styleClass="form-control"/>
            <h:message for="email" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Password" for="password"/>
            <h:inputSecret id="password"
                           value="#{user.password}"
                           required="true"
                           requiredMessage="Password required"
                           styleClass="form-control"/>
            <h:message for="password" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:messages globalOnly="true" layout="table" styleClass="text-danger"/>
        </div>
        <div class="flex justify-between">
            <h:commandButton value="Login" action="#{user.login}" styleClass="btn btn-default"/>
            <span>
                New user? Register <h:outputLink value="Register.faces">here</h:outputLink>.
            </span>
        </div>
    </h:form>
    </body>
</f:view>
</html>
