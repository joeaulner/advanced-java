package com.apress.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Logger logger = Logger.getLogger("com.apress.beginjavaee");
        logger.info("Entered Login servlet doPost()");
        String username = request.getParameter("username");

        try {
            response.setContentType("text/html");
            PrintWriter writer = response.getWriter();
            writer.println("<html><body>");
            writer.println("Thank you, " + username + ". You are now logged into the system.");
            writer.println("</body></html>");
            writer.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        logger.info("Login do Post finished processing");
    }
}
