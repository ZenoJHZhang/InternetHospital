package com.zjh.internethospitalservice.controller.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
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
    @RequiresRoles(value = "doctorAdmin")
    public ResponseEntity<ApiResponse> insertDoctor(
            @ApiParam(required = true, value = "医生") @RequestBody Doctor doctor) {
        String message = doctorPattern(doctor.getPhone(), doctor.getDoctorIdCard());
        if (message != null) {
            return ApiResponse.response(400, message, null);
        }
        managementDoctorService.insertDoctor(doctor);
        return ApiResponse.successResponse(null);
    }

    @PostMapping("/listDoctorByDepartmentId")
    @ApiOperation(value = "根据科室id获取医生列表")
    @RequiresRoles(value = "doctorAdmin")
    public ResponseEntity<ApiResponse> listDoctorByDepartmentId(
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId,
            @ApiParam(value = "页码", required = true, example = "1") @RequestParam Integer pageNumber,
            @ApiParam(value = "页容量", required = true, example = "1") @RequestParam Integer pageSize
    ) {
        PageInfo<Doctor> doctorPageInfo = managementDoctorService.listDoctorByDepartmentId(departmentId, pageNumber, pageSize);
        return ApiResponse.successResponse(doctorPageInfo);
    }

    @PostMapping("/deleteDoctor")
    @ApiOperation(value = "删除医生")
    @RequiresRoles(value = "doctorAdmin")
    public ResponseEntity<ApiResponse> deleteDoctor(
            @ApiParam(value = "医生id", required = true, example = "1") @RequestParam Integer doctorId) {
        managementDoctorService.deleteDoctor(doctorId);
        return ApiResponse.successResponse(null);
    }

    @PostMapping("/updateDoctorSelective")
    @ApiOperation(value = "更新医生")
    @RequiresRoles(value = "doctorAdmin")
    public ResponseEntity<ApiResponse> updateDoctorSelective(
            @ApiParam(value = "医生id", required = true, example = "1") @RequestParam Integer doctorId,
            @ApiParam(value = "医生工号") @RequestParam(required = false) String doctorNumber,
            @ApiParam(value = "医生手机号") @RequestParam(required = false) String phone,
            @ApiParam(value = "医生职称") @RequestParam(required = false) String doctorTitle,
            @ApiParam(value = "医生头像图片id", example = "1") @RequestParam(required = false) Integer imgId,
            @ApiParam(value = "医生擅长") @RequestParam(required = false) String goodAt) {
        String message = doctorPattern(phone, null);
        if (message != null) {
            return ApiResponse.response(400, message, null);
        }
        managementDoctorService.updateDoctorSelective(doctorId, doctorNumber, phone, doctorTitle, imgId, goodAt);
        return ApiResponse.successResponse(null);
    }

    private String doctorPattern(String phone, String doctorIdCard) {
        String phonePattern = Constants.PHONE_PATTERN;
        boolean isPhoneMatch = true;
        boolean isIdCardMatch = true;
        if (phone != null){
             isPhoneMatch = Pattern.matches(phonePattern, phone);
        }
        if (doctorIdCard != null){
            isIdCardMatch = Pattern.matches(Constants.ID_CARD_PATTERN, doctorIdCard);
        }
        if (!isPhoneMatch) {
            return "手机号格式错误";
        }
        if (!isIdCardMatch) {
            return "身份证格式错误";
        } else {
            return null;
        }
    }
}
