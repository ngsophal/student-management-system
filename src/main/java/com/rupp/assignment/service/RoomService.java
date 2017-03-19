package com.rupp.assignment.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.RoomDao;
import com.rupp.assignment.json.JRoom;

@Service
public class RoomService {
    @Autowired
    private RoomDao dao;
    
    
    public Collection<JRoom> getAll() {
        Collection<JRoom> dList= dao.getAll();
        
        return dList;
    }
    public JRoom getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JRoom jRoom) {
        dao.add(jRoom);
    }
    
    public void update(int id, JRoom jRoom) {
        dao.update(jRoom);
    }
}
