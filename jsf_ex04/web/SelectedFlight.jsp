<html>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
    <head>
        <title>Freedom Airlines Online Flight Reservation System</title>
    </head>
    <body>
    <h3>Flight Reservation</h3>
    <h:form>
        <p></p>
        You selected this flight:
        <p></p>
        <h:outputText value="#{flight.matchingFlight}"/>
        <p></p>
        <h:commandButton value="New Search" action="#{flight.reset}"/>
    </h:form>
    </body>
</f:view>
</html>
