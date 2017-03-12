package com.apress.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

public class StockListServlet extends HttpServlet {

    static ArrayList analysts = new ArrayList();
    static ArrayList unratedStocks = new ArrayList();
    static ArrayList ratings = new ArrayList();

    @Override
    public void init() throws ServletException {
        analysts.add("Fred");
        analysts.add("Leonard");
        analysts.add("Sarah");
        analysts.add("Nancy");
        unratedStocks.add("ABC");
        unratedStocks.add("DDBC");
        unratedStocks.add("DDC");
        unratedStocks.add("FBC");
        unratedStocks.add("INT");
        unratedStocks.add("JIM");
        unratedStocks.add("SRI");
        unratedStocks.add("SRU");
        unratedStocks.add("UDE");
        unratedStocks.add("ZAP");
        Vector v = new Vector();
        v.add("Fred");
        v.add("ZZZ");
        v.add("Smashing!");
        ratings.add(v);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            ArrayList data;
            RequestDispatcher dispatcher;
            ServletContext context = getServletContext();
            String name = req.getPathInfo();
            name = name.substring(1);

            if ("AnalystForm".equals(name)) {
                data = analysts;
                req.setAttribute("data", data);
            } else if ("RatingsForm".equals(name) || "AddRating".equals(name)) {
                req.setAttribute("data", ratings);
                req.setAttribute("analysts", analysts);
                req.setAttribute("unrated", unratedStocks);
            } else if ("ProcessAnalyst".equals(name)) {
                // no need to set any attributes for this resource
            } else {
                name = "Error";
            }

            dispatcher = context.getNamedDispatcher(name);
            if (dispatcher == null) {
                dispatcher = context.getNamedDispatcher("Error");
            }
            dispatcher.forward(req, resp);
        } catch (Exception ex) {
            log("Exception in StockListServlet.doGet()");
        }
    }
}
