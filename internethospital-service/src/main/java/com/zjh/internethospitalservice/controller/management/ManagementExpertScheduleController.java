package com.zjh.internethospitalservice.controller.management;

import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
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

    private final ManagementScheduleDepartmentService managementScheduleDepartmentService;
    private final ManagementScheduleDoctorService managementScheduleDoctorService;

    @Autowired
    public ManagementExpertScheduleController(ManagementScheduleDepartmentService managementScheduleDepartmentService,
                                              ManagementScheduleDoctorService managementScheduleDoctorService) {
        this.managementScheduleDepartmentService = managementScheduleDepartmentService;
        this.managementScheduleDoctorService = managementScheduleDoctorService;
    }

    @PostMapping("/insertExpertScheduleDepartment")
    @ApiOperation(value = "添加专家科室排班")
    @RequiresRoles(value = "doctor")
    public ResponseEntity<ApiResponse> insertExpertScheduleDepartment(
            @RequestParam @ApiParam(value = "科室id", required = true, example = "1") Integer departmentId,
            @RequestParam @ApiParam(value = "排班时段", required = true) String timeInterval,
            @RequestParam @ApiParam(value = "排班时间", required = true) String scheduleTime) {
        //专家科室排班号源总数为专家医生总和
        Integer totalNumber = 0;
        Integer scheduleDepartmentId = managementScheduleDepartmentService.
                insertScheduleDepartment(departmentId, timeInterval, totalNumber, scheduleTime, 1);
        return ApiResponse.successResponse(scheduleDepartmentId);
    }


    @PostMapping("/makeExpertScheduleDoctor")
    @ApiOperation(value = "添加/更新专家医生排班")
    @RequiresRoles(value = "doctor")
    @Transactional(rollbackFor = Exception.class)
    public ResponseEntity<ApiResponse> insertExpertScheduleDoctor(
            @RequestParam(required = false) @ApiParam(value = "科室排班id", example = "1") Integer scheduleDepartmentId,
            @RequestParam @ApiParam(value = "科室id", required = true, example = "1") Integer departmentId,
            @RequestParam @ApiParam(value = "医生id", required = true, example = "1") Integer doctorId,
            @RequestParam @ApiParam(value = "排班时段", required = true) String timeInterval,
            @RequestParam @ApiParam(value = "号源总数", example = "1", required = true) Integer totalNumber,
            @RequestParam @ApiParam(value = "排班时间", required = true) String scheduleTime
    ) {
        //科室排班不存在 => 添加科室排班和医生排班
         if (scheduleDepartmentId == null) {
            scheduleDepartmentId = managementScheduleDepartmentService.
                    insertScheduleDepartment(departmentId, timeInterval, 0, scheduleTime, 1);
            managementScheduleDoctorService.insertScheduleDoctor(scheduleDepartmentId, departmentId, doctorId, scheduleTime, timeInterval, totalNumber,1);
            ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
            scheduleDepartment.setId(scheduleDepartmentId);
            managementScheduleDepartmentService.updateScheduleDepartmentNumber(scheduleDepartment, timeInterval, totalNumber);
            return ApiResponse.successResponse("添加专家医生排班成功");
        } else {
            ScheduleDoctor scheduleDoctor = managementScheduleDoctorService.
                    getScheduleDoctorByDoctorIdAndScheduleTimeAndType(doctorId, scheduleTime,1);
            if (scheduleDoctor == null) {
                managementScheduleDoctorService.insertScheduleDoctor
                        (scheduleDepartmentId, departmentId, doctorId, scheduleTime, timeInterval, totalNumber,1);
                ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
                scheduleDepartment.setId(scheduleDepartmentId);
                managementScheduleDepartmentService.updateScheduleDepartmentNumber(scheduleDepartment, timeInterval, totalNumber);
                return ApiResponse.successResponse("添加专家医生排班成功");
            } else {
                ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
                scheduleDepartment.setId(scheduleDepartmentId);
                managementScheduleDepartmentService.
                        updateScheduleDepartmentNumber(scheduleDepartment, timeInterval, totalNumber);
                managementScheduleDoctorService.updateScheduleDoctorWithType(doctorId, scheduleTime, timeInterval, totalNumber,1);
                return ApiResponse.successResponse("更新专家医生排班成功");
            }
        }
    }

    @PostMapping("/deleteExpertScheduleDepartment")
    @ApiOperation(value = "删除专家科室排班")
    @RequiresRoles(value = "doctor")
    public ResponseEntity<ApiResponse> deleteNormalScheduleDepartment(
            @RequestParam @ApiParam(value = "科室排班Id",required = true) Integer scheduleDepartmentId){
        managementScheduleDepartmentService.deleteScheduleDepartmentWithType(scheduleDepartmentId);
        return ApiResponse.successResponse("删除专家科室排班成功");
    }
}
