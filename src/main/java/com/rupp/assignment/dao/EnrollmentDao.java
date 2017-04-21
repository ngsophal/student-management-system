package com.rupp.assignment.dao;
import org.apache.ibatis.annotations.Param;

import com.rupp.assignment.json.JEnrollment;

public interface EnrollmentDao extends Dao<JEnrollment> {
    Integer count(@Param("search") String search);

	JEnrollment findEnrolledCourse(@Param("studentId") int studentId, @Param("courseId") int courseId);
	JEnrollment findEnrolledCourseExcludeEnrollment(@Param("studentId") int studentId, @Param("courseId") int courseId, @Param("enrollmentId") int enrollmentId );
}
