package com.rupp.assignment.config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet Filter implementation class MyFilter
 */
@WebFilter("/MyFilter")
public class MyFilter implements Filter {

    /**
     * Default constructor. 
     */
    public MyFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Get the IP address of client machine.   
	
		HttpServletRequest req = (HttpServletRequest)request;
	    HttpServletResponse resp = (HttpServletResponse)response;
	    String requestPath = req.getRequestURI();
		HttpSession session = req.getSession(true);
       // chain.doFilter(request, response);// sends request to next resource

		if (session.getAttribute("userId") != null) {
	        chain.doFilter(request, response);// sends request to next resource
		 }else{
			 resp.sendRedirect("/login.jsp");
		 }


	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter destroy called");
	}
	
   
}
