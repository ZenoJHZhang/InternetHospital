package com.zjh.internethospitalservice.controller.management;

import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/21 13:27
 */
@RestController
@RequestMapping("/managementDoctor")
@Api(tags = "【后台管理】医生管理相关API")
public class ManagementDoctorController {

    private final ManagementDoctorService managementDoctorService;

    @Autowired
    public ManagementDoctorController(ManagementDoctorService managementDoctorService) {
        this.managementDoctorService = managementDoctorService;
    }

    @PostMapping("/insertDoctor")
    @ApiOperation(value = "新增医生")
    @RequiresRoles(value = "doctor")
    public ResponseEntity<ApiResponse> insertDoctor(
            @ApiParam(required = true,value = "医生") @RequestBody Doctor doctor){
        managementDoctorService.insertDoctor(doctor);
        return ApiResponse.successResponse(null);
    }


}
