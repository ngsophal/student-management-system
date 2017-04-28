package com.rupp.assignment.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.UserDao;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class UserService {
	@Autowired
    private UserDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;
    
    public Collection<JUser> getAll() {
        Collection<JUser> dList= dao.getAll();
        
        return dList;
    }
    
    public Collection<JUser> getPage(int limit, int offset, String search) {
    	search = "'%" + (search == null ? "":search) + "%'";
        Collection<JUser> dList= dao.getPage(limit, offset, search);
        return dList;
    }
    
    public JUser getDetails(int id) {
        return dao.findById(id);
    }
    
    public JMessage create(JUser jUser) {
    	jUser.setCreatedDate(new Date());
    	jUser.setCreatedById(this.user.getId());
    	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(jUser.getPassword());
		jUser.setPassword(hashedPassword);
		
		try{
			dao.add(jUser);
	        this.message.setMessage("User has been inserted successfully!");
	        this.message.setStatus(MessageType.SUCCESS);
		}catch(Exception e){
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
       
        return message;
    }
    
    public JMessage update(int id, JUser jUser) {
    	jUser.setModifiedDate(new Date());
    	jUser.setModifiedById(this.user.getId());
    	jUser.setId(id);
    	try{
    		dao.update(jUser);
	        this.message.setMessage("User has been updated successfully!");
	        this.message.setStatus(MessageType.SUCCESS);
    	}catch(Exception e){
    		dao.update(jUser);
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.SUCCESS);
    	}
       
        return message;
    }
    
    public JMessage changePassword(int id, JUser jUser) {
    	jUser.setModifiedDate(new Date());
    	jUser.setModifiedById(this.user.getId());
    	jUser.setId(id);
    	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(jUser.getPassword());
		jUser.setPassword(hashedPassword);
		try{
			dao.changePassword(jUser);
	        this.message.setMessage("Password has been changed successfully!");
	        this.message.setStatus(MessageType.SUCCESS);
		}catch(Exception e){
    		this.message.setMessage(e.getMessage());
            this.message.setStatus(MessageType.ERROR);	
		}
        return message;
    }

    
    public JMessage remove(int id){
    	JUser jUser = new JUser();
    	jUser.setModifiedDate(new Date());
    	jUser.setModifiedById(this.user.getId());
    	jUser.setId(id);
    	try{
    		dao.remove(jUser);
        	this.message.setMessage("User has been removed successfully!");
            this.message.setStatus(MessageType.SUCCESS);
    	}catch(Exception e){
    		this.message.setMessage(e.getMessage());
            this.message.setStatus(MessageType.ERROR);
    	}
        return message;
    }
    
    public JUser login(String username, String password){
    	JUser existedUser = dao.findByUsername(username);
    	if(existedUser != null){
    		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    		if(passwordEncoder.matches(password, existedUser.getPassword())) return existedUser;
    	}
    	return null;
    }
    
    public JUser findByUsername(String username){
    	JUser user = dao.findByUsername(username);
    	return user;
    }
    
    public Integer count(String search){
    	search = "'%" + (search == null ? "":search) + "%'";
    	return dao.count(search);
    }
}
