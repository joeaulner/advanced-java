<%@ page import="java.io.PrintWriter" %>
<%
    out.println("<pre>");
    Throwable t = (Throwable) request.getAttribute("ex");
    if (t != null) {
        t.printStackTrace(new PrintWriter(out));
    }
    out.println("</pre>");
%>