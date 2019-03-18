package com.zjh.internethospitalservice.controller.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.Logical;
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
            @ApiParam(value = "科室类别 0 普通科室 ；1 专家科室 ;2 全部科室", required = true, example = "1") @RequestParam Integer departmentType,
            @ApiParam(value = "页码", required = true, example = "1") @RequestParam Integer pageNumber,
            @ApiParam(value = "页容量", required = true, example = "1") @RequestParam Integer pageSize) {
        PageInfo<Department> departmentPageInfo = managementDepartmentService.
                listAllDepartmentByType(departmentType, pageNumber, pageSize);
        return ApiResponse.successResponse(departmentPageInfo);
    }

    @ApiOperation(value = "新增科室")
    @PostMapping("/insertDepartment")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> insertDepartment(
            @ApiParam(value = "科室", required = true) @RequestBody Department department) {
        String message = judgeDepartment(department);
        if (message != null) {
            return ApiResponse.response(400, message, null);
        } else {
            return ApiResponse.successResponse(managementDepartmentService.insertDepartment(department));
        }
    }

    @ApiOperation(value = "更新科室")
    @PostMapping("/updateDepartment")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> updateDepartment(
            @ApiParam(value = "科室", required = true) @RequestBody Department department) {
        String message = judgeDepartment(department);
        if (message != null) {
            return ApiResponse.response(400, message, null);
        } else {
            return ApiResponse.successResponse(managementDepartmentService.updateDepartment(department));
        }

    }


    @ApiOperation(value = "根据科室名/科室编号模糊搜索科室,并根据科室类型进行筛选")
    @PostMapping("/listDepartmentByNameOrNumberWithDepartmentMessage")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> listDepartmentByNameOrNumberWithDepartmentMessage(
            @ApiParam(value = "科室名/科室编号", required = true, example = "1") @RequestParam String departmentMessage,
            @ApiParam(value = "科室类别 0 普通科室 ；1 专家科室 ;2 全部科室", required = true, example = "1") @RequestParam Integer departmentType,
            @ApiParam(value = "页码", required = true, example = "1") @RequestParam Integer pageNumber,
            @ApiParam(value = "页容量", required = true, example = "1") @RequestParam Integer pageSize) {
        PageInfo<Department> departmentPageInfo =
                managementDepartmentService.listDepartmentByNameOrNumberWithDepartmentMessage(departmentMessage.trim(), departmentType, pageNumber, pageSize);
        return ApiResponse.successResponse(departmentPageInfo);
    }

    @ApiOperation(value = "根据科室id获取科室信息")
    @GetMapping("/getDepartmentById")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> getDepartmentById(
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId) {
        return ApiResponse.successResponse(managementDepartmentService.getDepartmentById(departmentId));
    }

    @ApiOperation(value = "根据科室id删除科室")
    @PostMapping("/deleteDepartment")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> deleteDepartment(
            @ApiParam(value = "科室id", required = true, example = "1") @RequestParam Integer departmentId) {
        managementDepartmentService.deleteDepartment(departmentId);
        return ApiResponse.successResponse(null);
    }

    private String judgeDepartment(Department department) {
        String message;
        String departmentName = department.getDepartmentName();
        String departmentNumber = department.getDepartmentNumber();
        String price = department.getPrice();
        Integer imgId = department.getImgId();
        String phone = department.getPhone();
        if (departmentName == null) {
            message = "科室名不得为空";
            return message;
        }
        if (departmentNumber == null) {
            message = "科室编号不得为空";
            return message;
        }
        if (price == null) {
            message = "科室挂号价格不得为空";
            return message;
        }
        if (imgId == null) {
            message = "科室示例图片不得为空";
            return message;
        }
        if (phone == null) {
            message = "科室联系电话不得为空";
            return message;
        } else {
            return null;
        }
    }
}
