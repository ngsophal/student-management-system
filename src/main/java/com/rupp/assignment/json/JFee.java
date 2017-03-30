package com.rupp.assignment.json;

public class JFee extends JCommon {
	private JFeeType feeTypeID;
	private JCourse courseID;
	private double fee;

	public JFeeType getFeeTypeID() {
		return feeTypeID;
	}

	public void setFeeTypeID(JFeeType feeTypeID) {
		this.feeTypeID = feeTypeID;
	}

	public JCourse getCourseID() {
		return courseID;
	}

	public void setCourseID(JCourse courseID) {
		this.courseID = courseID;
	}

	public double getFee() {
		return fee;
	}

	public void setFee(double fee) {
		this.fee = fee;
	}
}
