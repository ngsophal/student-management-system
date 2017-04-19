package com.rupp.assignment.json;

import java.sql.Date;

import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiParam;

public class JCourse extends JCommon {

	@ApiParam(hidden=true, required=false)
	private JGrade grade;
	@ApiParam(hidden=true, required=false)
	private JSession session;
	
    @ApiModelProperty( value = "Course start date", required = true ) 
	private Date startDate;
    @ApiModelProperty( value = "Course end date", required = true ) 
	private Date endDate;
    @ApiModelProperty( value = "Grade id", required = true ) 
	private int gradeId;
    @ApiModelProperty( value = "session id", required = true ) 
	private int sessionId;
	@ApiParam(hidden=true, required=false)
	private String name;
	
	

	public String getName() {
		return grade.getName() + " - " + session.getName();
	}


	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public int getSessionId() {
		return sessionId;
	}

	public void setSessionId(int sessionId) {
		this.sessionId = sessionId;
	}

	public JGrade getGrade() {
		return grade;
	}

	public void setGrade(JGrade grade) {
		this.grade = grade;
	}

	public JSession getSession() {
		return session;
	}

	public void setSession(JSession session) {
		this.session = session;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
