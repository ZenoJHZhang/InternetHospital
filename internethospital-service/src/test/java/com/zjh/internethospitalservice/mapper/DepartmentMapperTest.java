package com.zjh.internethospitalservice.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.util.Date;

import static org.junit.Assert.*;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/20 13:29
 */
public class DepartmentMapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Test
    public void listDepartmentScheduleOfDay() {
        System.out.println(departmentMapper.listDepartmentScheduleOfDay("2018-11-20"));
    }
}