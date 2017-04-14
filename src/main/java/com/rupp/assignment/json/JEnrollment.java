package com.rupp.assignment.json;

import java.sql.Date;

public class JEnrollment extends JCommon {

    private int studentId;
    private JStudent student;
    private int courseId;
    private JCourse course;
	private int roomId;
	private JRoom room;
	private Date enrollmentDate;
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public JStudent getStudent() {
		return student;
	}
	public void setStudent(JStudent student) {
		this.student = student;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public JCourse getCourse() {
		return course;
	}
	public void setCourse(JCourse course) {
		this.course = course;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public JRoom getRoom() {
		return room;
	}
	public void setRoom(JRoom room) {
		this.room = room;
	}
	public Date getEnrollmentDate() {
		return enrollmentDate;
	}
	public void setEnrollmentDate(Date enrollmentDate) {
		this.enrollmentDate = enrollmentDate;
	}
	public String getAction(){
		return "<a href='index.jsp?p=enrollment&enrollmentId=" + this.getId() + "' class='btn btn-primary waves-effect m-r-5'>Edit</a>" +
				"<a href='index.jsp?p=payment&enrollmentId=" + this.getId() + "' class='btn btn-primary waves-effect m-r-5'>Pay</a>" +
				"<button type='button'  data-id='" + this.getId() + "' class='btn btn-danger waves-effect delete'>Delete</button>";
	}
	
   
}
