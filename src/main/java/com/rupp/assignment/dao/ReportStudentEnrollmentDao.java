package com.rupp.assignment.dao;

import com.rupp.assignment.json.JReportStudentEnrollment;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

public interface ReportStudentEnrollmentDao {
    List<JReportStudentEnrollment> getStudentEnrollmentReport(@Param("fromDate") Date fromDate,@Param("toDate") Date toDate);
}