package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalapi.service.app.DepartmentService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/20 13:37
 */
@RestController
@RequestMapping(value = "/department")
@Api(tags = "诊室API")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @GetMapping("/scheduleOfDay")
    @ApiOperation(value = "获取当日诊室信息及其排班信息")
    public ResponseEntity<ApiResponse> listDepartmentScheduleOfDay(
            @RequestParam @ApiParam(required = true,value = "日期格式 2018-11-20") String date,
            @RequestParam @ApiParam(value = "页码",required = true,example = "1") Integer pageNo,
            @RequestParam @ApiParam(value = "页容量",required = true,example = "5") Integer pageSize){
        return ApiResponse.successResponse(departmentService.listDepartmentScheduleOfDay(date,pageNo,pageSize));
    }

    @GetMapping("/listExpertDepartment")
    @ApiOperation(value = "获取所有的专家科室")
    public ResponseEntity<ApiResponse> listExpertDepartment(){
        return ApiResponse.successResponse(departmentService.listExpertDepartment());
    }

}
