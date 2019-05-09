package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.dto.ScheduleDepartmentDto;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;

import java.util.List;

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
     *
     * @param departmentId 科室id
     * @param timeInterval 排班时段
     * @param scheduleTime 排班时间
     * @param totalNumber  总号源数
     * @return 科室排班id
     */
    Integer insertScheduleDepartment(Integer departmentId, String timeInterval, String scheduleTime, Integer totalNumber);

    /**
     * 更新科室排班的时段和号源
     *
     * @param scheduleDepartmentId 科室排班id
     * @param timeInterval         排班时段
     * @param totalNumber          总号源数
     */
    void updateScheduleDepartment(Integer scheduleDepartmentId, String timeInterval, Integer totalNumber);

    /**
     * 通过科室id以及排班时间获取科室排班
     *
     * @param departmentId 科室id
     * @param scheduleTime 排班时间
     * @return 科室排班
     */
    ScheduleDepartment getScheduleDepartmentByDepartmentIdAndScheduleTime(Integer departmentId, String scheduleTime);

    /**
     * 通过科室id、排班时间，获取当天对应排班
     * 返回值 区分排班时段
     *
     * @param departmentId 科室id
     * @param scheduleTime 排班时间
     * @return 科室排班列表
     */
    List<ScheduleDepartmentDto> listScheduleDepartmentOfScheduleTime(
            Integer departmentId, String scheduleTime);

    /**
     * 通过科室排班id以及时段删除对应时段科室排班
     * 若三个时段都没有排班，则删除该排班
     *
     * @param scheduleDepartmentId 科室排班id
     *
     * @return 对应科室id
     */
    Integer deleteScheduleDepartmentByIdWithTimeInterval(Integer scheduleDepartmentId,String timeInterval);

    /**
     * 开始实行科室排班，并且不可操作（自动用，三个时段都开始）
     */
    void setScheduleDepartmentStart();

    /**
     * 结束今日科室排班
     */
    void setScheduleDepartmentEnd();
}
