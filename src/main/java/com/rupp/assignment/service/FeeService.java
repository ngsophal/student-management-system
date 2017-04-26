package com.rupp.assignment.service;

import com.rupp.assignment.dao.FeeDao;
import com.rupp.assignment.json.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Date;

@Service
public class FeeService {
    @Autowired
    private FeeDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;


    public Collection<JFee> getAll() {
        Collection<JFee> dList= dao.getAll();

        return dList;
    }
    public JFee getDetails(int id) {
        return dao.findById(id);
    }

    public JMessage create(JFee jFee) {
        try
        {
            jFee.setCreatedDate(new Date());
            jFee.setCreatedById(this.user.getId());
            dao.add(jFee);
            this.message.setMessage("Fee has been inserted successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Insert Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }
    }

    public JMessage update(int id, JFee jFee) {
        try
        {
            jFee.setModifiedDate(new Date());
            jFee.setModifiedById(this.user.getId());
            jFee.setId(id);
            dao.update(jFee);
            this.message.setMessage("Fee has been updated successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Update Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }

    }

    public JMessage remove(int id){
        try
        {
            JFee jFee = new JFee();
            jFee.setModifiedDate(new Date());
            jFee.setModifiedById(this.user.getId());
            jFee.setId(id);
            dao.remove(jFee);
            this.message.setMessage("Fee has been removed successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Remove Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }
    }
    
    public Integer getExistFee(int feetypeid, int courseid) {  
    	int valid = 0;
    	valid = dao.getExistFee(feetypeid, courseid);
    	if(valid > 0){
    		valid = 1;
    	}
    	return valid;
    	/*try {
    		valid = dao.getExistFee(enrollmentid, feetypeid);
    		if(valid > 0){
    			this.message.setMessage("Fee for this course and fee type already exist! Please find and update!");                
    		}else{
    			this.message.setMessage("Fee for this course and fee type not already exist!");             
    		}
    		this.message.setStatus(MessageType.SUCCESS);
		} catch (Exception e) {
	        this.message.setMessage(e.getMessage());
	        this.message.setStatus(MessageType.ERROR);
		}
        
        return message;*/
    }

}
