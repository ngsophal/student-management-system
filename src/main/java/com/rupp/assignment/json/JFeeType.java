package com.rupp.assignment.json;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JFeeType", description="JSON Model for showing fee type details")
public class JFeeType extends JCommon {
	
    @ApiModelProperty( value = "Name", required = true ) 
    private String name;
 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
   
}
