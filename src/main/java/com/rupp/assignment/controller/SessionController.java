package com.rupp.assignment.controller;

import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.rupp.assignment.json.JSession;
import com.rupp.assignment.json.JMessage.MessageType;
import com.rupp.assignment.json.JMessage;


@Controller
@RequestMapping(value = {"session", "sessions" })
public class SessionController {

    private static final Logger LOG = LoggerFactory.getLogger(SessionController.class);
    @Autowired
    private JMessage message;
    @Autowired
    private com.rupp.assignment.service.SessionService service;

    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    public Collection<JSession> getAll(HttpServletRequest request, WebRequest webRequest,
            @RequestHeader(required = false, value = "If-Modified-Since") Date since) {

        //LOG.debug(" ============== If-Modified-Since {} ", since);

        return service.getAll();
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JSession getDetails(HttpServletRequest request, @PathVariable int id) {

        return service.getDetails(id);
    }

    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    public JMessage create(HttpServletRequest request, @ModelAttribute JSession domain) {
    	if(domain.getName().isEmpty() || 
    		domain.getName() == null 
    	){
    		this.message.setMessage("Please fill all require fields!");
    		this.message.setStatus(MessageType.ERROR);
    		return this.message;
    	}
        return service.create(domain);
    }
    
    @RequestMapping(value = "v1/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JMessage update(HttpServletRequest request, @PathVariable int id, @ModelAttribute JSession domain) {
    	if(domain.getName().isEmpty() || 
        		domain.getName() == null 
        	){
        		this.message.setMessage("Please fill all require fields!");
        		this.message.setStatus(MessageType.ERROR);
        		return this.message;
        	}
        return service.update(id, domain);
    }
    
    @RequestMapping(value = "v1/remove", method = RequestMethod.POST)
    @ResponseBody
    public JMessage remove(HttpServletRequest request) {
        return service.remove(Integer.parseInt(request.getParameter("id")));
    }
    
}
