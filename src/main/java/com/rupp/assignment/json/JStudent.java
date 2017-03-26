package com.rupp.assignment.json;

import java.util.Date;

public class JStudent extends JCommon  {
    /** Unique id for this Entity in the database */
	
    private String firstname;
    private String lastname;    
    private String sex;
    private Date dob;
    
    private String address;
    private String contact_person_name;
    private String contact_person_relationship;    
    private String contact_person_phone;
    
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
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
	public String getContact_person_relationship() {
		return contact_person_relationship;
	}
	public void setContact_person_relationship(String contact_person_relationship) {
		this.contact_person_relationship = contact_person_relationship;
	}
	public String getContact_person_phone() {
		return contact_person_phone;
	}
	public void setContact_person_phone(String contact_person_phone) {
		this.contact_person_phone = contact_person_phone;
	}
	
   
}
