package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.service.app.DepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/20 11:26
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;
    @Override
    public PageInfo<JSONObject> listDepartmentScheduleOfDay(String date, Integer pageNo, Integer pageSize) {
        PageInfo pageInfo = new PageInfo();
        List<JSONObject> departmentList = departmentMapper.listDepartmentScheduleOfDay("2018-11-20");
        pageInfo.setList(departmentList);
        return pageInfo;
    }
}
