package com.rupp.assignment.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.SessionDao;
import com.rupp.assignment.json.JSession;

@Service
public class SessionService {
    @Autowired
    private SessionDao dao;
    
    
    public Collection<JSession> getAll() {
        Collection<JSession> dList= dao.getAll();
        
        return dList;
    }
    public JSession getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JSession jSession) {
        dao.add(jSession);
    }
    
    public void update(int id, JSession jSession) {
        dao.update(jSession);
    }
}
