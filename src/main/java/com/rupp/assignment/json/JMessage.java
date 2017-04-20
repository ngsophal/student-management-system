package com.rupp.assignment.json;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="JMessage", description="JSON Model for showing returning message after an operation")
public class JMessage {
	
    @ApiModelProperty(value = "Message status", required = true ) 
	private MessageType status; 
    @ApiModelProperty(value = "Message content", required = true ) 
	private String message;
    @ApiModelProperty( value = "Last insert id", required = false ) 
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
