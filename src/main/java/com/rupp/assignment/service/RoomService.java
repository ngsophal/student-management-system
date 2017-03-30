package com.rupp.assignment.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.RoomDao;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JRoom;
import com.rupp.assignment.json.JUser;
import com.rupp.assignment.json.JMessage.MessageType;

@Service
public class RoomService {
	@Autowired
    private RoomDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;
    
    public Collection<JRoom> getAll() {
        Collection<JRoom> dList= dao.getAll();
        return dList;
    }
    public JRoom getDetails(int id) {
        return dao.findById(id);
    }
    public JMessage create(JRoom jRoom) {
    	jRoom.setCreatedDate(new Date());
    	jRoom.setCreatedById(this.user.getId());
        dao.add(jRoom);
        this.message.setMessage("Room has been inserted successfully!");
        this.message.setStatus(MessageType.SUCCESS);
        return message;
    }
    
    public JMessage update(int id, JRoom jRoom) {
    	jRoom.setModifiedDate(new Date());
    	jRoom.setModifiedById(this.user.getId());
    	jRoom.setId(id);
        dao.update(jRoom);
        this.message.setMessage("Room has been updated successfully!");
        this.message.setStatus(MessageType.SUCCESS);
        return message;
    }
    
    public JMessage remove(int id){
    	JRoom jRoom = new JRoom();
    	jRoom.setModifiedDate(new Date());
    	jRoom.setModifiedById(this.user.getId());
    	jRoom.setId(id);
    	dao.remove(jRoom);
    	this.message.setMessage("Room has been removed successfully!");
        this.message.setStatus(MessageType.SUCCESS);
        return message;
    }
}
