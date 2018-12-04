package com.zjh.internethospitalapi.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Department;

import java.util.Date;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/20 11:07
 */
public interface DepartmentService {

    /**
     * 分页获取当日普通科室排班及科室信息
     * @param date
     * @param timeInterval
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<JSONObject> listDepartmentScheduleOfDay(String date, String timeInterval,Integer pageNo, Integer pageSize);

    /**
     * 获取所有的专家科室
     * @return
     */
    List<Department> listExpertDepartment();
}
