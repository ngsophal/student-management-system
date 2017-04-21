package com.rupp.assignment.json;

import java.sql.Date;

public class JPayment extends JCommon  {	
	
    private int enrollmentId;
    private JEnrollment enrollment;
    
    private double paymentAmount;
    private Date paymentDate;
    private int discount;
    
	private int feeTypeId;
	private JFeeType feeType;
	
	public int getEnrollmentId() {
		return enrollmentId;
	}
	public void setEnrollmentId(int enrollmentId) {
		this.enrollmentId = enrollmentId;
	}
	public JEnrollment getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(JEnrollment enrollment) {
		this.enrollment = enrollment;
	}
	public double getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getFeeTypeId() {
		return feeTypeId;
	}
	public void setFeeTypeId(int feeTypeId) {
		this.feeTypeId = feeTypeId;
	}
	public JFeeType getFeeType() {
		return feeType;
	}
	public void setFeeType(JFeeType feeType) {
		this.feeType = feeType;
	}
	public String getAction(){
		return "<button type='button'  data-id='" + this.getId() + "' class='btn btn-primary m-r-5  waves-effect print'>Print</button>" +
				"<button type='button'  data-id='" + this.getId() + "' class='btn btn-danger m-r-5  waves-effect delete'>Delete</button>";
	}
	
   
	
   
}
