package com.rupp.assignment.service;

import java.util.Date;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.GradeDao;
import com.rupp.assignment.json.JGrade;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class GradeService {
    @Autowired
    private GradeDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;
    
    public Collection<JGrade> getAll() {
        Collection<JGrade> dList= dao.getAll();
        
        return dList;
    }
    public JGrade getDetails(int id) {
        return dao.findById(id);
    }
    public JMessage create(JGrade jGrade) {
    	jGrade.setCreatedDate(new Date());
    	jGrade.setCreatedById(this.user.getId());
    	try {
    		dao.add(jGrade);
            this.message.setMessage("Grade has been inserted successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
			dao.add(jGrade);
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        return message;
    }
    
    public JMessage update(int id, JGrade jGrade) {
    	jGrade.setModifiedDate(new Date());
    	jGrade.setModifiedById(this.user.getId());
    	jGrade.setId(id);
    	
    	try {
    		dao.update(jGrade);
            this.message.setMessage("Grade has been updated successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        
        return message;
    }
    
    public JMessage remove(int id){
    	JGrade jGrade = new JGrade();
    	jGrade.setModifiedDate(new Date());
    	jGrade.setModifiedById(this.user.getId());
    	jGrade.setId(id);
    	try {
    		dao.remove(jGrade);
        	this.message.setMessage("Grade has been removed successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	    	this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
    	
        return message;
    }
}
