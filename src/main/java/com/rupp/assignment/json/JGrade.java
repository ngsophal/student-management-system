package com.rupp.assignment.json;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="Grade", description="JSON Model for showing grade details")
public class JGrade extends JCommon {

    @ApiModelProperty( value = "Name", required = true ) 
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
