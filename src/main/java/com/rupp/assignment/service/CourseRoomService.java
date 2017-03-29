package com.rupp.assignment.service;

import com.rupp.assignment.dao.CourseRoomDao;
import com.rupp.assignment.json.JCourseRoom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class CourseRoomService {
    @Autowired
    private CourseRoomDao dao;

    public Collection<JCourseRoom> getAll() {
        Collection<JCourseRoom> dList= dao.getAll();
        return dList;
    }

    public Collection<JCourseRoom> getByCourseID(int courseID){
        Collection<JCourseRoom> dList = dao.getByCourseID(courseID);
        return dList;
    }

    public Collection<JCourseRoom> getByRoomID(int roomID){
        Collection<JCourseRoom> dList = dao.getByRoomID(roomID);
        return dList;
    }

    public void create(JCourseRoom jCourseRoom) {
        dao.add(jCourseRoom);
    }

}
