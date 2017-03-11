package com.apress.servlet;

import javax.servlet.*;
import java.util.logging.Logger;

public class FilterA implements Filter {

    private ServletContext context;

    public void init(FilterConfig filterConfig) throws ServletException {
        context = filterConfig.getServletContext();
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {
        Logger logger = Logger.getLogger("com.apress.beginjavaee");
        logger.info("Entered FilterA.doFilter()");
        logger.info("FilterA passing request to next filter");

        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        logger.info("Returned to FilterA.doFilter()");
        logger.info("FilterA is now processing the response");
    }

    public void destroy() {

    }
}
