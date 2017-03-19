package com.rupp.assignment.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.FeeTypeDao;
import com.rupp.assignment.json.JFeeType;

@Service
public class FeeTypeService {
    @Autowired
    private FeeTypeDao dao;
    
    
    public Collection<JFeeType> getAll() {
        Collection<JFeeType> dList= dao.getAll();
        
        return dList;
    }
    public JFeeType getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JFeeType jFeeType) {
        dao.add(jFeeType);
    }
    
    public void update(int id, JFeeType jFeeType) {
        dao.update(jFeeType);
    }
}
