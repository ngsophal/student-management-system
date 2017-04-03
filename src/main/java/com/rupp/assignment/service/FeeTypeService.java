package com.rupp.assignment.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.FeeTypeDao;
import com.rupp.assignment.json.JFeeType;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class FeeTypeService {
	 @Autowired
	    private FeeTypeDao dao;
	    @Autowired
	    private JUser user;
	    @Autowired
	    private JMessage message;
	    
	    public Collection<JFeeType> getAll() {
	        Collection<JFeeType> dList= dao.getAll();
	        return dList;
	    }
	    public JFeeType getDetails(int id) {
	        return dao.findById(id);
	    }
	    public JMessage create(JFeeType jFeeType) {
	    	jFeeType.setCreatedDate(new Date());
	    	jFeeType.setCreatedById(this.user.getId());
	    	try{
	    		dao.add(jFeeType);
		        this.message.setMessage("Fee Type has been inserted successfully!");
		        this.message.setStatus(MessageType.SUCCESS);
	    	}catch(Exception e){
	    		this.message.setMessage(e.getMessage());
		        this.message.setStatus(MessageType.ERROR);
	    	}
	        
	        return message;
	    }
	    
	    public JMessage update(int id, JFeeType jFeeType) {
	    	jFeeType.setModifiedDate(new Date());
	    	jFeeType.setModifiedById(this.user.getId());
	    	jFeeType.setId(id);
	    	try{
	    		dao.update(jFeeType);
		        this.message.setMessage("Fee Type has been updated successfully!");
		        this.message.setStatus(MessageType.SUCCESS);
	    	}catch (Exception e) {
		        this.message.setMessage(e.getMessage());
		        this.message.setStatus(MessageType.ERROR);
			}
	        return message;
	    }
	    
	    public JMessage remove(int id){
	    	JFeeType jFeeType = new JFeeType();
	    	jFeeType.setModifiedDate(new Date());
	    	jFeeType.setModifiedById(this.user.getId());
	    	jFeeType.setId(id);
	    	try {
	    		dao.remove(jFeeType);
		    	this.message.setMessage("Fee Type has been removed successfully!");
		        this.message.setStatus(MessageType.SUCCESS);
			} catch (Exception e) {
		    	this.message.setMessage(e.getMessage());
		        this.message.setStatus(MessageType.ERROR);
			}
	    	
	        return message;
	    }
}
