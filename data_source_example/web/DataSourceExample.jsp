<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<html>
<head><title>DataSource Example</title></head>
<body>
<h1>DataSource Example</h1>
<%
    InitialContext context = new InitialContext();
    DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/DataSourceExample");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rset = null;

    try {
        conn = dataSource.getConnection();
        stmt = conn.createStatement();
        rset = stmt.executeQuery("select * from CUSTOMER");
        if (rset.next()) {
%>
<table width="100%" border="1">
    <tr align="left">
        <th>Customer Num</th>
        <th>Name</th>
        <th>Email</th>
    </tr>
    <%
        do {
    %>
    <tr>
        <td><%=rset.getString("CUSTOMER_ID")%>
        </td>
        <td><%=rset.getString("NAME")%>
        </td>
        <td><%=rset.getString("EMAIL")%>
        </td>
    </tr>
    <%
        } while (rset.next());
    %>
</table>
<%
    } else {
%>
No results from query
<%
        }
    } catch (SQLException ex) {
%>
    <%=ex.getMessage()%>
<%
        ex.printStackTrace();
    } finally {
        if (rset != null) { rset.close(); }
        if (stmt != null) { stmt.close(); }
        if (conn != null) { conn.close(); }
        context.close();
    }
%>
</body>
</html>