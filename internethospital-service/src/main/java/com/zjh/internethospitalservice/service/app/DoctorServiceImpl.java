package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.service.app.DoctorService;
import org.springframework.stereotype.Service;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 17:00
 */
@Service("doctorService")
public class DoctorServiceImpl implements DoctorService {
    @Override
    public PageInfo<JSONObject> listExpertDoctor(Integer departmentId, String scheduleTime, String scheduleDate) {
        return null;
    }
}
