<html>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
    <head>
        <title>Freedom Airlines Online Flight Reservation System</title>
    </head>
    <body>
    <h3>You entered these search parameters</h3>
    <p>Origination: <h:outputText value="#{flight.origination}"/></p>
    <p>Depart date: <h:outputText value="#{flight.departDate}"/></p>
    <p>Depart time: <h:outputText value="#{flight.departTime}"/></p>
    <p>Destination: <h:outputText value="#{flight.destination}"/></p>
    <p>Return date: <h:outputText value="#{flight.returnDate}"/></p>
    <p>Return time: <h:outputText value="#{flight.returnTime}"/></p>
    </body>
</f:view>
</html>
