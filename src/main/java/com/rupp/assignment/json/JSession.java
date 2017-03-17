package com.rupp.assignment.json;

import java.io.Serializable;

public class JSession implements Serializable {

    private static final long serialVersionUID = 1L;


    /** Unique id for this Entity in the database */
    private int id;
    private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
    
   
    
    

   
}
