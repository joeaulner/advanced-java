<html>
<head>
    <title>Stock Ratings</title>
</head>
<body>
<h1>Stock Ratings</h1>
<%@ page import="java.util.*" %>
<%
    ArrayList stocks = (ArrayList) request.getAttribute("data");
    if (stocks != null && stocks.size() > 0) {
%>
<form action="AddRating" method="post">
    <table border="1">
        <tr>
            <th>Ticker</th>
            <th>Analyst</th>
            <th>Rating</th>
        </tr>
        <%
            for (Object stockVector : stocks) {
                Vector stock = (Vector) stockVector;
                String ticker = (String) stock.elementAt(0);
                String analyst = (String) stock.elementAt(1);
                String rating = (String) stock.elementAt(2);
        %>
        <tr>
            <td><%= ticker %>
            </td>
            <td><%= analyst %>
            </td>
            <td><%= rating %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <table>
        <tr>
            <td>
                <select name="analysts">
                    <%
                        ArrayList analysts = (ArrayList) request.getAttribute("analysts");
                        for (Object a : analysts) {
                            String analyst = (String) a;
                    %>
                    <option value="<%= analyst %>">
                        <%= analyst %>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>
            <td>
                <select name="stocks">
                    <%
                        ArrayList unratedStocks = (ArrayList) request.getAttribute("unrated");
                        for (Object t : unratedStocks) {
                            String ticker = (String) t;
                    %>
                    <option value="<%= ticker %>"><%= ticker %>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>
            <td>
                <select name="ratings">
                    <option value="Run away! Run away!">Run away! Run away!</option>
                    <option value="Could be worse!">Could be worse!</option>
                    <option value="A bit of OK!">A bit of OK!</option>
                    <option value="Take a chance!">Take a chance!</option>
                    <option value="Smashing!">Smashing!</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit Rating"></td>
        </tr>
    </table>
</form>
<%
    } else {
%>
No stock information found
<%
    }
%>
</body>
</html>