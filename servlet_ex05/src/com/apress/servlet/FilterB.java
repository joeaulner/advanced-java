package com.apress.servlet;

import javax.servlet.*;
import java.util.logging.Logger;

public class FilterB implements Filter {

    private ServletContext context;

    public void init(FilterConfig filterConfig) throws ServletException {
        context = filterConfig.getServletContext();
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {
        Logger logger = Logger.getLogger("com.apress.beginjavaee");
        logger.info("Entered FilterB.doFilter()");
        logger.info("protocol is " + servletRequest.getProtocol());
        logger.info("remote host is " + servletRequest.getRemoteHost());
        logger.info("content type is " + servletRequest.getContentType());
        logger.info("content length is " + servletRequest.getContentLength());
        logger.info("username is " + servletRequest.getParameter("username"));

        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        logger.info("Returned to FilterB.doFilter()");
        logger.info("FilterB is now processing the response");
    }

    public void destroy() {

    }
}
