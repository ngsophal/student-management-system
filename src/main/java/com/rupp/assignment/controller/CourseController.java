package com.rupp.assignment.controller;

import com.rupp.assignment.json.JCourse;
import com.rupp.assignment.json.JMessage;
import com.rupp.assignment.json.JRoom;

import io.swagger.annotations.ApiOperation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;


@Controller
@RequestMapping(value = {"course", "courses" })
public class CourseController {

    private static final Logger LOG = LoggerFactory.getLogger(CourseController.class);

    @Autowired
    private com.rupp.assignment.service.CourseService service;


    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get all courses", notes = "Get all courses", response = JCourse.class, responseContainer = "List")
    public Collection<JCourse> getAll(HttpServletRequest request, WebRequest webRequest) {

        return service.getAll();
    }
    
    @RequestMapping(value = "v1/{courseId}/rooms", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get rooms by course id", notes = "Get rooms by course id", response = JRoom.class, responseContainer = "List")
    public Collection<JRoom> getRoomsByCourseId(HttpServletRequest request, @PathVariable int courseId) {
        return service.getRoomsByCourseId(courseId);
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get course by id", notes = "Get course by id", response = JCourse.class)
    public JCourse getDetails(HttpServletRequest request, @PathVariable int id) {
        return service.getDetails(id);
    }

    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Create course", notes = "Create course", response = JMessage.class)
    public JMessage create(HttpServletRequest request, @ModelAttribute JCourse domain) {
        return service.create(domain);
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Update course", notes = "Update course", response = JMessage.class)
    public JMessage update(HttpServletRequest request, @PathVariable int id, @ModelAttribute JCourse domain) {
        return service.update(id, domain);
    }

    @RequestMapping(value = "v1/remove", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value="Remove course", notes = "Remove course", response = JMessage.class)
    public JMessage remove(HttpServletRequest request) {
        return service.remove(Integer.parseInt(request.getParameter("id")));
    }
    
}
