<html>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
    <head>
        <title>Freedom Airlines Online Flight Reservation System</title>
    </head>
    <body>
    <h3>Select a Flight</h3>
    <h:form>
        <p></p>
        <h:outputText value="#{flight.matchingFlights[0]}"/>
        <br>
        <h:commandLink action="#{flight.select}" value="Select this flight">
            <f:param name="flightNum"
                     value="#{flight.matchingFlights[0].flightNum}"/>
        </h:commandLink>
        <p></p>
        <h:outputText value="#{flight.matchingFlights[1]}"/>
        <br>
        <h:commandLink action="#{flight.select}" value="Select this flight">
            <f:param name="flightNum"
                     value="#{flight.matchingFlights[1].flightNum}"/>
        </h:commandLink>
        <p></p>
        <h:commandButton value="New Search" action="#{flight.reset}"/>
    </h:form>
    </body>
</f:view>
</html>
