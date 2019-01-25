package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.Patient;
import com.zjh.internethospitalapi.service.app.PatientService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/11 11:46
 */
@RestController
@Api(tags = "【用户模块】就诊人相关API")
@RequestMapping("/patient")
public class PatientController {
    private final PatientService patientService;
    private final HttpServletRequest httpRequest;

    @Autowired
    public PatientController(PatientService patientService, HttpServletRequest httpRequest) {
        this.patientService = patientService;
        this.httpRequest = httpRequest;
    }

    @GetMapping("/listPatient")
    @ApiOperation(value = "获取用户的就诊人列表")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> listPatient(
            @RequestParam @ApiParam(value = "页码", required = true, example = "1") Integer pageNo,
            @RequestParam @ApiParam(value = "页容量", required = true, example = "8") Integer pageSize) {
        String token = httpRequest.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        return ApiResponse.successResponse(patientService.listPatient(userId, pageNo, pageSize));
    }

    @PostMapping("/insertPatient")
    @ApiOperation(value = "新增就诊人")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> insertPatient(@ApiParam(value = "就诊人信息", required = true) @RequestBody Patient patient) {
        String token = httpRequest.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        String message = judgePatient(patient, userId);
        if (message != null){
            return ApiResponse.response(400,message,null);
        }
        patientService.insertPatient(patient, userId);
        return ApiResponse.successResponse(null);
    }

    @PostMapping("/deletePatient")
    @ApiOperation(value = "删除就诊人")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> deletePatient(
            @RequestBody @ApiParam(required = true, value = "就诊人id列表") List<Patient> patientList) {
        String token = httpRequest.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        patientService.deletePatient(patientList, userId);
        return ApiResponse.successResponse(null);

    }

    @PostMapping("/updatePatient")
    @ApiOperation(value = "更新就诊人")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> updatePatient(@RequestBody @ApiParam(required = true, value = "就诊人") Patient patient) {
        String token = httpRequest.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        String message = judgePatient(patient, userId);
        if (message != null){
            return ApiResponse.response(400,message,null);
        }
        patientService.updatePatient(patient, userId);
        return ApiResponse.successResponse(null);
    }


    private String judgePatient(Patient patient, Integer userId) {
        String phone = patient.getPhone();
        String realName = patient.getRealName();
        String idCard = patient.getIdCard();
        boolean isIdCardMatch = Pattern.matches(Constants.ID_CARD_PATTERN, idCard);
        boolean isRealNameMatch = Pattern.matches(Constants.REAL_NAME_PATTERN, realName);
        boolean isPhoneMatch = Pattern.matches(Constants.PHONE_PATTERN, phone);
        String message = null;
        if (!isIdCardMatch) {
            message = "身份证格式错误";
        }
        if (!isPhoneMatch) {
            message = "手机号格式错误";
        }
        if (!isRealNameMatch) {
            message = "姓名格式错误";
        }
        if (patientService.isSamePatient(patient, userId)) {
            message = "该就诊人已存在，请勿重复添加!";
        }
        return message;
    }
}
