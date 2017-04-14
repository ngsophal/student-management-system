package com.rupp.assignment.json;


public class JMessage {
	
	private MessageType status; 
	private String message;
	private int insertedId;
	
	public int getInsertedId() {
		return insertedId;
	}
	public void setInsertedId(int insertedId) {
		this.insertedId = insertedId;
	}
	public JMessage() {
		// TODO Auto-generated constructor stub
	}
	public MessageType getStatus() {
		return status;
	}
	public void setStatus(MessageType status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public enum MessageType {
		  SUCCESS, ERROR
	}
}
