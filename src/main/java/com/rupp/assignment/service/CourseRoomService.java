package com.rupp.assignment.service;

import com.rupp.assignment.dao.CourseRoomDao;
import com.rupp.assignment.json.JCourseRoom;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Date;

@Service
public class CourseRoomService {
    @Autowired
    private CourseRoomDao dao;
    @Autowired
    private JUser user;
    @Autowired
    private JMessage message;

    public Collection<JCourseRoom> getAll() {
        Collection<JCourseRoom> dList= dao.getAll();
        return dList;
    }

    public JCourseRoom getDetails(int id) {
        return dao.findById(id);
    }

    public JMessage create(JCourseRoom jCourseRoom) {
        try
        {
            jCourseRoom.setCreatedDate(new Date());
            jCourseRoom.setCreatedById(this.user.getId());
            dao.add(jCourseRoom);
            this.message.setMessage("Course Room has been inserted successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Insert Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }
    }

    public JMessage update(int id, JCourseRoom jCourseRoom) {
        //try
        //{
            jCourseRoom.setModifiedDate(new Date());
            jCourseRoom.setModifiedById(this.user.getId());
            jCourseRoom.setId(id);
            dao.update(jCourseRoom);
            this.message.setMessage("Course Room has been updated successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        //}catch (Exception e){
         //   this.message.setMessage("Update Fail!");
          //  this.message.setStatus(JMessage.MessageType.ERROR);
           // return message;
        //}

    }

    public JMessage remove(int id){
        try
        {
            JCourseRoom jCourseRoom = new JCourseRoom();
            jCourseRoom.setModifiedDate(new Date());
            jCourseRoom.setModifiedById(this.user.getId());
            jCourseRoom.setId(id);
            dao.remove(jCourseRoom);
            this.message.setMessage("Course Room has been removed successfully!");
            this.message.setStatus(JMessage.MessageType.SUCCESS);
            return message;
        }catch (Exception e){
            this.message.setMessage("Remove Fail!");
            this.message.setStatus(JMessage.MessageType.ERROR);
            return message;
        }
    }

    public Integer getExistCourseRoom(JCourseRoom courseRoom) {
        Integer valid = 0;
        valid = dao.getExistCourseRoom(courseRoom.getCourseId(), courseRoom.getRoomId());

        if(valid > 0){
            valid = 1;
        }
        return valid;
    }

}
