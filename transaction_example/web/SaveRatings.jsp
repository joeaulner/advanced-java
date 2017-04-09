<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
<head>
    <title>Easy Street - Save Ratings</title>
</head>
<body>
<h1>Save Ratings</h1>
<%
    Connection conn = null;
    PreparedStatement stmt1 = null;
    Statement stmt2 = null;
    try {
        conn = JdbcManager.getConnection();
        conn.setAutoCommit(false);
        String sql1 = "insert into stock (tickerSymbol, analyst, rating) values (?,?,?)";
        stmt1 = conn.prepareStatement(sql1);

        String analystName = request.getParameter("AnalystName");
        stmt1.setString(2, analystName);

        String stockNames[] = request.getParameterValues("stockNames");
        for (String stockName : stockNames) {
            stmt1.setString(1, stockName);
            String rating = request.getParameter(stockName);
            if (rating.equals("No Rating")) {
                stmt1.setNull(3, Types.VARCHAR);
            } else {
                stmt1.setString(3, request.getParameter(stockName));
            }
            stmt1.addBatch();
        }
        int results[] = stmt1.executeBatch();

        boolean batchSucceeded = true;
        for (int i = 0; i < results.length; ++i) {
            if (results[i] == 1) {
%>
<p>
    Rating of &quot;<%=request.getParameter(stockNames[i])%>&quot; for <%=stockNames[i]%> was inserted successfully.
</p>
<%
            } else {
                batchSucceeded = false;
%>
<p>
    Rating for &quot;<%=stockNames[i]%> was not inserted successfully.
</p>
<%
            }
        }

        for (String stockName : stockNames) {
            String sql2 = String.format(
                    "insert into target (tickerSymbol, priceTarget) values ('%s', %s)",
                    stockName, request.getParameter(stockName + "_target")
            );
            stmt2 = conn.createStatement();
            stmt2.executeUpdate(sql2);
        }

        if (batchSucceeded) {
            out.write("<p>Batch succeeded, and all targets inserted, committing data.</p>");
            conn.commit();
        } else {
            out.write("<p>Batch failed, rolling back data.</p>");
            conn.rollback();
        }
    } catch (Exception ex) {
%>
<%=ex.getMessage()%>
<%
        ex.printStackTrace();
        out.write("<p>Exception thrown, rolling back data.</p>");
        conn.rollback();
    } finally {
        JdbcManager.close(stmt1);
        JdbcManager.close(stmt2);
        JdbcManager.close(conn);
    }
%>
</body>
</html>