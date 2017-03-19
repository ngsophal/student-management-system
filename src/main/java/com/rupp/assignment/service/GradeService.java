package com.rupp.assignment.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.GradeDao;
import com.rupp.assignment.json.JGrade;

@Service
public class GradeService {
    @Autowired
    private GradeDao dao;
    
    
    public Collection<JGrade> getAll() {
        Collection<JGrade> dList= dao.getAll();
        
        return dList;
    }
    public JGrade getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JGrade jGrade) {
        dao.add(jGrade);
    }
    
    public void update(int id, JGrade jGrade) {
        dao.update(jGrade);
    }
}
