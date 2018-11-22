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
        List<JSONObject> departmentList = departmentMapper.listDepartmentScheduleOfDay(date);
        for (JSONObject o:departmentList
             ) {
            generateDepartmentTime(o);
            generateImgPath(o);
        }
        pageInfo.setList(departmentList);
        return pageInfo;
    }

    private JSONObject generateDepartmentTime(JSONObject o){
        boolean morningHasFlag = false;
        boolean afternoonHasFlag = false;
        boolean nightHasFlag = false;
        if (o.get("morning_has").equals("1")){
            morningHasFlag = true;
        }
        if (o.get("afternoon_has").equals("1")){
            afternoonHasFlag = true;
        }
        if (o.get("night_has").equals("1")){
            nightHasFlag = true;
        }
        if (morningHasFlag){
            if (afternoonHasFlag & !nightHasFlag){
                o.put("time_message","上午/下午");
            }
            if (nightHasFlag & !afternoonHasFlag){
                o.put("time_message","上午/晚上");
            }
            if(afternoonHasFlag & nightHasFlag){
                o.put("time_message","全天");
            }
            if (!afternoonHasFlag & !nightHasFlag ){
                o.put("time_message","早上");
            }
        }
        if(afternoonHasFlag){
            if (!nightHasFlag & !morningHasFlag){
                o.put("time_message","下午");
            }
            if (!morningHasFlag & nightHasFlag){
                o.put("time_message","下午/晚上");
            }
        }
        if (nightHasFlag & !morningHasFlag & !afternoonHasFlag){
            o.put("time_message","晚上");
        }
        if (!morningHasFlag & !afternoonHasFlag & !nightHasFlag){
            o.put("time_message","");
        }
        return o;
    }

    private JSONObject generateImgPath(JSONObject o){
        StringBuilder imgPath = new StringBuilder();
        imgPath
                .append(o.get("img_uuid").toString())
                .append(".").append(o.get("suffix").toString());
        o.put("img_path",imgPath);
        return o;
    }
}
