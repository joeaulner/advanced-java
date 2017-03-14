<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
<head><title>Statement Example</title></head>
<body>
<h1>Statement Example</h1>

<%
    Connection conn = null;
    Statement stmt = null;
    try {
        conn = JdbcManager.getConnection();
        stmt = conn.createStatement();
        String sqlcmd = "insert into stock values ('%s', '%s')";
        sqlcmd = String.format(sqlcmd, request.getParameter("symbol"), request.getParameter("name"));
        int result = stmt.executeUpdate(sqlcmd);
        if (result == 1) {
%>
Data successfully inserted into database
<%
        } else {
%>
Data was not inserted into database. Reason for failure is unknown
<%
        }
    } catch (Exception ex) {
%>
<%=ex.getMessage()%>
<%
        ex.printStackTrace();
    } finally {
        JdbcManager.close(stmt);
        JdbcManager.close(conn);
    }
%>
</body>
</html>