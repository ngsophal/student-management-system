package com.rupp.assignment.service;

import com.rupp.assignment.dao.FeeDao;
import com.rupp.assignment.json.JFee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class FeeService {
    @Autowired
    private FeeDao dao;

    public Collection<JFee> getAll() {
        Collection<JFee> dList= dao.getAll();

        return dList;
    }
    public JFee getDetails(int id) {
        return dao.findById(id);
    }
    public void create(JFee jFee) {
        dao.add(jFee);
    }
    
    public void update(int id, JFee jFee) {
        dao.update(jFee);
    }
}
