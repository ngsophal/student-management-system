package com.rupp.assignment.controller;


import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;


import com.rupp.assignment.json.JPayment;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JMessage.MessageType;


@Controller
@RequestMapping(value = {"payment", "payments" })
public class PaymentController {

    private static final Logger LOG = LoggerFactory.getLogger(PaymentController.class);

    @Autowired
    private com.rupp.assignment.service.PaymentService service;
    @Autowired
    private JMessage message;    
    
    /**
     * return all Categories support Header If-Modified-Since is optional, timestamp of last update; use
     * "Sat, 29 Oct 1994 19:43:31 GMT"
     * 
     * @return Iterable<JPayment>
     */
    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    public Collection<JPayment> getAll(HttpServletRequest request, WebRequest webRequest,
            @RequestHeader(required = false, value = "If-Modified-Since") Date since) {

        //LOG.debug(" ============== If-Modified-Since {} ", since);

        return service.getAll();
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JPayment getDetails(HttpServletRequest request, @PathVariable int id) {

        return service.getDetails(id);
    }

    
    
    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    public JMessage create(HttpServletRequest request, @ModelAttribute JPayment domain) {    	
    	if(	domain.getEnrollmentId() <= 0 || domain.getPaymentAmount() <= 0  || domain.getFeeTypeId() <= 0 || domain.getPaymentDate() == null ){		
    		this.message.setMessage("Please fill all require fields!");
        	this.message.setStatus(MessageType.ERROR);
        	return this.message;
        }
        return service.create(domain);
    }
    
    
    @RequestMapping(value = "v1/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JMessage update(HttpServletRequest request, @PathVariable int id, @ModelAttribute JPayment domain) {
    	if( domain.getEnrollmentId() <= 0 || domain.getPaymentAmount() <= 0  || domain.getFeeTypeId() <= 0 || domain.getPaymentDate() == null ){
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