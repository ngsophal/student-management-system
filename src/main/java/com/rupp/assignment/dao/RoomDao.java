package com.rupp.assignment.dao;

import java.util.Collection;

import com.rupp.assignment.json.JRoom;


public interface RoomDao extends Dao<JRoom> {
	 public Collection<JRoom> findByCourseId(int courseId) ;
}
