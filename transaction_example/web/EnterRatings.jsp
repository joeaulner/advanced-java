<html>
<head>
    <title>Easy Street - Enter Ratings</title>
</head>
<body>
<h1>Stock Ratings</h1>
<form action="SaveRatings.jsp">
    Enter your name: <input type="text" name="AnalystName" value="">
    <p>Here are the stocks to rate for this week:</p>
    <%
        String[] stocks = new String[] {
                "DDC", "SRU", "SRI", "UDE", "ZAP"
        };
    %>
    <table border="1">
        <%
            for (String stock : stocks) {
        %>
        <tr>
            <td><input type="hidden" name="stockNames" value="<%=stock%>"><%=stock%></td>
            <td><input type="radio" name="<%=stock%>" value="Smashing">Smashing</td>
            <td><input type="radio" name="<%=stock%>" value="Take a chance">Take a chance</td>
            <td><input type="radio" name="<%=stock%>" value="It's OK">It's OK</td>
            <td><input type="radio" name="<%=stock%>" value="Run away">Run away</td>
            <td><input type="radio" name="<%=stock%>" value="Could be worse">Could be worse</td>
            <td><input type="radio" name="<%=stock%>" value="No Rating">No Rating</td>
            <td><input type="text" name="<%=stock%>_target"></td>
        </tr>
        <%
            }
        %>
    </table>
    <input type="submit" name="submit" value="Submit Ratings">
</form>
</body>
</html>