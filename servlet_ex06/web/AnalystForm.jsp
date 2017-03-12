<html>
<head>
    <title>Analyst Management</title>
</head>
<body>
<%@ page import="java.util.*" %>
<h1>Analyst Management</h1>
<form action="ProcessAnalyst" method="post">
    <table>
        <%
            ArrayList analysts = (ArrayList) request.getAttribute("data");
            if (analysts == null) {
        %>
            <h2>Attribute is null</h2>
        <%
            } else {
                for (Object analyst : analysts) {
        %>
            <tr>
                <td><input type="checkbox" name="checkbox" value="<%= analyst %>"></td>
                <td><%= analyst %></td>
            </tr>
        <%
                }
            }
        %>
    </table>
    <p><input type="submit" value="Delete Selected" name="delete"></p>
    <p><input type="text" size="40" name="addname"></p>
    <p><input type="submit" value="Add New Analyst" name="add"></p>
</form>
</body>
</html>