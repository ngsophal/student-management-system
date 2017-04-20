package com.rupp.assignment.json;

import java.sql.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JStudent", description="JSON Model for showing detail student")
public class JStudent extends JCommon  {
	

    @ApiModelProperty( value = "First name", required = true ) 
    private String firstName;
    @ApiModelProperty( value = "Last name", required = true ) 
    private String lastName;    
    @ApiModelProperty( value = "Sex", required = true ) 
    private Integer sex;
    @ApiModelProperty( value = "Date of birth", required = true ) 
    private Date dob;
    private String sexLabel;
    @ApiModelProperty( value = "Address", required = true ) 
	private String address;
    @ApiModelProperty( value = "Contact person name", required = true ) 
    private String contact_person_name;
    @ApiModelProperty( value = "Contact person relationship", required = true ) 
    private Integer contact_person_relationship;    
    @ApiModelProperty( value = "Contact person phone number", required = true ) 
    private String contact_person_phone;
    private String fullname;
    private String contact_person_relationship_label;
    
    public String getFullname() {
    	this.fullname = this.firstName + " " + this.lastName;
		return this.fullname;
	}
	
    
	public String getContact_person_relationship_label() {
		return contact_person_relationship_label;
	}


	public void setContact_person_relationship_label(String contact_person_relationship_label) {
		this.contact_person_relationship_label = contact_person_relationship_label;
	}


	public String getSexLabel() {
  		return sexLabel;
  	}
  	public void setSexLabel(String sexLabel) {
  		this.sexLabel = sexLabel;
  	}
	
    public String getFirstname() {
		return firstName;
	}
	public void setFirstname(String firstName) {
		this.firstName = firstName;
	}
	public String getLastname() {
		return lastName;
	}
	public void setLastname(String lastName) {
		this.lastName = lastName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact_person_name() {
		return contact_person_name;
	}
	public void setContact_person_name(String contact_person_name) {
		this.contact_person_name = contact_person_name;
	}
	public Integer getContact_person_relationship() {
		return contact_person_relationship;
	}
	public void setContact_person_relationship(Integer contact_person_relationship) {
		this.contact_person_relationship = contact_person_relationship;
	}
	public String getContact_person_phone() {
		return contact_person_phone;
	}
	public void setContact_person_phone(String contact_person_phone) {
		this.contact_person_phone = contact_person_phone;
	}
	
	public String getAction(){
		return "<button type='button' data-id='" + this.getId() + "' class='btn btn-primary waves-effect m-r-5 edit'>Edit</button>" +
				"<a href='index.jsp?p=enrollment&studentId=" + this.getId() + "' class='btn btn-primary waves-effect m-r-5'>Enroll</a>" +
				"<button type='button'  data-id='" + this.getId() + "' class='btn btn-danger waves-effect delete'>Delete</button>";
	}
    
	
   
}
