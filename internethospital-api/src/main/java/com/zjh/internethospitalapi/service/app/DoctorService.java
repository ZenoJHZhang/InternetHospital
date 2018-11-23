package com.zjh.internethospitalapi.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 16:57
 */
public interface DoctorService {

    PageInfo<JSONObject> listExpertDoctor(Integer departmentId,String scheduleTime,String scheduleDate);
}
