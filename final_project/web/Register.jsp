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
            <h:inputText id="email"
                         value="#{user.email}"
                         required="true"
                         requiredMessage="Email address required"
                         styleClass="form-control"/>
            <h:message for="email" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Password" for="new_password"/>
            <h:inputSecret id="new_password"
                           value="#{user.newPassword}"
                           required="true"
                           requiredMessage="Password required"
                           validatorMessage="Password must be at least 8 characters"
                           styleClass="form-control">
                <f:validateLength minimum="8"/>
            </h:inputSecret>
            <h:messages for="new_password" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Confirm Password" for="confirm_password"/>
            <h:inputSecret id="confirm_password"
                           value="#{user.confirmPassword}"
                           required="true"
                           requiredMessage="Must confirm password"
                           styleClass="form-control"/>
            <h:message for="confirm_password" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:messages globalOnly="true" layout="table" styleClass="text-danger"/>
        </div>
        <div class="flex justify-between">
            <h:commandButton value="Next" action="#{user.register}" styleClass="btn btn-default"/>
            <span>
                Already have an account? Login <h:outputLink value="Login.faces">here</h:outputLink>.
            </span>
        </div>
    </h:form>
    </body>
</f:view>
</html>
