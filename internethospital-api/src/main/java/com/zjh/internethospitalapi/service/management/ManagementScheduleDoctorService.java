package com.zjh.internethospitalapi.service.management;

import com.zjh.internethospitalapi.entity.ScheduleDoctor;

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
     * @param doctorId  医生id
     * @param scheduleTime  预约时间
     * @param timeInterval 时段
     * @param totalNumber   该时段总号源数
     */
    void insertScheduleDoctor(Integer scheduleDepartmentId,Integer departmentId, Integer doctorId,
                              String scheduleTime,String timeInterval,Integer totalNumber);

    /**
     *  更新医生排班
     * @param doctorId  医生id
     * @param scheduleTime 排班时间
     *
     * @param timeInterval 排班时段
     * @param totalNumber 时段对应号源总数
     */
    void updateScheduleDoctor(Integer doctorId,String scheduleTime,String timeInterval,Integer totalNumber);

    /**
     * 删除医生排班
     * @param scheduleDoctorId 医生排班id
     */
    void deleteScheduleDepartment(Integer scheduleDoctorId);

    /**
     * 通过医生id和排班时间获取对应的医生排班
     * @param doctorId 医生id
     * @param scheduleTime  排班时间
     * @return
     */
    ScheduleDoctor getScheduleDoctorByDoctorIdAndScheduleTime(Integer doctorId,String scheduleTime);

}
