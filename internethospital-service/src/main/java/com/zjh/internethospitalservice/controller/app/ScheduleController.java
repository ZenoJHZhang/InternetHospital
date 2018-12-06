package com.zjh.internethospitalservice.controller.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * 排班
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/26 10:24
 */
@RestController
@RequestMapping("/schedule")
@Api(tags = "排班相关API")
public class ScheduleController {
    @Autowired
    ScheduleDoctorService scheduleDoctorService;

    @ApiOperation(value = "获取当日，该时段，此诊室医生的排班信息")
    @GetMapping("/listExpertDoctor")
    public ResponseEntity<ApiResponse> listExpertDoctor(
            @RequestParam @ApiParam(required = true,value = "诊室名") String departmentName,
            @RequestParam @ApiParam(required = true,value = "排班日期") String scheduleTime,
            @RequestParam @ApiParam(required = true,value = "排班时段") String timeInterval,
            @RequestParam @ApiParam(value = "页码",required = true,example = "1") Integer pageNo,
            @RequestParam @ApiParam(value = "页容量",required = true,example = "8") Integer pageSize){
        PageInfo<ScheduleDoctor> pageInfo = scheduleDoctorService.listExpertDoctor(departmentName, scheduleTime, timeInterval, pageSize, pageNo);
        return ApiResponse.successResponse(pageInfo);
    }
}
