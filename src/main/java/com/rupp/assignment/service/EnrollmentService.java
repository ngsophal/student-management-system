package com.rupp.assignment.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.EnrollmentDao;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JEnrollment;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class EnrollmentService {
	@Autowired
    private EnrollmentDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;
    
    public Collection<JEnrollment> getAll() {
        Collection<JEnrollment> dList= dao.getAll();
        
        return dList;
    }
    
    public Collection<JEnrollment> getPage(int limit, int offset, String search) {
    	search = "'%" + (search == null ? "":search) + "%'";
        Collection<JEnrollment> dList= dao.getPage(limit, offset, search);
        return dList;
    }
    
    public JEnrollment getDetails(int id) {
        return dao.findById(id);
    }
    
    public JMessage create(JEnrollment jEnrollment) {
    	jEnrollment.setCreatedDate(new Date());
    	jEnrollment.setCreatedById(this.user.getId());
		try{
			int id = dao.add(jEnrollment);
	        this.message.setMessage("Enrollment has been inserted successfully!");
	        this.message.setStatus(MessageType.SUCCESS);
	        this.message.setInsertedId(id);
		}catch(Exception e){
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        return message;
    }
    
    public JMessage update(int id, JEnrollment jEnrollment) {
    	jEnrollment.setModifiedDate(new Date());
    	jEnrollment.setModifiedById(this.user.getId());
    	jEnrollment.setId(id);
    	try{
    		dao.update(jEnrollment);
	        this.message.setMessage("Enrollment has been updated successfully!");
	        this.message.setStatus(MessageType.SUCCESS);
    	}catch(Exception e){
    		dao.update(jEnrollment);
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.SUCCESS);
    	}
        return message;
    }
    
    public JMessage remove(int id){
    	JEnrollment jEnrollment = new JEnrollment();
    	jEnrollment.setModifiedDate(new Date());
    	jEnrollment.setModifiedById(this.user.getId());
    	jEnrollment.setId(id);
    	try{
    		dao.remove(jEnrollment);
        	this.message.setMessage("Enrollment has been removed successfully!");
            this.message.setStatus(MessageType.SUCCESS);
    	}catch(Exception e){
    		this.message.setMessage(e.getMessage());
            this.message.setStatus(MessageType.ERROR);
    	}
        return message;
    }
   
    public Integer count(String search){
    	search = "'%" + (search == null ? "":search) + "%'";
    	return dao.count(search);    }
}
