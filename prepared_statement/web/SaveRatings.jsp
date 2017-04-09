<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
<head>
    <title>Easy Street - Save Ratings</title>
</head>
<body>
<h1>Save Ratings</h1>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    try {
        conn = JdbcManager.getConnection();
        String sql = "insert into stock (tickerSymbol, analyst, rating) " +
                "values (?,?,?)";
        ps = conn.prepareStatement(sql);
        String analystName = request.getParameter("AnalystName");
        ps.setString(2, analystName);
        String[] stockNames = request.getParameterValues("stockNames");
        for (String stockName : stockNames) {
            ps.setString(1, stockName);
            String rating = request.getParameter(stockName);
            if (rating.equals("No Rating")) {
                ps.setNull(3, Types.VARCHAR);
            } else {
                ps.setString(3, request.getParameter(stockName));
            }
            ps.addBatch();
        }
        int results[] = ps.executeBatch();
        for (int i = 0; i < results.length; ++i) {
            if (results[i] == 1) {
%>
<p>
    Rating of &quot;<%=request.getParameter(stockNames[i])%>&quot;
    for <%=stockNames[i]%> was inserted successfully.
</p>
<%
} else {
%>
<p>Rating for <%=stockNames[i]%> was not inserted successfully.</p>
<%
            }
        }
    } catch (Exception ex) {
%>
<%=ex.getMessage()%>
<%
        ex.printStackTrace();
    } finally {
        JdbcManager.close(ps);
        JdbcManager.close(conn);
    }
%>
</body>
</html>