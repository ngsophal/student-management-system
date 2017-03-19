package com.rupp.assignment.json;

import java.sql.Date;

public class JUser extends JCommon  {
    /** Unique id for this Entity in the database */
    private String username;
    private String password;
    private String fullname;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
   
}
