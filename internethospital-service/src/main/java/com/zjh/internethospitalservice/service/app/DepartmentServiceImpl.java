package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.service.app.DepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

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

    private final DepartmentMapper departmentMapper;

    @Autowired
    public DepartmentServiceImpl(DepartmentMapper departmentMapper) {
        this.departmentMapper = departmentMapper;
    }

    @Override
    public PageInfo<JSONObject> listDepartmentScheduleOfDay(String date,String timeInterval, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<JSONObject> departmentList = departmentMapper.listDepartmentScheduleOfDay(date,timeInterval);
        for (JSONObject o:departmentList
             ) {
            JsonUtil.convert(o);
            generateImgPath(o);
        }
        return new PageInfo<>(departmentList);
    }

    @Override
    public List<Department> listExpertDepartment() {
        Example example = new Example(Department.class);
        example.createCriteria().andEqualTo("deptType",1);
        return departmentMapper.selectByExample(example);
    }

    private void generateImgPath(JSONObject o){
        StringBuilder imgPath = new StringBuilder();
        imgPath
                .append(o.get("imgUuid"))
                .append(".").append(o.get("suffix"));
        o.put("imgPath",imgPath);
    }
}
