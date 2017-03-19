package com.rupp.assignment.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.UserDao;
import com.rupp.assignment.json.JUser;

@Service
public class UserService {
    @Autowired
    private UserDao dao;
    
    
    public Collection<JUser> getAll() {
        Collection<JUser> dList= dao.getAll();
        
        return dList;
    }
    public JUser getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JUser JUser) {
        dao.add(JUser);
    }
    
    public void update(int id, JUser JUser) {
        dao.update(JUser);
    }
}
