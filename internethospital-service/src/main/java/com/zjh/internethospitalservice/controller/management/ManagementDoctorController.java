package com.zjh.internethospitalservice.controller.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.regex.Pattern;

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
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> insertDoctor(
            @ApiParam(required = true, value = "医生") @RequestBody Doctor doctor) {
        String message = doctorPattern(doctor);
        if (message != null) {
            return ApiResponse.response(400, message, null);
        }
        Integer doctorId = managementDoctorService.insertDoctor(doctor);
        return ApiResponse.successResponse(doctorId);
    }

    @PostMapping("/deleteDoctor")
    @ApiOperation(value = "删除医生")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> deleteDoctor(
            @ApiParam(value = "医生id", required = true, example = "1") @RequestParam Integer doctorId) {
        managementDoctorService.deleteDoctor(doctorId);
        return ApiResponse.successResponse(null);
    }

    @PostMapping("/updateDoctor")
    @ApiOperation(value = "更新医生")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> updateDoctorSelective(
            @ApiParam(value = "医生信息", required = true) @RequestBody Doctor doctor) {
        String message = doctorPattern(doctor);
        if (message != null) {
            return ApiResponse.response(400, message, null);
        }
        Integer doctorId = managementDoctorService.updateDoctorSelective(doctor);
        return ApiResponse.successResponse(doctorId);
    }

    @PostMapping("/listDoctorByNameOrNumberWithDepartmentId")
    @ApiOperation(value = "根据医生姓名/工号进行模糊搜索，并通过科室进行筛选")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> listDoctorByNameOrNumberWithDepartmentId(
            @ApiParam(value = "医生信息", required = true) @RequestParam String doctorMessage,
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId,
            @ApiParam(value = "页码", required = true, example = "1") @RequestParam Integer pageNumber,
            @ApiParam(value = "页容量", required = true, example = "1") @RequestParam Integer pageSize) {
        PageInfo<Doctor> doctorPageInfo = managementDoctorService.
                listDoctorByNameOrNumberWithDepartmentId(doctorMessage, departmentId, pageNumber, pageSize);
        return ApiResponse.successResponse(doctorPageInfo);
    }

    @ApiOperation(value = "根据医生id获取医生信息")
    @GetMapping("/getDoctorById")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> getDoctorById(
            @ApiParam(value = "医生id", required = true, example = "1") @RequestParam Integer doctorId) {
        return ApiResponse.successResponse(managementDoctorService.getDoctorById(doctorId));
    }

    private String doctorPattern(Doctor doctor) {
        String phone = doctor.getPhone();
        String doctorIdCard = doctor.getDoctorIdCard();
        String doctorNumber = doctor.getDoctorNumber();
        String phonePattern = Constants.PHONE_PATTERN;
        boolean isPhoneMatch = true;
        boolean isIdCardMatch = true;
        if (phone != null) {
            isPhoneMatch = Pattern.matches(phonePattern, phone);
        }
        if (doctorIdCard != null) {
            isIdCardMatch = Pattern.matches(Constants.ID_CARD_PATTERN, doctorIdCard);
        }
        if (!isPhoneMatch) {
            return "手机号格式错误";
        }
        if (!isIdCardMatch) {
            return "身份证格式错误";
        }
        if (doctorNumber.length() > 10) {
            return "医生工号长度不得大于10个字符";
        } else {
            return null;
        }
    }
}
