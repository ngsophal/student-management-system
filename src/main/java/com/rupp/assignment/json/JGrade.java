package com.rupp.assignment.json;

public class JGrade extends JCommon {

    private String name;
 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String toString() { 
	    return "Name: '" + this.name ;
	} 
   
}
