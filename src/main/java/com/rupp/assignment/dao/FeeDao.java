package com.rupp.assignment.dao;

import com.rupp.assignment.json.JFee;
import org.apache.ibatis.annotations.Param;


public interface FeeDao extends Dao<JFee> {
    Integer getFee(@Param("erollmentid") int erollmentid, @Param("feetypeid") int feetypeid);
    Integer getExistFee(@Param("feetypeid") int erollmentid, @Param("courseid") int feetypeid);
}
