package com.rupp.assignment.json;

import java.sql.Date;

public class JStudent extends JCommon  {
    /** Unique id for this Entity in the database */
	
    private String firstName;
    private String lastName;    
    private Integer sex;
    private Date dob;
    private String sexLabel;
	private String address;
    private String contact_person_name;
    private Integer contact_person_relationship;    
    private String contact_person_phone;
    
    public String getFullname() {
		return this.firstName + " " + this.lastName;
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
