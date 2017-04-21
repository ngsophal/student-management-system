package com.rupp.assignment.service;

import com.rupp.assignment.dao.ReportStudentEnrollmentDao;
import com.rupp.assignment.json.JReportStudentEnrollment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.Collection;

@Service
public class ReportStudentEnrollmentService {
    @Autowired
    private ReportStudentEnrollmentDao dao;

    public Collection<JReportStudentEnrollment> getStudentEnrollmentReport(Date fromDate, Date toDate) {
        Collection<JReportStudentEnrollment> dList= dao.getStudentEnrollmentReport(fromDate, toDate);
        return dList;
    }

}






