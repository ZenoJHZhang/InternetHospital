package com.zjh.internethospitalapi.service.management;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/25 15:08
 */
public interface ManagementScheduleDoctorService {

    /**
     * 新增普通医生排班
     * @param scheduleDepartmentId 科室排班id
     * @param departmentId 科室id
     * @param doctorId 医生id
     * @param timeInterval 排班时段
     * @param scheduleTime 排班时间
     * @param totalNumber 总号源数
     */
    Integer insertNormalScheduleDoctor(Integer scheduleDepartmentId,Integer departmentId,Integer doctorId,
                                    String timeInterval,String scheduleTime,Integer totalNumber);
}
