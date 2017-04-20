package com.rupp.assignment.controller;

import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.rupp.assignment.json.JGrade;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JUser;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import com.rupp.assignment.json.JMessage.MessageType;


@Controller
@RequestMapping(value = {"grade", "grades" })
@Api(tags = "grades")
public class GradeController {

    private static final Logger LOG = LoggerFactory.getLogger(GradeController.class);

    @Autowired
    private com.rupp.assignment.service.GradeService service;
    @Autowired
    private JMessage message;

    
    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get all grades", notes = "Get all grades", responseContainer = "List")
    public Collection<JGrade> getAll(HttpServletRequest request, WebRequest webRequest,
            @RequestHeader(required = false, value = "If-Modified-Since") Date since) {
        return service.getAll();
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get detail grade by id", notes = "Get detail grade by id", response = JGrade.class)
    public JGrade getDetails(HttpServletRequest request, @PathVariable int id) {

        return service.getDetails(id);
    }

    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Create grade", notes = "Create grade", response = JMessage.class)
    public JMessage create(HttpServletRequest request, @ModelAttribute JGrade domain) {
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
    @ApiOperation(value="Update grade", notes = "Update grade", response = JMessage.class)
    public JMessage update(HttpServletRequest request, @PathVariable int id, @ModelAttribute JGrade domain) {
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
    @ApiOperation(value="Remove grade", notes = "Remove grade", response = JMessage.class)
    public JMessage remove(HttpServletRequest request) {
        return service.remove(Integer.parseInt(request.getParameter("id")));
    }
    
}
