package com.apress.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Vector;

public class AddRating extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String analyst = req.getParameter("analysts");
            String ticker = req.getParameter("stocks");
            String rating = req.getParameter("ratings");

            Vector v = new Vector();
            v.add(analyst);
            v.add(ticker);
            v.add(rating);

            ArrayList ratings = (ArrayList) req.getAttribute("data");
            ratings.add(v);

            ArrayList unratedStocks = (ArrayList) req.getAttribute("unrated");
            unratedStocks.remove(unratedStocks.indexOf(ticker));

            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getNamedDispatcher("RatingsForm");
            dispatcher.forward(req, resp);
        } catch (Exception ex) {
            log("Exception in AddRating.doPost()", ex);
        }
    }
}
