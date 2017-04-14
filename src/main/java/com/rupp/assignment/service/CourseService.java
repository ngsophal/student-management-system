package com.rupp.assignment.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rupp.assignment.dao.CourseDao;
import com.rupp.assignment.dao.RoomDao;
import com.rupp.assignment.json.JCourse;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JRoom;
import com.rupp.assignment.json.JUser;

@Service
public class CourseService {
    @Autowired
    private CourseDao dao;
    @Autowired
    private RoomDao roomDao;
    
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;

    public Collection<JCourse> getAll() {
        Collection<JCourse> dList= dao.getAll();
        return dList;
    }
    
    public Collection<JRoom> getRoomsByCourseId(int courseId) {
        Collection<JRoom> dList= roomDao.findByCourseId(courseId);
        return dList;
    }
    
    public JCourse getDetails(int id) {
        return dao.findById(id);
    }

    public JMessage create(JCourse jCourse) {
        try
        {
            jCourse.setCreatedDate(new Date());
            jCourse.setCreatedById(this.user.getId());
            dao.add(jCourse);
            this.message.setMessage("Course has been inserted successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Insert Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }
    }

    public JMessage update(int id, JCourse jCourse) {
        try
        {
            jCourse.setModifiedDate(new Date());
            jCourse.setModifiedById(this.user.getId());
            jCourse.setId(id);
            dao.update(jCourse);
            this.message.setMessage("Course has been updated successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Update Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }

    }

    public JMessage remove(int id){
        try
        {
            JCourse jCourse = new JCourse();
            jCourse.setModifiedDate(new Date());
            jCourse.setModifiedById(this.user.getId());
            jCourse.setId(id);
            dao.remove(jCourse);
            this.message.setMessage("Course has been removed successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Remove Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }
    }
}
