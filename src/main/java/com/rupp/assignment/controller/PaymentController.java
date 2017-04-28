package com.rupp.assignment.controller;


import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;


import com.rupp.assignment.json.JPayment;
import com.rupp.assignment.json.BootstrapTableModel;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JMessage.MessageType;

import io.swagger.annotations.ApiOperation;


@Controller
@RequestMapping(value = {"payment", "payments" })
public class PaymentController {

    private static final Logger LOG = LoggerFactory.getLogger(PaymentController.class);

    @Autowired
    private com.rupp.assignment.service.PaymentService service;
    @Autowired
    private JMessage message;    
    
    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get all payments", notes = "Get all payments", response = JPayment.class, responseContainer = "List")
    public BootstrapTableModel<JPayment> getAll(HttpServletRequest request, WebRequest webRequest,
            @RequestHeader(required = false, value = "If-Modified-Since") Date since) {
    	
        BootstrapTableModel<JPayment> res = new BootstrapTableModel<JPayment>();
    	String search = request.getParameter("search");
    	int limit = Integer.parseInt(request.getParameter("limit"));
    	int offset = Integer.parseInt(request.getParameter("offset"));
    	res.setRows(service.getPage(limit, offset, search));
    	res.setTotal(service.count(search));
        return res;
    }


    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get payment by id", notes = "Get payment by id", response = JPayment.class)
    public JPayment getDetails(HttpServletRequest request, @PathVariable int id) {

        return service.getDetails(id);
    }

    
    
    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Create payment", notes = "Create payment", response = JMessage.class)
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
    @ApiOperation(value="Update payment", notes = "Update payment", response = JMessage.class)
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
    @ApiOperation(value="Remove payment", notes = "Remove payment", response = JMessage.class)
    public JMessage remove(HttpServletRequest request) {
        return service.remove(Integer.parseInt(request.getParameter("id")));
    }
    
    @RequestMapping(value = "v1/{erollmentid}/{feetypeid}", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get fee by enrollment id and fee type id", notes = "Get fee by enrollment id and fee type id", response = Integer.class)
    public Integer getFee(HttpServletRequest request, @PathVariable int erollmentid, @PathVariable int feetypeid) {
        return service.getFee(erollmentid, feetypeid);
    }
    
    
    /*@RequestMapping(value = "v2/{erollmentid}/{feetypeid}", method = RequestMethod.POST)
    @ResponseBody
    public JMessage getExistFee(HttpServletRequest request, @PathVariable int erollmentid, @PathVariable int feetypeid) {
    	if( erollmentid <= 0  || feetypeid <= 0 ){
        		this.message.setMessage("Please fill all require fields!");        	
        		this.message.setStatus(MessageType.ERROR);
        		return this.message;
        }
        return service.getExistFee(erollmentid, feetypeid);
    }*/
    
}