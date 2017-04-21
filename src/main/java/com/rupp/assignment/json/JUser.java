package com.rupp.assignment.json;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@Component
@Scope("session")
@ApiModel(value="JUser", description="JSON Model for showing detail user")
public class JUser extends JCommon  {
    @ApiModelProperty( value = "Username", required = true ) 
    private String username;
    @ApiModelProperty( value = "Password", required = true ) 
    private String password;
    @ApiModelProperty( value = "Confirm password", required = true ) 
    private String confirmPassword;
    @ApiModelProperty( value = "Full name", required = true ) 
    private String fullName;
    
    
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullname(String fullName) {
		this.fullName = fullName;
	}
	
	public String getAction(){
		return "<button type='button' data-id='" + this.getId() + "' class='btn btn-primary waves-effect m-r-5 edit'>Edit</button>" +
				"<button type='button' data-id='" + this.getId() + "' class='btn btn-success waves-effect m-r-5 change-password'>Change Password</button>" +
				"<button type='button'  data-id='" + this.getId() + "' class='btn btn-danger waves-effect delete'>Delete</button>";
	}
	
   
}
