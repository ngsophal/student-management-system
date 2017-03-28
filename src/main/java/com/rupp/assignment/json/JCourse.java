package com.rupp.assignment.json;

import java.sql.Date;

public class JCourse extends JCommon {

    private JGrade gradeId;
	private JSession sessionId;

	private Date startDate;
	private Date endDate;

	public JGrade getGradeId() {
		return gradeId;
	}

	public void setGradeId(JGrade gradeId) {
		this.gradeId = gradeId;
	}

	public JSession getSessionId() {
		return sessionId;
	}

	public void setSessionId(JSession sessionId) {
		this.sessionId = sessionId;
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
