package com.zjh.internethospitalapi.service.management;

import com.zjh.internethospitalapi.entity.Doctor;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/2 15:52
 */
public interface ManagementDoctorDepartmentService {
    /**
     * 通过科室id获取对应医生列表
     * @param departmentId  科室id
     * @return
     */
    List<Doctor> listDoctorByDepartmentId(Integer departmentId);

    /**
     * 将医生加入一个或多个科室内
     * @param doctorId
     * @param departmentId
     */
    void addDoctorIntoDepartment(Integer doctorId,Integer departmentId);
}
