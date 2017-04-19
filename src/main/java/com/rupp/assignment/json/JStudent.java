package com.rupp.assignment.json;

import java.sql.Date;

public class JStudent extends JCommon  {
    /** Unique id for this Entity in the database */
	
    private String firstname;
    private String lastname;    
    private Integer sex;
    private Date dob;
    private String sexLabel;
	private String address;
    private String contact_person_name;
    private Integer contact_person_relationship;    
    private String contact_person_phone;
    private String fullname;
    private String contact_person_relationship_label;
    
    public String getFullname() {
    	this.fullname = this.firstname + " " + this.lastname;
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
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
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
