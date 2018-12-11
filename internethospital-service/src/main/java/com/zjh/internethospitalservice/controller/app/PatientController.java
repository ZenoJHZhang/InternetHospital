package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalapi.entity.Patient;
import com.zjh.internethospitalapi.service.app.PatientService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/11 11:46
 */
@RestController
@Api(tags = "就诊人相关API")
@RequestMapping("/patient")
public class PatientController {
    private final PatientService patientService;

    @Autowired
    public PatientController(PatientService patientService) {
        this.patientService = patientService;
    }

    @GetMapping("/listPatient")
    @ApiOperation(value = "获取用户的就诊人列表")
    public List<Patient> listPatient(
            @ApiParam(required = true,value = "用户id",example = "1") @RequestParam(value = "userId") Integer userId){
        return patientService.listPatient(userId);
    }

    @PostMapping("/insertPatient")
    @ApiOperation(value = "新增就诊人")
    public Integer insertPatient(@ApiParam(value = "就诊人信息",required = true) @RequestBody Patient patient){
        return patientService.insertPatient(patient);
    }
}
