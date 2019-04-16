package com.zjh.internethospitalservice.controller.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.management.ManagementUserReservationService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/4/14 12:21
 */
@Api(tags = "【后台管理】就诊记录相关API")
@RestController
@RequestMapping("/managementUserReservation")
public class ManagementUserReservationController {

    private final ManagementUserReservationService managementUserReservationService;
    private final HttpServletRequest httpRequest;

    public ManagementUserReservationController(ManagementUserReservationService managementUserReservationService, HttpServletRequest httpRequest) {
        this.managementUserReservationService = managementUserReservationService;
        this.httpRequest = httpRequest;
    }

    @ApiOperation(value = "医生管理员审核处方")
    @PostMapping("/auditUserReservation")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> auditUserReservation(
            @ApiParam(value = "用户就诊Uuid", required = true) @RequestParam String userReservationUuId,
            @ApiParam(value = "审核状态 1：不通过 2:已通过",required = true) @RequestParam String auditStatus,
            @ApiParam(value = "审核不通过的原因") @RequestParam(required = false) String examineFailReason
    ) {
        String token = httpRequest.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        managementUserReservationService.auditUserReservation(userReservationUuId,auditStatus,examineFailReason,userId);
        return ApiResponse.successResponse(null);
    }

    @ApiOperation(value = "根据就诊状态获取就诊列表")
    @PostMapping("/getUserReservationByAuditStatus")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> getUserReservationByAuditStatus(
            @ApiParam(value = "用户就诊审核状态 -1 全部 0 未审核的 1 审核通过的 2 审核不通过的", required = true)
            @RequestParam Integer auditStatus,
            @ApiParam(value = "页码",required = true) @RequestParam Integer pageNo,
            @ApiParam(value = "页容量",required = true) @RequestParam Integer pageSize
    ) {
        PageInfo<UserReservation> pageInfo =
                managementUserReservationService.getUserReservationListByAuditStatus(auditStatus,pageNo,pageSize);
        return ApiResponse.successResponse(pageInfo);
    }
}
