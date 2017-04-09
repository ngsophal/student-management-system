package com.rupp.assignment.controller;


import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Scope;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
/*import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;*/
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;


import com.rupp.assignment.json.JStudent;
import com.rupp.assignment.json.JMessage;
//import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage.MessageType;



//import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping(value = {"student", "students" })
public class StudentController {

    private static final Logger LOG = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private com.rupp.assignment.service.StudentService service;
    @Autowired
    private JMessage message;    
    
    /**
     * return all Categories support Header If-Modified-Since is optional, timestamp of last update; use
     * "Sat, 29 Oct 1994 19:43:31 GMT"
     * 
     * @return Iterable<JStudent>
     */
    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    public Collection<JStudent> getAll(HttpServletRequest request, WebRequest webRequest,
            @RequestHeader(required = false, value = "If-Modified-Since") Date since) {

        //LOG.debug(" ============== If-Modified-Since {} ", since);

        return service.getAll();
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JStudent getDetails(HttpServletRequest request, @PathVariable int id) {

        return service.getDetails(id);
    }

    
    
    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    public JMessage create(HttpServletRequest request, @ModelAttribute JStudent domain) {    	
    	if(domain.getFirstname().isEmpty() || domain.getLastname().isEmpty() || 
    			domain.getSex() == null ||
    			domain.getContact_person_name().isEmpty() ||     			
    			domain.getContact_person_relationship() == null || 
    			domain.getContact_person_phone().isEmpty() ||   
    			domain.getAddress().isEmpty() ||
        		domain.getLastname() == null ){    		
    		this.message.setMessage("Please fill all require fields!");
        	this.message.setStatus(MessageType.ERROR);
        	return this.message;
        }
        return service.create(domain);
    }
    
    
    @RequestMapping(value = "v1/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JMessage update(HttpServletRequest request, @PathVariable int id, @ModelAttribute JStudent domain) {
    	if(domain.getFirstname().isEmpty() || domain.getLastname().isEmpty() || 
    			domain.getSex() == null ||
    			domain.getContact_person_name().isEmpty() ||     			
    			domain.getContact_person_relationship() == null || 
    			domain.getContact_person_phone().isEmpty() ||   
    			domain.getAddress().isEmpty() ||
        		domain.getLastname() == null 
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