package com.rupp.assignment.service;

import java.util.Date;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.PaymentDao;
import com.rupp.assignment.json.JPayment;
import com.rupp.assignment.json.JEnrollment;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class PaymentService {
    @Autowired
    private PaymentDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;
    
    public Collection<JPayment> getAll() {
        Collection<JPayment> dList= dao.getAll();
        
        return dList;
    }
    
    public Collection<JPayment> getPage(int limit, int offset, String search) {
    	search = "'%" + (search == null ? "":search) + "%'";
        Collection<JPayment> dList= dao.getPage(limit, offset, search);
        return dList;
    }
    
    public JPayment getDetails(int id) {
        return dao.findById(id);
    }
    public JMessage create(JPayment jPayment) {
    	jPayment.setCreatedDate(new Date());
    	jPayment.setCreatedById(this.user.getId());
    	try {
    		dao.add(jPayment);
            this.message.setMessage("Payment has been inserted successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
			dao.add(jPayment);
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        return message;
    }
    
    public JMessage update(int id, JPayment jPayment) {
    	jPayment.setModifiedDate(new Date());
    	jPayment.setModifiedById(this.user.getId());
    	jPayment.setId(id);
    	
    	try {
    		dao.update(jPayment);
            this.message.setMessage("Payment has been updated successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        
        return message;
    }
    
    public JMessage remove(int id){
    	JPayment jPayment = new JPayment();
    	jPayment.setModifiedDate(new Date());
    	jPayment.setModifiedById(this.user.getId());
    	jPayment.setId(id);
    	try {
    		dao.remove(jPayment);
        	this.message.setMessage("Payment has been removed successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	    	this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
    	
        return message;
    }
    
    public Integer count(String search){
    	search = "'%" + (search == null ? "":search) + "%'";
    	return dao.count(search);    
    }
}






