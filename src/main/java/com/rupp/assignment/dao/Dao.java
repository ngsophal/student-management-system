package com.rupp.assignment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface Dao <T extends Object>{
    
    T findById(@Param("id") int id);
    
    void add(T domain);
        
    void update(T domain);
    
    List<T> getAll();
    
    void remove(T domain);
    
    List<T> getPage(@Param("limit") int limit, @Param("offset") int offset, @Param("search") String search);
    
    List<T> getAllWithOffset(@Param("limit") int limit, @Param("offset") int offset);
    
    Integer count();
}
