package com.rupp.assignment.service;

import com.rupp.assignment.dao.CourseDao;
import com.rupp.assignment.json.JCourse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class CourseService {
    @Autowired
    private CourseDao dao;
    
    
    public Collection<JCourse> getAll() {
        Collection<JCourse> dList= dao.getAll();
        
        return dList;
    }
    public JCourse getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JCourse jCourse) {
        dao.add(jCourse);
    }
    
    public void update(int id, JCourse jCourse) {
        dao.update(jCourse);
    }
}
