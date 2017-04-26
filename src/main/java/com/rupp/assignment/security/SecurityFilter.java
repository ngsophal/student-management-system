package com.rupp.assignment.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Created by uyutthy on 4/20/2017.
 */
public class SecurityFilter implements Filter {
    private static final Set<String> ALLOWED_PATHS = Collections.unmodifiableSet(new HashSet<>(
            Arrays.asList("/api/user/login", "/api/user/logout")));

    private static final Logger LOG = LoggerFactory.getLogger(SecurityFilter.class);
    /**api_key by request parameter*/
    private static final String API_KEY_PARAM = "api_key";
    /**X-API-Key as request Header*/
    private static final String HEADER_NAME_API_KEY = "X-API-Key";

    /**whilelistIps*/
    private static final List<String>  WHITELISTED_IPS = new ArrayList<>();

    /**value*/
    private static final String API_KEY_VALUE = "sd3209Sdkl2DF3dfzsDGEsZ8476";
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        LOG.info("init Security filter");

        /**initialize ip address either here or you get from web.xml*/
        WHITELISTED_IPS.add("127.0.0.1");
        //WHITELISTED_IPS.add("192.168.0.1");
        //WHITELISTED_IPS.add("10.1.2.29");
    }
    /* (non-Javadoc)
     * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
     */
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        final String requestUri = request.getRequestURI();

        LOG.debug(">> Request method {} - URI : {}",request.getMethod(), requestUri);

        LOG.debug(String.format(">> Client's IP address: %s, api_key: %s, X-API-Key: %s", request.getRemoteAddr(), request.getParameter(API_KEY_PARAM),
                request.getHeader(HEADER_NAME_API_KEY)));

        String path = request.getRequestURI().substring(request.getContextPath().length()).replaceAll("[/]+$", "");

        LOG.debug(path);

        boolean allowedPath = ALLOWED_PATHS.contains(path);

        if (allowedPath) {
            chain.doFilter(req, resp);
        }
        else {
            if (! (verifyApiKey(request) || verifyIpAddress(request.getRemoteAddr()))) {
                LOG.error("Either the client's IP address is not allowed, API key is invalid");
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Either the client's IP address is not allowed, API key is invalid");
                return;
            }
        }
        chain.doFilter(req, resp);
    }
    /**
     * verify api key either request param or request Header
     * @param request
     * @return
     */
    private boolean verifyApiKey(HttpServletRequest request) {
        return API_KEY_VALUE.equals(request.getHeader(HEADER_NAME_API_KEY))
                || API_KEY_VALUE.equals(request.getParameter(API_KEY_PARAM));
    }


    /**
     * verify api key either request param or request Header
     * @param request
     * @return
     */
    private boolean verifyIpAddress(String ipAddress) {
        return WHITELISTED_IPS.contains(ipAddress);
    }


    @Override
    public void destroy() {

    }

}
