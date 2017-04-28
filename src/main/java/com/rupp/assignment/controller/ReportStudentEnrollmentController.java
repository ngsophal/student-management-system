package com.rupp.assignment.controller;


import com.rupp.assignment.json.JReportStudentEnrollment;

import io.swagger.annotations.ApiOperation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.Collection;


@Controller
@RequestMapping(value = {"enrollment_report", "enrollment_reports" })
public class ReportStudentEnrollmentController {

    private static final Logger LOG = LoggerFactory.getLogger(ReportStudentEnrollmentController.class);

    @Autowired
    private com.rupp.assignment.service.ReportStudentEnrollmentService service;

    @RequestMapping(value = "v1/{fromDate}/{toDate}", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value="Get student enrollment report", notes = "Get student enrollment report", responseContainer = "List")
    public Collection<JReportStudentEnrollment> getStudentEnrollmentReport(HttpServletRequest request, @PathVariable Date fromDate, @PathVariable Date toDate) {
        return service.getStudentEnrollmentReport(fromDate, toDate);
    }

}