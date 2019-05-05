package com.zjh.internethospitalservice.controller.pay;

import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.PayStatusConstants;
import com.zjh.internethospitalapi.dto.QrCodeDto;
import com.zjh.internethospitalapi.entity.OrderDetail;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalapi.service.pay.OrderDetailService;
import com.zjh.internethospitalapi.service.pay.PayService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.AliPayUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

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
@Slf4j
public class PayController {

    private final AliPayUtil aliPayUtil;
    private final OrderDetailService orderDetailService;
    private final HttpServletRequest request;
    private final StringRedisTemplate stringRedisTemplate;
    private final UserReservationService userReservationService;
    private final PayService payService;

    @Autowired
    public PayController(AliPayUtil aliPayUtil, OrderDetailService orderDetailService, HttpServletRequest request,
                         StringRedisTemplate stringRedisTemplate, UserReservationService userReservationService, PayService payService) {
        this.aliPayUtil = aliPayUtil;
        this.orderDetailService = orderDetailService;
        this.request = request;
        this.stringRedisTemplate = stringRedisTemplate;
        this.userReservationService = userReservationService;
        this.payService = payService;
    }


    @ApiOperation(value = "生成支付二维码")
    @PostMapping("/createPayQrCode")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> createPayQrCode(
            @RequestParam @ApiParam(required = true, value = "支付金额") String amount,
            @RequestParam @ApiParam(required = true, value = "用户就诊uId") String userReservationUuId) {
        OrderDetail existOrder = orderDetailService.getOrderDetailByUserReservationUuId(userReservationUuId);
        //订单已创建
        if (existOrder != null) {
            String qrCode = stringRedisTemplate.opsForValue().get("二维码" + existOrder.getOutTradeNo());
            QrCodeDto qrCodeDto = new QrCodeDto(qrCode, existOrder.getOutTradeNo(), userReservationUuId, existOrder.getStatus());
            return ApiResponse.successResponse(qrCodeDto);
        } else {
            AlipayTradePrecreateResponse response = aliPayUtil.preCreatePay(amount, userReservationUuId);
            if (response.getCode().equals(Constants.PAY_SUCCESS)) {
                QrCodeDto qrCodeDto = new QrCodeDto(response.getQrCode(), response.getOutTradeNo(), userReservationUuId, PayStatusConstants.WAIT_PAY);
                stringRedisTemplate.opsForValue().set("二维码" + response.getOutTradeNo(), response.getQrCode());
                return ApiResponse.successResponse(qrCodeDto);
            } else {
                return ApiResponse.commonResponse(400, response.getMsg(), null);
            }
        }
    }

    @ApiOperation(value = "追踪订单")
    @PostMapping("/tradeOrder")
    public ResponseEntity<ApiResponse> tradeOrder(@ApiParam(required = true) @RequestParam String outTradeNo) {
        return ApiResponse.successResponse(aliPayUtil.getTrade(outTradeNo));
    }

    @ApiOperation(value = "获取支付状态")
    @PostMapping("/getPayStatus")
    public ResponseEntity<ApiResponse> getPayStatus(@ApiParam(required = true) @RequestParam String outTradeNo) {
        return ApiResponse.successResponse(orderDetailService.getOrderDetailByOutTradeNo(outTradeNo).getStatus());
    }

    @ApiOperation(value = "支付宝回调通知")
    @PostMapping("/payNotify")
    public void notify(HttpServletRequest request) {
        Map<String, String> params = new HashMap<>();
        Map requestParams = request.getParameterMap();
        for (Object o : requestParams.keySet()) {
            String name = (String) o;
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        //支付状态
        String tradeStatus = params.get("trade_status");
        //支付金额
        String totalAmount = params.get("total_amount");
        //就诊UuId
        String userReservationUuId = params.get("userReservationUuId");
        //订单创建时间
        String gmtCreate = params.get("gmt_create");
        //商户流水号
        String outTradeNo = params.get("out_trade_no");
        Integer userId = userReservationService.getUserReservationByUuId(userReservationUuId).getUserId();

        //待支付状态，创建订单
        if (tradeStatus.equals(PayStatusConstants.WAIT_BUYER_PAY)) {
            payService.createWaitPay(outTradeNo, userReservationUuId, userId, totalAmount);
            stringRedisTemplate.opsForValue().set("创建时间"+outTradeNo,gmtCreate);
        } else if (tradeStatus.equals(PayStatusConstants.TRADE_SUCCESS)) {
            payService.paySuccess(outTradeNo, userReservationUuId);
        }
    }
}
