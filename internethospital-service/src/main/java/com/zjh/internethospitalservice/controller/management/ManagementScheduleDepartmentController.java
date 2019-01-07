package com.zjh.internethospitalservice.controller.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.service.management.ManagementDoctorDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/7 10:29
 */
@Api(tags = "【后台管理】排班相关API")
@Controller
public class ManagementScheduleDepartmentController {
    private final ManagementScheduleDepartmentService managementScheduleDepartmentService;
    private final ManagementScheduleDoctorService managementScheduleDoctorService;
    private final ManagementDoctorDepartmentService managementDoctorDepartmentService;

    @Autowired
    public ManagementScheduleDepartmentController(ManagementScheduleDepartmentService managementScheduleDepartmentService,
                                                  ManagementScheduleDoctorService managementScheduleDoctorService, ManagementDoctorDepartmentService managementDoctorDepartmentService) {
        this.managementScheduleDepartmentService = managementScheduleDepartmentService;
        this.managementScheduleDoctorService = managementScheduleDoctorService;
        this.managementDoctorDepartmentService = managementDoctorDepartmentService;
    }

    @ApiOperation(value = "添加普通科室排班")
    @PostMapping("/insertNormalScheduleDepartment")
    public ResponseEntity<ApiResponse> insertNormalScheduleDepartment(
            @RequestParam @ApiParam(value = "科室id", required = true, example = "1") Integer departmentId,
            @RequestParam @ApiParam(value = "排班时段", required = true) String timeInterval,
            @RequestParam @ApiParam(value = "号源总数", example = "1",required = true) Integer totalNumber,
            @RequestParam @ApiParam(value = "排班时间",required = true) String scheduleTime) {
        Integer scheduleDepartmentId = managementScheduleDepartmentService.
                insertScheduleDepartment(departmentId, timeInterval, totalNumber, scheduleTime);
        List<Doctor> doctorList = managementDoctorDepartmentService.listDoctorByDepartmentId(departmentId);
        int size = doctorList.size();
        Integer doctorTotalNumber = totalNumber / size;
        Integer lastDoctorTotalNumber = totalNumber - (size - 1) * doctorTotalNumber;
        for (int i = 0; i < size; i++) {
            Integer averageNumber;
            if (i == (size - 1)) {
                averageNumber = lastDoctorTotalNumber;
            } else {
                averageNumber = doctorTotalNumber;
            }
            Doctor doctor = doctorList.get(i);
            Integer doctorId = doctor.getId();
            managementScheduleDoctorService.insertScheduleDoctor(scheduleDepartmentId, departmentId,
                    doctorId, scheduleTime, timeInterval, averageNumber);
        }
        return ApiResponse.successResponse(null);
    }

    @PostMapping("/insertExpertScheduleDepartment")
    @ApiOperation(value = "添加专家科室排班")
    public ResponseEntity<ApiResponse> insertExpertScheduleDepartment(
            @RequestParam @ApiParam(value = "科室id", required = true, example = "1") Integer departmentId,
            @RequestParam @ApiParam(value = "排班时段", required = true) String timeInterval,
            @RequestParam @ApiParam(value = "排班时间",required = true) String scheduleTime) {
        //专家科室排班号源总数为专家医生总和
        Integer totalNumber = 0;
        Integer scheduleDepartmentId = managementScheduleDepartmentService.
                insertScheduleDepartment(departmentId, timeInterval, totalNumber, scheduleTime);
        return ApiResponse.successResponse(scheduleDepartmentId);
    }

    @PostMapping("/insertExpertScheduleDoctor")
    @ApiOperation(value = "添加专家医生排班")
    public ResponseEntity<ApiResponse> insertExpertScheduleDoctor(
            @RequestParam @ApiParam(value = "科室排班id",required = true,example = "1")Integer scheduleDepartmentId,
            @RequestParam @ApiParam(value = "科室id",required = true,example = "1") Integer departmentId,
            @RequestParam @ApiParam(value = "医生id",required = true,example = "1") Integer doctorId,
            @RequestParam @ApiParam(value = "排班时段", required = true) String timeInterval,
            @RequestParam @ApiParam(value = "号源总数", example = "1",required = true) Integer totalNumber,
            @RequestParam @ApiParam(value = "排班时间",required = true) String scheduleTime
    ) {
        managementScheduleDoctorService.insertScheduleDoctor(scheduleDepartmentId,departmentId,doctorId,scheduleTime,timeInterval,totalNumber);
        ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
        scheduleDepartment.setId(scheduleDepartmentId);
        managementScheduleDepartmentService.updateScheduleDepartment(scheduleDepartment,timeInterval,totalNumber);
        return ApiResponse.successResponse(null);
    }
}
