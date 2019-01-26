package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;

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
     *
     * @param scheduleDepartmentId 科室排班id
     * @param departmentId         科室id
     * @param doctorId             医生id
     * @param timeInterval         排班时段
     * @param scheduleTime         排班时间
     * @param totalNumber          总号源数
     * @return 医生排班id
     */
    Integer insertNormalScheduleDoctor(Integer scheduleDepartmentId, Integer departmentId, Integer doctorId,
                                       String timeInterval, String scheduleTime, Integer totalNumber);

    /**
     * 更新普通医生排班
     *
     * @param scheduleDepartmentId 科室排班id
     * @param timeInterval         排班时段
     * @param totalNumber          总号源数
     */
    void updateNormalScheduleDoctor(Integer scheduleDepartmentId, String timeInterval, Integer totalNumber);


    /**
     * 新增专家医生排班
     *
     * @param departmentId 科室id
     * @param doctorId     医生id
     * @param timeInterval 排班时段
     * @param scheduleTime 排班时间
     * @param totalNumber  总号源数
     * @return 医生排班id
     */
    Integer insertExpertScheduleDoctor(Integer departmentId, Integer doctorId,
                                       String timeInterval, String scheduleTime, Integer totalNumber);

    /**
     * 更新专家医生排班
     * @param scheduleDoctorId 医生排班id
     * @param timeInterval  排班时段
     * @param totalNumber 总号源数
     */
    void updateExpertScheduleDoctor(Integer scheduleDoctorId, String timeInterval, Integer totalNumber);

    /**
     * 根据医生id、排班时间以及医生排班类型获取医生排班
     *
     * @param doctorId     医生id
     * @param scheduleTime 排班时间
     * @param type         排班类型
     * @return 医生排班id
     */
    ScheduleDoctor getScheduleDoctorByDoctorIdAndScheduleTimeAndType(Integer doctorId, String scheduleTime, Integer type);

    /**
     * 通过医生排班id删除医生排班
     * @param scheduleDoctorId 医生排班id
     */
    void deleteScheduleDoctorById(Integer scheduleDoctorId);

    /**
     * 通过科室排班id删除医生排班
     * @param scheduleDepartmentId 科室排班id
     * @return 删除的医生排班数量
     */
    Integer deleteScheduleDoctorByScheduleDepartmentId(Integer scheduleDepartmentId);

    /**
     * 通过科室id，排班时间，排班时段分页获取医生排班
     * @param departmentId 科室id
     * @param scheduleTime 医生排班时间
     * @param timeInterval 医生排班时段
     * @param type 医生排班类型
     * @param pageNumber 页码
     * @param pageSize 页容量
     * @return 医生排班页表
     */
    PageInfo<ScheduleDoctor> listScheduleDoctorOfTimeInterval(
            Integer departmentId,String scheduleTime,String timeInterval,Integer type,Integer pageNumber,Integer pageSize);

    /**
     * 通过科室排班id获取医生排班数量
     *
     * @param scheduleDepartmentId 科室排班id
     * @return 医生排班数量
     */
    Integer countScheduleDoctorByScheduleDepartment(Integer scheduleDepartmentId);
}
