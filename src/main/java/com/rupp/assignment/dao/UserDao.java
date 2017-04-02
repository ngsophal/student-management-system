package com.rupp.assignment.dao;

import com.rupp.assignment.json.JUser;


public interface UserDao extends Dao<JUser> {
	 void changePassword(JUser domain);
	 JUser findByUsername(String username);
}
