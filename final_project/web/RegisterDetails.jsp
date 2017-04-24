<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<f:view>
    <head>
        <title>Register Details - Final Project</title>
        <%@ include file="WEB-INF/Stylesheets.jsp"%>
    </head>
    <body>
    <h:form styleClass="col-8 sm-col-6 md-col-4 p3">
        <h1>Register Details</h1>
        <div>Tell us a little bit about yourself:</div>
        <div class="form-group">
            <h:outputLabel value="First Name" for="first_name"/>
            <h:inputText id="first_name"
                         value="#{user.firstName}"
                         required="true"
                         requiredMessage="First name required"
                         styleClass="form-control"/>
            <h:message for="first_name" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Last Name" for="last_name"/>
            <h:inputText id="last_name"
                         value="#{user.lastName}"
                         required="true"
                         requiredMessage="Last name required"
                         styleClass="form-control"/>
            <h:message for="last_name" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:outputLabel value="Gender" for="gender"/>
            <h:selectOneMenu id="gender" value="#{user.gender}" styleClass="form-control">
                <f:selectItem itemValue="#{null}" itemLabel="(decline)"/>
                <f:selectItem itemValue="Male" itemLabel="Male"/>
                <f:selectItem itemValue="Female" itemLabel="Female"/>
            </h:selectOneMenu>
        </div>
        <div class="form-group">
            <h:outputLabel value="Age" for="age"/>
            <h:inputText id="age" value="#{user.age}" converterMessage="Must be an integer" styleClass="form-control"/>
            <h:message for="age" styleClass="text-danger"/>
        </div>
        <div class="form-group">
            <h:messages globalOnly="true" layout="table" styleClass="text-danger"/>
        </div>
        <h:commandButton value="Register" action="#{user.registerDetails}" styleClass="btn btn-default"/>
    </h:form>
    </body>
</f:view>
</html>
