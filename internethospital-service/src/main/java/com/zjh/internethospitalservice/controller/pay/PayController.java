package com.zjh.internethospitalservice.controller.pay;

import com.alipay.api.response.AlipayTradeCreateResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.AliPayUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/4 14:18
 */
@RestController
@RequestMapping("/pay")
@Api(tags = "【支付】支付相关API")
public class PayController {

    private final AliPayUtil aliPayUtil;

    @Autowired
    public PayController(AliPayUtil aliPayUtil) {
        this.aliPayUtil = aliPayUtil;
    }


    @ApiOperation(value = "生成支付二维码")
    @PostMapping("/createPayQrCode")
    public ResponseEntity<ApiResponse> createPayQrCode() {
        AlipayTradePrecreateResponse response = aliPayUtil.preCreatePay("4444");
        return ApiResponse.successResponse(response);
    }

    @ApiOperation(value = "getPayStatus")
    @PostMapping("/getPayStatus")
    public ResponseEntity<ApiResponse> getPayStatus(@ApiParam(required = true) @RequestParam String outTradeNo) {
        return ApiResponse.successResponse(aliPayUtil.getPayStatus(outTradeNo));
    }
}
