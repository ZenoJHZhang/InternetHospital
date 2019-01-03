package com.zjh.internethospitalapi.service.management;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/3 09:23
 */
public interface ManagementScheduleDoctorService {

    /**
     *  添加医生排班
     *
     * @param scheduleDepartmentId  科室排班id
     * @param departmentId  科室id
     * @param departmentName    科室名
     * @param doctorId  医生id
     * @param doctorName    医生姓名
     * @param scheduleTime  预约时间
     * @param timeInterval 时段
     * @param totalNumber   该时段总号源数
     */
    void insertScheduleDoctor(Integer scheduleDepartmentId,Integer departmentId,
                              String departmentName,Integer doctorId,String doctorName,
                              String scheduleTime,String timeInterval,Integer totalNumber);

}
