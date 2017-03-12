package com.apress.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
        session.setAttribute("password", password);

        try {
            response.setContentType("text/html");
            PrintWriter writer = response.getWriter();
            writer.println("<html><body>");
            writer.println("Thank you, " + username + ". You are now logged into the system");
            // Disabled call to encodeURL to prevent adding sessionId parameter
            String newURL = "GetSession"; //response.encodeURL("GetSession");
            writer.println("<p>Click <a href=\"" + newURL + "\">here</a> for another servlet</p>");
            writer.println("</body></html>");
            writer.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
