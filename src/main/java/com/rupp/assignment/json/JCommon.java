package com.rupp.assignment.json;

import java.sql.Date;

public class JCommon  {
    /** Unique id for this Entity in the database */
    protected int id;
    protected Date createdDate;
    protected JUser createdBy;
    protected Date modifiedDate;
    protected JUser modifiedBy;
    protected int status;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
    
	
   
}
