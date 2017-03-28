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
	
	public String getAction(){
		return "<button type='button' data-id='" + this.getId() + "' class='btn btn-primary waves-effect m-r-5 edit'>Edit</button>" +
				"<button type='button'  data-id='" + this.getId() + "' class='btn btn-danger waves-effect delete'>Delete</button>";
	}
   
}
