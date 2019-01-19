package com.zjh.internethospitalservice.controller.management;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/7 10:29
 */
@Api(tags = "【后台管理】普通模式排班相关API")
@RestController
public class ManagementNormalScheduleController {
    private final ManagementScheduleDepartmentService managementScheduleDepartmentService;
    private final ManagementScheduleDoctorService managementScheduleDoctorService;
    private final ManagementDoctorDepartmentService managementDoctorDepartmentService;

    @Autowired
    public ManagementNormalScheduleController(ManagementScheduleDepartmentService managementScheduleDepartmentService,
                                              ManagementScheduleDoctorService managementScheduleDoctorService, ManagementDoctorDepartmentService managementDoctorDepartmentService) {
        this.managementScheduleDepartmentService = managementScheduleDepartmentService;
        this.managementScheduleDoctorService = managementScheduleDoctorService;
        this.managementDoctorDepartmentService = managementDoctorDepartmentService;
    }

    @ApiOperation(value = "添加/更新普通科室排班")
    @PostMapping("/makeNormalScheduleDepartment")
    public ResponseEntity<ApiResponse> insertNormalScheduleDepartment(
            @RequestParam @ApiParam(value = "科室id", required = true, example = "1") Integer departmentId,
            @RequestParam @ApiParam(value = "排班时段", required = true) String timeInterval,
            @RequestParam @ApiParam(value = "号源总数", example = "1",required = true) Integer totalNumber,
            @RequestParam @ApiParam(value = "排班时间",required = true) String scheduleTime) {
        ScheduleDepartment scheduleDepartment = managementScheduleDepartmentService.
                getScheduleDepartmentByDepartmentIdAndScheduleTimeAndType(departmentId, scheduleTime,0);
        // true 添加排班 false 更新排班
        boolean insertFlag;
        Integer scheduleDepartmentId ;
        if (scheduleDepartment == null){
            insertFlag = true;
            scheduleDepartmentId = managementScheduleDepartmentService.
                    insertScheduleDepartment(departmentId, timeInterval, totalNumber, scheduleTime,0);
        }
    else {
            insertFlag = false;
            scheduleDepartmentId = scheduleDepartment.getId();
            managementScheduleDepartmentService.updateScheduleDepartmentNumber(scheduleDepartment,timeInterval,totalNumber);
        }
        List<Doctor> doctorList = managementDoctorDepartmentService.listDoctorByDepartmentId(departmentId);
        //平均分配每个医生的号源总数
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
            if(insertFlag){
                managementScheduleDoctorService.insertScheduleDoctor
                        (scheduleDepartmentId,departmentId,doctorId,scheduleTime,timeInterval,averageNumber,0);
            }else {
                managementScheduleDoctorService.updateScheduleDoctorWithType(
                        doctorId,scheduleTime,timeInterval,averageNumber,0);
            }
        }
        return ApiResponse.successResponse(insertFlag);
    }



}
