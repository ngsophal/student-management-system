package com.rupp.assignment.dao;

import com.rupp.assignment.json.JCourseRoom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseRoomDao {

    void add(JCourseRoom domain);

    void removeAllCourseID(@Param("courseID") int courseID);

    void removeAllRoomID(@Param("roomID") int roomID);

    void removeCourseIDRoomID(@Param("courseID") int courseID, @Param("roomID") int roomID);

    List<JCourseRoom> getByCourseID(@Param("courseID") int courseID);

    List<JCourseRoom> getByRoomID(@Param("roomID") int roomID);

    List<JCourseRoom> getAll();

    List<JCourseRoom> getPage(@Param("limit") int limit, @Param("offset") int offset);

    int count();


}
