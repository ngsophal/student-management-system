package com.rupp.assignment.service;

import java.util.Date;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.StudentDao;
import com.rupp.assignment.json.JStudent;
import com.rupp.assignment.json.JEnrollment;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class StudentService {
    @Autowired
    private StudentDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;
    
    public Collection<JStudent> getAll() {
        Collection<JStudent> dList= dao.getAll();
        
        return dList;
    }
    
    public Collection<JStudent> getPage(int limit, int offset, String search) {
    	search = "'%" + (search == null ? "":search) + "%'";
        Collection<JStudent> dList= dao.getPage(limit, offset, search);
        return dList;
    }
    
    public JStudent getDetails(int id) {
        return dao.findById(id);
    }
    public JMessage create(JStudent jStudent) {
    	jStudent.setCreatedDate(new Date());
    	jStudent.setCreatedById(this.user.getId());
    	try {
    		dao.add(jStudent);
            this.message.setMessage("Student has been inserted successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
			dao.add(jStudent);
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        return message;
    }
    
    public JMessage update(int id, JStudent jStudent) {
    	jStudent.setModifiedDate(new Date());
    	jStudent.setModifiedById(this.user.getId());
    	jStudent.setId(id);
    	
    	try {
    		dao.update(jStudent);
            this.message.setMessage("Student has been updated successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        
        return message;
    }
    
    public JMessage remove(int id){
    	JStudent jStudent = new JStudent();
    	jStudent.setModifiedDate(new Date());
    	jStudent.setModifiedById(this.user.getId());
    	jStudent.setId(id);
    	try {
    		dao.remove(jStudent);
        	this.message.setMessage("Student has been removed successfully!");
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






