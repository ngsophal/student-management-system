package com.rupp.assignment.controller;

import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JMessage.MessageType;


@Controller
@Scope("session")
@RequestMapping(value = {"user", "users" })
public class UserController {

    private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private com.rupp.assignment.service.UserService service;
    @Autowired
    private JMessage message;
    @Autowired 
    JUser user;

    /**
     * return all Grades support Header If-Modified-Since is optional, timestamp of last update; use
     * "Sat, 29 Oct 1994 19:43:31 GMT"
     * 
     * @return Iterable<JUser>
     */
    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    public Collection<JUser> getAll(HttpServletRequest request, WebRequest webRequest,
            @RequestHeader(required = false, value = "If-Modified-Since") Date since) {

        //LOG.debug(" ============== If-Modified-Since {} ", since);

        return service.getAll();
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JUser getDetails(HttpServletRequest request, @PathVariable int id) {

        return service.getDetails(id);
    }

    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    public JMessage create(HttpServletRequest request, @ModelAttribute JUser domain) {
		if(domain.getPassword().isEmpty() || 
    		domain.getPassword() == null ||
    		domain.getConfirmPassword().isEmpty() || 
    		domain.getConfirmPassword() == null ||
    		domain.getUsername().isEmpty() ||
    		domain.getUsername() == null ||
    		domain.getFullName().isEmpty() ||
    		domain.getFullName() == null 
    	){
    		this.message.setMessage("Please fill all require fields!");
    		this.message.setStatus(MessageType.ERROR);
    		return this.message;
    	}
    	if(!domain.getPassword().matches(domain.getConfirmPassword()) ){
    		this.message.setMessage("Password is not match!");
    		this.message.setStatus(MessageType.ERROR);
    		return this.message;
    	}
    	
    	JUser existedUser = service.findByUsername(domain.getUsername());
    	if(existedUser != null){
    		this.message.setMessage("Username has already existed!");
    		this.message.setStatus(MessageType.ERROR);
    		return this.message;
    	}
    	
        return service.create(domain);
    }
    
    @RequestMapping(value = "v1/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JMessage update(HttpServletRequest request, @PathVariable int id, @ModelAttribute JUser domain) {
    	if(domain.getFullName().isEmpty() || 
    		domain.getFullName() == null){
    		this.message.setMessage("Please fill all require fields!");
    		this.message.setStatus(MessageType.ERROR);
    		return this.message;
    	}
        return service.update(id, domain);
    }
    
    @RequestMapping(value = "v1/change-password/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JMessage changePassword(HttpServletRequest request, @PathVariable int id, @ModelAttribute JUser domain) {
    	if(domain.getPassword().isEmpty() || 
    		domain.getPassword() == null ||
    		domain.getConfirmPassword().isEmpty() || 
    		domain.getConfirmPassword() == null
    	){
    		this.message.setMessage("Please fill all require fields!");
    		this.message.setStatus(MessageType.ERROR);
    		return this.message;
    	}
    	
    	if(!domain.getPassword().matches(domain.getConfirmPassword()) ){
    		this.message.setMessage("Password is not match!");
    		this.message.setStatus(MessageType.ERROR);
    		return this.message;
    	}
    	
        return service.changePassword(id, domain);
    }

    
    @RequestMapping(value = "v1/remove", method = RequestMethod.POST)
    @ResponseBody
    public JMessage remove(HttpServletRequest request) {
        return service.remove(Integer.parseInt(request.getParameter("id")));
    }
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(HttpServletRequest request) {
         JUser user = service.login(request.getParameter("username"), request.getParameter("password"));
         if(user == null){
              return "redirect:/login.jsp";
         }else{
        	  this.user.setId(user.getId());
        	  request.getSession().setAttribute("userId",user.getId());
              request.getSession().setAttribute("fullName",user.getFullName());
              return "redirect:/index.jsp";
         } 
    }
    
    @RequestMapping(value = "logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login.jsp";

    }
    
}
