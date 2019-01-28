package com.zjh.internethospitalservice.controller.management;

import com.zjh.internethospitalapi.service.management.ManagementDoctorDepartmentService;
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

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/26 16:06
 */
@RestController
@RequestMapping("/managementDoctorDepartment")
@Api(tags = "【后台管理】医生科室联系相关API")
public class ManagementDoctorDepartmentController {

    private final ManagementDoctorDepartmentService managementDoctorDepartmentService;

    @Autowired
    public ManagementDoctorDepartmentController(ManagementDoctorDepartmentService managementDoctorDepartmentService) {
        this.managementDoctorDepartmentService = managementDoctorDepartmentService;
    }

    @ApiOperation(value = "为医生添加一个或多个科室")
    @PostMapping("/updateDoctorIntoDepartment")
    public ResponseEntity<ApiResponse> updateDoctorIntoDepartment(
            @ApiParam(value = "医生id",required = true,example = "1") @RequestParam Integer doctorId,
            @ApiParam(value = "科室id列表",required = true) @RequestParam List<Integer> departmentIdList
            ){
        managementDoctorDepartmentService.updateDoctorDepartment(doctorId,departmentIdList);
        return ApiResponse.successResponse(null);
    }
}
