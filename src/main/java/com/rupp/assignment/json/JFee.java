package com.rupp.assignment.json;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JFee", description="JSON Model for showing fee of each course")
public class JFee extends JCommon {
	private JFeeType feeType;
	private JCourse course;
    @ApiModelProperty( value = "Fee", required = true ) 
	private double fee;
    @ApiModelProperty( value = "Fee type id", required = true ) 
	private int feeTypeId;
    @ApiModelProperty( value = "Course id", required = true )
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
