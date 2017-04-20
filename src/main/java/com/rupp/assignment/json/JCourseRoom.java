package com.rupp.assignment.json;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JCourseRoom", description="JSON Model for showing rooms which belong to course")
public class JCourseRoom extends JCommon{

    private JCourse course;
	private JRoom room;
    @ApiModelProperty( value = "Course ID", required = true ) 
	private int courseId;
    @ApiModelProperty( value = "Room ID", required = true ) 
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
