package com.rupp.assignment.json;

public class JFee extends JCommon {
	private JFeeType feeType;
	private JCourse course;
	private double fee;

	private int feeTypeId;
	private int courseId;

	public int getFeeTypeId() {
		return feeTypeId;
	}

	public void setFeeTypeId(int feeTypeId) {
		this.feeTypeId = feeTypeId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public JFeeType getFeeType() {
		return feeType;
	}

	public void setFeeType(JFeeType feeType) {
		this.feeType = feeType;
	}

	public JCourse getCourse() {
		return course;
	}

	public void setCourse(JCourse course) {
		this.course = course;
	}

	public double getFee() {
		return fee;
	}

	public void setFee(double fee) {
		this.fee = fee;
	}
}
