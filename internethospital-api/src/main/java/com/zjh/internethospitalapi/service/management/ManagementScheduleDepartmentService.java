package com.zjh.internethospitalapi.service.management;

import com.zjh.internethospitalapi.entity.ScheduleDepartment;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/2 15:22
 */
public interface ManagementScheduleDepartmentService {

    /**
     * 添加门诊排班
     * @param departmentId 门诊id
     * @param timeInterval 时段
     * @param totalNumber  安排的号源总数
     * @param scheduleTime 排班时间
     * @param type 0 普通 ； 1 专家
     * @return 插入后获取的科室排班id
     */
    Integer insertScheduleDepartment(Integer departmentId, String timeInterval, Integer totalNumber, String scheduleTime,Integer type);

    /**
     * 更新科室排班对应时段的号源总数
     * @param scheduleDepartment 科室排班
     * @param timeInterval 排班时段
     * @param insertTotalNumber 增加的总号源数
     */
    void updateScheduleDepartment(ScheduleDepartment scheduleDepartment, String timeInterval, Integer insertTotalNumber);

    /**
     * 更新科室排班中的排班时段以及对应时段的号源总数
     * @param scheduleDepartment 科室排班
     * @param timeInterval 时段
     * @param totalNumber 对应时刻号源总数
     *
     */
    void updateScheduleDepartmentNumber(ScheduleDepartment scheduleDepartment, String timeInterval, Integer totalNumber);
    /**
     * 普遍性的更新科室排班
     * @param scheduleDepartment 科室排班
     */
    void updateScheduleDepartment(ScheduleDepartment scheduleDepartment);

    /**
     * 根据id删除科室排班
     * @param scheduleDepartmentId 科室排班id
     */
    void deleteScheduleDepartment(Integer scheduleDepartmentId);

    /**
     * 获取当天，此科室排班情况
     * @param departmentId 科室id
     * @param scheduleTime 日期
     * @param type 0 普通 ；1 专家
     * @return
     */
    ScheduleDepartment getScheduleDepartmentByDepartmentIdAndScheduleTimeAndType(Integer departmentId,String scheduleTime,Integer type);
}
