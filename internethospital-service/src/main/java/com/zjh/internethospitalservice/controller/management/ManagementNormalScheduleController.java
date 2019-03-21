package com.zjh.internethospitalservice.controller.management;

import com.github.pagehelper.PageInfo;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
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
@RequestMapping("/managementNormalSchedule")
public class ManagementNormalScheduleController {
    private final ManagementScheduleDoctorService managementScheduleDoctorService;
    private final ManagementScheduleDepartmentService managementScheduleDepartmentService;
    private final ManagementDoctorDepartmentService managementDoctorDepartmentService;

    @Autowired
    public ManagementNormalScheduleController(ManagementScheduleDoctorService managementScheduleDoctorService,
                                              ManagementScheduleDepartmentService managementScheduleDepartmentService, ManagementDoctorDepartmentService managementDoctorDepartmentService) {

        this.managementScheduleDoctorService = managementScheduleDoctorService;
        this.managementScheduleDepartmentService = managementScheduleDepartmentService;
        this.managementDoctorDepartmentService = managementDoctorDepartmentService;
    }

    @PostMapping("/insert")
    @ApiOperation("新增科室就诊排班")
    public ResponseEntity<ApiResponse> insert(
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId,
            @ApiParam(value = "排班时间", required = true) @RequestParam String scheduleTime,
            @ApiParam(value = "排班时段", required = true) @RequestParam String timeInterval,
            @ApiParam(value = "总号源数", required = true, example = "1") @RequestParam Integer totalNumber) {
        Integer scheduleDepartmentId = managementScheduleDepartmentService.
                insertScheduleDepartment(departmentId, timeInterval, scheduleTime, totalNumber);
        List<Doctor> doctorList = managementDoctorDepartmentService.listDoctorByDepartmentId(departmentId);
        List<Integer> doctorIdList = new ArrayList<>();
        int size = doctorList.size();
        int doctorTotalNumber = totalNumber / size;
        int lastDoctorTotalNumber = totalNumber - (size - 1) * doctorTotalNumber;
        for (int i = 0; i < size; i++) {
            int averageNumber;
            if (i == (size - 1)) {
                averageNumber = lastDoctorTotalNumber;
            } else {
                averageNumber = doctorTotalNumber;
            }
            Doctor doctor = doctorList.get(i);
            Integer doctorId = doctor.getId();
            managementScheduleDoctorService.insertNormalScheduleDoctor(scheduleDepartmentId, departmentId,
                    doctorId, timeInterval, scheduleTime, averageNumber);
            doctorIdList.add(doctorId);
        }
        return ApiResponse.successResponse(doctorIdList);
    }

    @PostMapping("/update")
    @ApiOperation("更新科室就诊排班")
    public ResponseEntity<ApiResponse> update(
            @ApiParam(value = "科室排班id", required = true, example = "1") @RequestParam Integer scheduleDepartmentId,
            @ApiParam(value = "排班时段", required = true) @RequestParam String timeInterval,
            @ApiParam(value = "总号源数", required = true, example = "1") @RequestParam Integer totalNumber
    ) {
        managementScheduleDepartmentService.updateScheduleDepartment(scheduleDepartmentId, timeInterval, totalNumber);
        managementScheduleDoctorService.updateNormalScheduleDoctor(scheduleDepartmentId, timeInterval, totalNumber);
        return ApiResponse.successResponse(null);
    }

    @PostMapping("/delete")
    @ApiOperation("删除科室排班")
    public ResponseEntity<ApiResponse> delete(
            @ApiParam(value = "科室排班id", required = true, example = "1") @RequestParam Integer scheduleDepartmentId) {
        managementScheduleDepartmentService.deleteScheduleDepartmentById(scheduleDepartmentId);
        Integer count = managementScheduleDoctorService.deleteScheduleDoctorByScheduleDepartmentId(scheduleDepartmentId);
        return ApiResponse.successResponse(count);
    }

    @PostMapping("/list")
    @ApiOperation("分页获取科室排班")
    public ResponseEntity<ApiResponse> list(
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId,
            @ApiParam(value = "排班时间", required = true) @RequestParam String scheduleTime,
            @ApiParam(value = "排班时段", required = true) @RequestParam String timeInterval,
            @ApiParam(value = "页码", required = true, example = "1") @RequestParam Integer pageNumber,
            @ApiParam(value = "页容量", required = true, example = "1") @RequestParam Integer pageSize
    ) {
        PageInfo<ScheduleDepartment> scheduleDepartmentPageInfo = managementScheduleDepartmentService.
                listScheduleDepartmentOfTimeInterval(departmentId, scheduleTime, timeInterval, pageNumber, pageSize);
        return ApiResponse.successResponse(scheduleDepartmentPageInfo);
    }
}
