package com.zjh.internethospitalservice.controller.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/24 14:11
 */
@RestController
@RequestMapping("/managementDepartment")
@Api(tags = "【后台管理】科室相关API")
public class ManagementDepartmentController {

    private final ManagementDepartmentService managementDepartmentService;

    @Autowired
    public ManagementDepartmentController(ManagementDepartmentService managementDepartmentService) {
        this.managementDepartmentService = managementDepartmentService;
    }

    @GetMapping("/listAllDepartmentByType")
    @ApiOperation(value = "根据科室类型获取所有科室")
    public ResponseEntity<ApiResponse> listAllDepartmentByType(
            @ApiParam(value = "科室类别 0 普通科室 ；1 专家科室", required = true,example = "1") @RequestParam Integer departmentType,
            @ApiParam(value = "页码", required = true,example = "1") @RequestParam Integer pageNumber,
            @ApiParam(value = "页容量", required = true,example = "1") @RequestParam Integer pageSize) {
        PageInfo<Department> departmentPageInfo = managementDepartmentService.
                listAllDepartmentByType(departmentType, pageNumber, pageSize);
        return ApiResponse.successResponse(departmentPageInfo);
    }

    @ApiOperation(value = "新增科室")
    @PostMapping("/insertDepartment")
    @RequiresRoles(value = "doctorAdmin")
    public ResponseEntity<ApiResponse> insertDepartment(
            @ApiParam(value = "科室", required = true) @RequestBody Department department) {
        String message = judgeDepartment(department);
        if (message != null) {
            return ApiResponse.response(400, message, null);
        } else {
            managementDepartmentService.insertDepartment(department);
        }
        return ApiResponse.successResponse(null);
    }

    @ApiOperation(value = "更新科室")
    @PostMapping("/updateDepartment")
    @RequiresRoles(value = "doctorAdmin")
    public ResponseEntity<ApiResponse> updateDepartment(
            @ApiParam(value = "科室", required = true) @RequestBody Department department) {
        String message = judgeDepartment(department);
        if (message != null) {
            return ApiResponse.response(400, message, null);
        } else {
            managementDepartmentService.updateDepartment(department);
        }
        return ApiResponse.successResponse(null);
    }


    @ApiOperation(value = "根据科室名模糊搜索科室")
    @PostMapping("/selectDepartmentByName")
    @RequiresRoles(value = "doctorAdmin")
    public ResponseEntity<ApiResponse> selectDepartmentByName(
            @ApiParam(value = "科室名", required = true,example = "1") @RequestParam String departmentName,
            @ApiParam(value = "页码", required = true,example = "1") @RequestParam Integer pageNumber,
            @ApiParam(value = "页容量", required = true,example = "1") @RequestParam Integer pageSize) {
        PageInfo<Department> departmentPageInfo =
                managementDepartmentService.selectDepartmentByName(departmentName, pageNumber, pageSize);
        return  ApiResponse.successResponse(departmentPageInfo);
    }

    private String judgeDepartment(Department department) {
        String message;
        String departmentName = department.getDepartmentName();
        String departmentNumber = department.getDepartmentNumber();
        if (departmentName == null) {
            message = "科室名不得为空";
            return message;
        }
        if (departmentNumber == null) {
            message = "科室号码不得为空";
            return message;
        } else {
            return null;
        }
    }
}
