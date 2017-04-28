package com.rupp.assignment.json;

import java.sql.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JReportStudentEnrollment", description="JSON Model for showing student enrollment report")
public class JReportStudentEnrollment {
	
    @ApiModelProperty( value = "First name", required = true ) 
    private String firstName;
    @ApiModelProperty( value = "Last name", required = true ) 
    private String lastName;    
    @ApiModelProperty( value = "Sex", required = true ) 
    private Integer sex;
    @ApiModelProperty( value = "Date of birth", required = true ) 
    private Date dob;
    @ApiModelProperty( value = "Address", required = true ) 
	private String address;
    @ApiModelProperty( value = "Contact person name", required = true ) 
    private String contactPersonName;
    @ApiModelProperty( value = "Contact person relationship", required = true ) 
    private Integer contactPersonRelationship;
    @ApiModelProperty( value = "Contact person phone number", required = true ) 
    private String contactPersonPhone;
    @ApiModelProperty( value = "Student ID", required = true ) 
	private Integer studentID;
    @ApiModelProperty( value = "Course name", required = true ) 
	private String courseName;
    @ApiModelProperty( value = "Room Name", required = true ) 
	private String roomName;
    @ApiModelProperty( value = "Enrollment date", required = true ) 
    
	private Date entrollmentDate;


	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
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

	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public Integer getContactPersonRelationship() {
		return contactPersonRelationship;
	}

	public void setContactPersonRelationship(Integer contactPersonRelationship) {
		this.contactPersonRelationship = contactPersonRelationship;
	}

	public String getContactPersonPhone() {
		return contactPersonPhone;
	}

	public void setContactPersonPhone(String contactPersonPhone) {
		this.contactPersonPhone = contactPersonPhone;
	}

	public Integer getStudentID() {
		return studentID;
	}

	public void setStudentID(Integer studentID) {
		this.studentID = studentID;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Date getEntrollmentDate() {
		return entrollmentDate;
	}

	public void setEntrollmentDate(Date entrollmentDate) {
		this.entrollmentDate = entrollmentDate;
	}
}
