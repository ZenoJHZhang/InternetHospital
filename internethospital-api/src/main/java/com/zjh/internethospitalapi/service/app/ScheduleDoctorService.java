package com.zjh.internethospitalapi.service.app;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/20 11:46
 */
public interface ScheduleDoctorService {
    /**
     * 获取当日，该时段科室内排班的专家
     * @param departmentName 科室名
     * @param scheduleTime 排班日期
     * @param timeInterval 排班时段
     * @param pageSize
     * @param pageNo
     * @return
     */
    PageInfo<ScheduleDoctor> listExpertDoctor(String departmentName, String scheduleTime, String timeInterval, Integer pageSize, Integer pageNo);
}
