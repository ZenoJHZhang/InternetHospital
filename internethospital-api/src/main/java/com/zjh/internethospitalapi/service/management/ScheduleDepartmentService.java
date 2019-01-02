package com.zjh.internethospitalapi.service.management;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/2 15:22
 */
public interface ScheduleDepartmentService {

    /**
     * 添加门诊排班
     * @param departmentId 门诊id
     * @param timeInterval 时段
     * @param totalNumber  安排的号源总数
     * @param scheduleTime 排班时间
     */
    void insertScheduleDepartment(Integer departmentId, String timeInterval, Integer totalNumber, String scheduleTime);

}
