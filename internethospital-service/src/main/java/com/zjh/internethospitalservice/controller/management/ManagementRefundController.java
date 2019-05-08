package com.zjh.internethospitalservice.controller.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Refund;
import com.zjh.internethospitalapi.service.pay.RefundService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/8 14:38
 */
@Api(tags = "【后台管理】退款相关API")
@RestController
@RequestMapping("/managementRefund")
public class ManagementRefundController {

    private final RefundService refundService;

    @Autowired
    public ManagementRefundController(RefundService refundService) {
        this.refundService = refundService;
    }

    @ApiOperation(value = "根据退款状态分页获取退款信息")
    @PostMapping("/listRefundByStatus")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> listRefundByStatus(
            @ApiParam(value = "状态", required = true, example = "1") @RequestParam Integer status,
            @ApiParam(value = "页码", required = true, example = "1") @RequestParam Integer pageNo,
            @ApiParam(value = "页容量", required = true, example = "1") @RequestParam Integer pageSize
    ) {
        PageInfo<Refund> refundPageInfo = refundService.listRefundByStatus(status, pageNo, pageSize);
        return ApiResponse.successResponse(refundPageInfo);
    }
}
