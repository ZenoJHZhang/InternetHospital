package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.DoctorDepartment;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.service.management.ScheduleDepartmentService;
import com.zjh.internethospitalservice.mapper.DoctorDepartmentMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/2 15:36
 */
public class ScheduleDepartmentServiceImpl implements ScheduleDepartmentService {
    @Autowired
    private ScheduleDepartmentMapper scheduleDepartmentMapper;
    private DoctorDepartmentMapper doctorDepartmentMapper;
    @Override
    public void insertScheduleDepartment(Integer departmentId, String timeInterval, Integer totalNumber, String scheduleTime) {
        ScheduleDepartment scheduleDepartment = new ScheduleDepartment();

        DoctorDepartment doctorDepartment = new DoctorDepartment();
        doctorDepartment.setDepartmentId(departmentId);
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.select(doctorDepartment);
        List<Doctor> doctorList = new ArrayList<>();
        scheduleDepartment.setDepartmentId(departmentId);
        if(timeInterval.equals(Constants.MORNING)){
            scheduleDepartment.setMorningHas("1");
        }
        else if(timeInterval.equals(Constants.AFTERNOON)){

        }
        else{

        }
    }
}
