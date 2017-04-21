package edu.unomaha.project;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcManager {

    private static InitialContext context = null;

    public static Connection getConnection() throws SQLException, NamingException {
        if (context == null) {
            context = new InitialContext();
        }
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/DataSourceExample");
        return dataSource.getConnection();
    }

    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                // ignore when closing
            }
        }
    }

    public static void close(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                // ignore when closing
            }
        }
    }

    public static void close(ResultSet rset) {
        if (rset != null) {
            try {
                rset.close();
            } catch (SQLException ex) {
                // ignore when closing
            }
        }
    }
}
