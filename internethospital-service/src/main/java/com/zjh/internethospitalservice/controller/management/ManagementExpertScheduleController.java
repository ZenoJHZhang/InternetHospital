package com.zjh.internethospitalservice.controller.management;

import com.zjh.internethospitalapi.dto.ExpertScheduleDto;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/16 15:01
 */
@Api(tags = "【后台管理】专家模式排班相关API")
@RestController
@RequestMapping("/managementExpertSchedule")
public class ManagementExpertScheduleController {

    private final ManagementScheduleDoctorService managementScheduleDoctorService;

    @Autowired
    public ManagementExpertScheduleController(ManagementScheduleDoctorService managementScheduleDoctorService) {
        this.managementScheduleDoctorService = managementScheduleDoctorService;
    }

    @PostMapping("/insert")
    @ApiOperation("新增医生就诊排班")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> insert(
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId,
            @ApiParam(value = "医生id", required = true, example = "1") @RequestParam Integer doctorId,
            @ApiParam(value = "排班时间", required = true) @RequestParam String scheduleTime,
            @ApiParam(value = "排班时段", required = true) @RequestParam String timeInterval,
            @ApiParam(value = "总号源数", required = true, example = "1") @RequestParam Integer totalNumber) {
        Integer scheduleDoctorId = managementScheduleDoctorService.
                insertExpertScheduleDoctor(departmentId, doctorId, timeInterval, scheduleTime, totalNumber);
        return ApiResponse.successResponse(scheduleDoctorId);
    }

    @PostMapping("/update")
    @ApiOperation("更新医生就诊排班")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> update(
            @ApiParam(value = "医生排班id", required = true, example = "1") @RequestParam Integer scheduleDoctorId,
            @ApiParam(value = "排班时段", required = true) @RequestParam String timeInterval,
            @ApiParam(value = "总号源数", required = true, example = "1") @RequestParam Integer totalNumber
    ) {
        managementScheduleDoctorService.updateExpertScheduleDoctor(scheduleDoctorId, timeInterval, totalNumber);
        return ApiResponse.successResponse(null);
    }

    @ApiOperation("删除医生排班")
    @PostMapping("/delete")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> delete(
            @ApiParam(value = "医生排班id", required = true, example = "1") @RequestParam Integer scheduleDoctorId,
            @ApiParam(value = "排班时段", required = true) @RequestParam String timeInterval) {
        managementScheduleDoctorService.deleteScheduleDoctorByScheduleDepartmentIdWithTimeInterval(scheduleDoctorId,timeInterval,1,null);
        return ApiResponse.successResponse(null);
    }

    @ApiOperation("获取科室下医生排班列表")
    @PostMapping("/list")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> list(
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId,
            @ApiParam(value = "排班时间", required = true) @RequestParam String scheduleTime,
            @ApiParam(value = "类型", required = true, example = "1") @RequestParam Integer type
            ) {
        ExpertScheduleDto expertScheduleDto =
                managementScheduleDoctorService.listScheduleDoctorByScheduleTimeOfType(departmentId, scheduleTime, type);
        return ApiResponse.successResponse(expertScheduleDto);
    }
}
