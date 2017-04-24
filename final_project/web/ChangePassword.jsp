<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<f:view>
    <head>
        <title>Change Password - Final Project</title>
        <%@ include file="WEB-INF/Stylesheets.jsp"%>
    </head>
    <body>
    <h:form styleClass="col-8 sm-col-6 md-col-4 p3">
        <h1>Change Password</h1>
        <div class="form-group">
            <h:outputLabel value="Old Password" for="old_password"/>
            <h:inputSecret id="old_password"
                           value="#{user.oldPassword}"
                           required="true"
                           requiredMessage="Old password required"
                           validatorMessage="Must be at least 8 characters"
                           styleClass="form-control">
                <f:validateLength minimum="8"/>
            </h:inputSecret>
            <h:message for="old_password" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="New Password" for="new_password"/>
            <h:inputSecret id="new_password"
                           value="#{user.newPassword}"
                           required="true"
                           requiredMessage="New password required"
                           validatorMessage="Must be at least 8 characters"
                           styleClass="form-control">
                <f:validateLength minimum="8"/>
            </h:inputSecret>
            <h:message for="new_password" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Confirm Password" for="confirm_password"/>
            <h:inputSecret id="confirm_password"
                           value="#{user.confirmPassword}"
                           required="true"
                           requiredMessage="Must confirm new password"
                           validatorMessage="Must be at least 8 characters"
                           styleClass="form-control">
                <f:validateLength minimum="8"/>
            </h:inputSecret>
            <h:message for="confirm_password" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:messages globalOnly="true" layout="table" styleClass="text-danger"/>
        </div>
        <div class="flex justify-between">
            <h:commandButton value="Submit" action="#{user.changePassword}" styleClass="btn btn-default"/>
            <span>
                <h:outputLink value="Home.faces">Cancel</h:outputLink>.
            </span>
        </div>
    </h:form>
    </body>
</f:view>
</html>
