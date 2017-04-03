package com.rupp.assignment.json;

public class JCourseRoom extends JCommon{

    private JCourse course;
	private JRoom room;

	private int courseId;
	private int roomId;

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public JCourse getCourse() {
		return course;
	}

	public void setCourse(JCourse course) {
		this.course = course;
	}

	public JRoom getRoom() {
		return room;
	}

	public void setRoom(JRoom room) {
		this.room = room;
	}



}
