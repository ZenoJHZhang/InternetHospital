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
     */
    Integer insertScheduleDepartment(Integer departmentId,String timeInterval,String scheduleTime,Integer totalNumber);

    ScheduleDepartment getScheduleDepartmentByDepartmentIdAndScheduleTime(Integer departmentId,String scheduleTime);
}
