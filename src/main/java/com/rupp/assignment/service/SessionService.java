package com.rupp.assignment.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.SessionDao;
import com.rupp.assignment.json.JSession;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class SessionService {
	@Autowired
    private SessionDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;
    
    public Collection<JSession> getAll() {
        Collection<JSession> dList= dao.getAll();
        return dList;
    }
    public JSession getDetails(int id) {
        return dao.findById(id);
    }
    public JMessage create(JSession jSession) {
    	jSession.setCreatedDate(new Date());
    	jSession.setCreatedById(this.user.getId());
    	try {
    		dao.add(jSession);
            this.message.setMessage("Session has been inserted successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        return message;
    }
    
    public JMessage update(int id, JSession jSession) {
    	jSession.setModifiedDate(new Date());
    	jSession.setModifiedById(this.user.getId());
    	jSession.setId(id);
        try {
        	dao.update(jSession);
            this.message.setMessage("Session has been updated successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        return message;
    }
    
    public JMessage remove(int id){
    	JSession jSession = new JSession();
    	jSession.setModifiedDate(new Date());
    	jSession.setModifiedById(this.user.getId());
    	jSession.setId(id);
    	try {
    		dao.remove(jSession);
        	this.message.setMessage("Session has been removed successfully!");
            this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	    	this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        return message;
    }
}
