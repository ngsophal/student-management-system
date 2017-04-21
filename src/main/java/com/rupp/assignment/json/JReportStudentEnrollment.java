package com.rupp.assignment.json;

import java.sql.Date;

public class JReportStudentEnrollment {

    private String firstName;
    private String lastName;    
    private Integer sex;
    private Date dob;
	private String address;
    private String contactPersonName;
    private Integer contactPersonRelationship;
    private String contactPersonPhone;
	private Integer studentID;
	private String courseName;
	private String roomName;
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
