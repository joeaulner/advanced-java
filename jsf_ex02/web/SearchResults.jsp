<html>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
    <head><title>Freedom Airlines Online Flight Reservation System</title>
    </head>
    <body>
    <h3>You entered these search parameters</h3>
    <br>Trip Type  : <h:outputText value="#{flight.tripType}"/>
    <br>Origination: <h:outputText value="#{flight.origination}"/>
    <br>Depart date: <h:outputText value="#{flight.departDate}"/>
    <br>Depart time: <h:outputText value="#{flight.departTime}"/>
    <br>Destination: <h:outputText value="#{flight.destination}"/>
    <br>Return date: <h:outputText value="#{flight.returnDate}"/>
    <br>Return time: <h:outputText value="#{flight.returnTime}"/>
    <p></p>
    Matching Flights
    <p></p>
    <h:outputText value="#{flight.matchingFlights[0]}"/>
    <p></p>
    <h:outputText value="#{flight.matchingFlights['1']}"/>
    </body>
</f:view>
</html>
