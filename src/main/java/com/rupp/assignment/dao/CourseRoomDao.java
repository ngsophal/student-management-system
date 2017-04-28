package com.rupp.assignment.dao;

import com.rupp.assignment.json.JCourseRoom;
import org.apache.ibatis.annotations.Param;

public interface CourseRoomDao extends Dao<JCourseRoom>{
    Integer getExistCourseRoom(@Param("courseID") int courseID, @Param("roomID") int roomID);
}
