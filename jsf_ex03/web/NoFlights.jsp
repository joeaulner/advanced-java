<html>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
    <head>
        <title>Freedom Airlines Online Flight Reservation System</title>
    </head>
    <body>
    <h3>Search Results</h3>
    <h:form>
        <p></p>
        No Flights that match your search paramters were found.
        <p></p>
        <h:commandButton value="New Search" action="#{flight.reset}"/>
    </h:form>
    </body>
</f:view>
</html>
