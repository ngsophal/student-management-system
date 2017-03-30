package com.rupp.assignment.json;

import java.sql.Date;

public class JCourseRoom {
	protected int id;
    private JCourse courseID;
	private JRoom roomID;
	protected Date createdDate;
	protected JUser createdBy;
	protected Date modifiedDate;
	protected JUser modifiedBy;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public JCourse getCourseID() {
		return courseID;
	}

	public void setCourseID(JCourse courseID) {
		this.courseID = courseID;
	}

	public JRoom getRoomID() {
		return roomID;
	}

	public void setRoomID(JRoom roomID) {
		this.roomID = roomID;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public JUser getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(JUser createdBy) {
		this.createdBy = createdBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public JUser getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(JUser modifiedBy) {
		this.modifiedBy = modifiedBy;
	}


}
