package com.rupp.assignment.json;

import java.sql.Date;

public class JCourse extends JCommon {

    private JGrade grade;
	private JSession session;

	private Date startDate;
	private Date endDate;

	private int gradeId;
	private int sessionId;

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
