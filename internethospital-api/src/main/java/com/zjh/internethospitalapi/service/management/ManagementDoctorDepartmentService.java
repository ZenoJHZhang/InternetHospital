package com.zjh.internethospitalapi.service.management;

import com.zjh.internethospitalapi.entity.Department;
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
     * @return 医生列表
     */
    List<Doctor> listDoctorByDepartmentId(Integer departmentId);


    /**
     * 更新医生所加入的科室
     * 先删再更，因此适用于所有的医生所属科室操作
     * @param doctorId  医生id
     * @param departmentList 科室列表
     */
    void updateDoctorDepartment(Integer doctorId,List<Department> departmentList);
}
