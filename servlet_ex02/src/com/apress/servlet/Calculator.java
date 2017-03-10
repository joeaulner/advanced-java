package com.apress.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Calculator extends HttpServlet {

    private int result;
    private int sleepTime;

    @Override
    public void init() throws ServletException {
        String sleep_time = getInitParameter("sleep.time");
        sleepTime = getNumber(sleep_time);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value1 = request.getParameter("value1");
        int v1 = getNumber(value1);
        String value2 = request.getParameter("value2");
        int v2 = getNumber(value2);
        String op = request.getParameter("submit");

        if ("Plus".equals(op)) {
            result = v1 + v2;
        } else {
            result = v1 - v2;
        }

        try {
            Thread.sleep(sleepTime);
        } catch (InterruptedException ex) {
            log("Exception during sleep", ex);
        }

        try {
            response.setContentType("text/html");
            PrintWriter writer = response.getWriter();
            writer.println("<html><body>");
            writer.println(v1 + " " + op + " " + v2 + " is " + result);
            writer.println("</body></html>");
            writer.close();
        } catch (IOException ex) {
            log("Error writing output", ex);
        }
    }

    private int getNumber(String s) {
        int result = 0;
        try {
            result = Integer.parseInt(s);
        } catch (NumberFormatException ex) {
            log("Error parsing '" + s + "'", ex);
        }
        return result;
    }
}
