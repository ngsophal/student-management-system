package com.rupp.assignment.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.StudentDao;
import com.rupp.assignment.json.JStudent;

@Service
public class StudentService {
	@Autowired
    private StudentDao dao;
    
    
    public Collection<JStudent> getAll() {
        Collection<JStudent> dList= dao.getAll();
        
        return dList;
    }
    public JStudent getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JStudent jStudent) {
        dao.add(jStudent);
    }
    
    public void update(int id, JStudent jStudent) {
        dao.update(jStudent);
    }
}


