<%-- Uses pessimistic locking, updating result set when target rows are updated --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<html>
<head>
    <title>Reserve Room</title>
</head>
<body>
<h1>Reserve Room</h1>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rset = null;
    try {
        conn = JdbcManager.getConnection();
        conn.setAutoCommit(false);

        // select the row for update
        String sqlsel = "select roomid, res_date, res_flag, res_name from reserve where res_flag=false for update";
        stmt = conn.prepareStatement(sqlsel);

        rset = stmt.executeQuery();
        if (rset.next()) {
            String roomId = rset.getString("roomid");
            Date date = rset.getDate("res_date");
            String name = request.getParameter("UserName");

            String sqlupd = "update reserve set res_flag=true, res_name=? where roomid=? and res_date=?";
            stmt = conn.prepareStatement(sqlupd);
            stmt.setString(1, name);
            stmt.setString(2, roomId);
            stmt.setDate(3, date);

            try {
                Thread.sleep(5000);
            } catch (Exception _) {
            }
            int result = stmt.executeUpdate();
            conn.commit();
            out.write("<p>Room Reserved</p>");
        } else {
            out.write("<p>No available rooms</p>");
        }
    } catch (Exception ex) {
%>
<%=ex.getMessage()%>
<%
        ex.printStackTrace();
        conn.rollback();
    } finally {
        JdbcManager.close(rset);
        JdbcManager.close(stmt);
        JdbcManager.close(conn);
    }
%>
</body>
</html>
