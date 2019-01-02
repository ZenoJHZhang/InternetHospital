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
public interface DoctorDepartmentService {
    /**
     * 通过科室id获取对应医生列表
     * @param departmentId  科室id
     * @return
     */
    List<Doctor> listDoctorByDepartmentId(Integer departmentId);
}
