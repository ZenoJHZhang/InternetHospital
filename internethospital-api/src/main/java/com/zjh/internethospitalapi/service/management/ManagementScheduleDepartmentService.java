package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
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

    /**
     *通过科室id以及排班时间获取科室排班
     * @param departmentId 科室id
     * @param scheduleTime 排班时间
     * @return 科室排班
     */
    ScheduleDepartment getScheduleDepartmentByDepartmentIdAndScheduleTime(Integer departmentId,String scheduleTime);

    /**
     *通过科室id、排班时间、排版时段分页获取对应科室排班列表
     * @param departmentId 科室id
     * @param scheduleTime 排班时间
     * @param timeInterval 排班时段
     * @param pageNumber 页码
     * @param pageSize 页容量
     * @return 科室排班页表
     */
    PageInfo<ScheduleDepartment> listScheduleDepartmentOfTimeInterval(
            Integer departmentId, String scheduleTime, String timeInterval,Integer pageNumber,Integer pageSize);

    /**
     * 通过科室排班id删除科室排班
     * @param scheduleDepartmentId 科室排班id
     */
    void deleteScheduleDepartmentById(Integer scheduleDepartmentId);
}
