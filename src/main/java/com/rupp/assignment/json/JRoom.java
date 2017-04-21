package com.rupp.assignment.json;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JRoom", description="JSON Model for showing detail room")
public class JRoom extends JCommon {
	
    @ApiModelProperty( value = "Name", required = true ) 
    private String name;
 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
   
}
