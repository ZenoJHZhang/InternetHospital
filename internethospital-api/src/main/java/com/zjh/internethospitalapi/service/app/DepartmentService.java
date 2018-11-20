package com.zjh.internethospitalapi.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

import java.util.Date;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/20 11:07
 */
public interface DepartmentService {

    /**
     * 获取当日普通科室排班及科室信息
     * @param date
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<JSONObject> listDepartmentScheduleOfDay(String date, Integer pageNo, Integer pageSize);

}
