<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
<head><title>Result Set Example</title></head>
<body>
<h1>ResultSet Example</h1>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rset = null;
    try {
        conn = com.apress.jdbc.JdbcManager.getConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sqlcmd = "select * from customer";
        rset = stmt.executeQuery(sqlcmd);
        if (rset.next()) {
%>
<p>on first row, expected value of isFirst() to be true</p>
<p>isFirst() == <%=rset.isFirst()%></p>
<p>Now calling next() twice, expected value of getRow() is 3</p>
<%
    rset.next();
    rset.next();
%>
<p>getRow() == <%=rset.getRow()%></p>
<p>Moving to row 4, customer num, name, and email are</p>
<% rset.next(); %>
<p>Row <%=rset.getRow()%></p>
<%=rset.getString("customer_id")%>
<%=rset.getString("name")%>
<%=rset.getString("email")%>
<p>Now calling last() to move to last row, expected value of isLast() to be true</p>
<% rset.last(); %>
<p>isLast() == <%=rset.isLast()%>, row number is <%=rset.getRow()%></p>
<p>Now calling beforeFirst()</p>
<% rset.beforeFirst(); %>
<p>isBeforeFirst() == <%=rset.isBeforeFirst()%>, isFirst() == <%=rset.isFirst()%></p>
<%
        } else {
%>
No rows found by query
<%
        }
    } catch (Exception ex) {
%>
<%=ex.getMessage()%>
<%
        ex.printStackTrace();
    } finally {
        com.apress.jdbc.JdbcManager.close(rset);
        com.apress.jdbc.JdbcManager.close(stmt);
        com.apress.jdbc.JdbcManager.close(conn);
    }
%>
</body>
</html>