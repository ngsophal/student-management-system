package com.rupp.assignment.json;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JSession", description="JSON Model for showing detail session")

public class JSession extends JCommon {

    @ApiModelProperty( value = "Name", required = true ) 
    private String name;
 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
   
}
