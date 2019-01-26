package com.zjh.internethospitalapi.service.management;

import com.zjh.internethospitalapi.entity.ScheduleDepartment;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/25 14:41
 */
public interface ManagementScheduleDepartmentService {
    /**
     * 新增科室排班
     * @param departmentId 科室id
     * @param timeInterval 排班时段
     * @param scheduleTime 排班时间
     * @param totalNumber 总号源数
     * @return 科室排班id
     */
    Integer insertScheduleDepartment(Integer departmentId,String timeInterval,String scheduleTime,Integer totalNumber);

    /**
     * 更新科室排班的时段和号源
     * @param scheduleDepartmentId 科室排班id
     * @param timeInterval 排班时段
     * @param totalNumber 总号源数
     */
    void updateScheduleDepartment(Integer scheduleDepartmentId,String timeInterval,Integer totalNumber);



    ScheduleDepartment getScheduleDepartmentByDepartmentIdAndScheduleTime(Integer departmentId,String scheduleTime);
}
