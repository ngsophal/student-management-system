package com.rupp.assignment.controller;

import com.rupp.assignment.json.JCourseRoom;
import com.rupp.assignment.json.JMessage;

import io.swagger.annotations.ApiOperation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.Date;


@Controller
@RequestMapping(value = {"courses_rooms"})
public class CourseRoomController {

    private static final Logger LOG = LoggerFactory.getLogger(CourseRoomController.class);

    @Autowired
    private com.rupp.assignment.service.CourseRoomService service;

  
    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get all course rooms", notes = "Get all courses rooms", response = JCourseRoom.class, responseContainer = "List")
    public Collection<JCourseRoom> getAll(HttpServletRequest request, WebRequest webRequest,
                                          @RequestHeader(required = false, value = "If-Modified-Since") Date since) {

        return service.getAll();
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get course room by id", notes = "Get course rooom by id", response = JCourseRoom.class)
    public JCourseRoom getDetails(HttpServletRequest request, @PathVariable int id) {
        return service.getDetails(id);
    }

    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Create course room", notes = "Create course room", response = JMessage.class)
    public JMessage create(HttpServletRequest request, @ModelAttribute JCourseRoom domain) {
        return service.create(domain);
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Update course room", notes = "Update course room", response = JMessage.class)
    public JMessage update(HttpServletRequest request, @PathVariable int id, @ModelAttribute JCourseRoom domain) {
        return service.update(id, domain);
    }

    @RequestMapping(value = "v1/remove", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Remove course room", notes = "Remove course room", response = JMessage.class)
    public JMessage remove(HttpServletRequest request) {
        return service.remove(Integer.parseInt(request.getParameter("id")));
    }

    
}
