package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.Constants;
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

    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public PageInfo<JSONObject> listDepartmentScheduleOfDay(String date, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<JSONObject> departmentList = departmentMapper.listDepartmentScheduleOfDay(date);
        for (JSONObject o:departmentList
             ) {
            JsonUtil.convert(o);
            generateDepartmentTime(o);
            generateImgPath(o);
        }
        PageInfo<JSONObject> pageInfo = new PageInfo<>(departmentList);
        return pageInfo;
    }

    @Override
    public List<Department> listExpertDepartment() {
        Example example = new Example(Department.class);
        example.createCriteria().andEqualTo("deptType",1);
        return departmentMapper.selectByExample(example);
    }

    private JSONObject generateDepartmentTime(JSONObject o){
        boolean morningHasFlag = false;
        boolean afternoonHasFlag = false;
        boolean nightHasFlag = false;
        if (Constants.IS_Ture.equals(o.get(Constants.MORNING_HAS))){
            morningHasFlag = true;
        }
        if (Constants.IS_Ture.equals(o.get(Constants.AFTERNOON_HAS))){
            afternoonHasFlag = true;
        }
        if (Constants.IS_Ture.equals(o.get(Constants.NIGHT_HAS))){
            nightHasFlag = true;
        }
        if (morningHasFlag){
            if (afternoonHasFlag & !nightHasFlag){
                o.put("timeMessage","上午/下午");
            }
            if (nightHasFlag & !afternoonHasFlag){
                o.put("timeMessage","上午/晚上");
            }
            if(afternoonHasFlag & nightHasFlag){
                o.put("timeMessage","全天");
            }
            if (!afternoonHasFlag & !nightHasFlag ){
                o.put("timeMessage","早上");
            }
        }
        if(afternoonHasFlag){
            if (!nightHasFlag & !morningHasFlag){
                o.put("timeMessage","下午");
            }
            if (!morningHasFlag & nightHasFlag){
                o.put("timeMessage","下午/晚上");
            }
        }
        if (nightHasFlag & !morningHasFlag & !afternoonHasFlag){
            o.put("timeMessage","晚上");
        }
        if (!morningHasFlag & !afternoonHasFlag & !nightHasFlag){
            o.put("timeMessage","");
        }
        return o;
    }

    private JSONObject generateImgPath(JSONObject o){
        StringBuilder imgPath = new StringBuilder();
        imgPath
                .append(o.get("imgUuid"))
                .append(".").append(o.get("suffix"));
        o.put("imgPath",imgPath);
        return o;
    }
}
