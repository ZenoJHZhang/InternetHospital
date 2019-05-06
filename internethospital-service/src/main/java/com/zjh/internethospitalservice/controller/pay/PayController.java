package com.zjh.internethospitalservice.controller.pay;

import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.PayStatusConstants;
import com.zjh.internethospitalapi.dto.QrCodeDto;
import com.zjh.internethospitalapi.entity.OrderDetail;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalapi.service.pay.OrderDetailService;
import com.zjh.internethospitalapi.service.pay.PayService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.AliPayUtil;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

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
        boolean userReservationTimeOut = payService.isUserReservationTimeOut(userReservationUuId);
        OrderDetail existOrder = orderDetailService.getOrderDetailByUserReservationUuId(userReservationUuId);
        //订单已创建
        if (existOrder != null) {
            //判断就诊是否超时
            if (userReservationTimeOut) {
                timeOutPay(existOrder, userReservationUuId);
                return ApiResponse.successResponse(-1);
            }
            //判断支付是否超时
            if (payService.isPayTimeOut(userReservationUuId)) {
                timeOutPay(existOrder, userReservationUuId);
                return ApiResponse.successResponse(-1);
            }
            String qrCode = stringRedisTemplate.opsForValue().get("二维码" + userReservationUuId);
            QrCodeDto qrCodeDto = new QrCodeDto(qrCode, existOrder.getOutTradeNo(), userReservationUuId, existOrder.getStatus());
            return ApiResponse.successResponse(qrCodeDto);
        } else {
            if (userReservationTimeOut) {
                payService.makeUserReservationTimeOut(userReservationUuId);
                return ApiResponse.successResponse(-1);
            }
            String token = request.getHeader("Authorization");
            Integer userId = JWTUtil.getUserId(token);
            AlipayTradePrecreateResponse response = aliPayUtil.preCreatePay(amount, userReservationUuId);
            if (response.getCode().equals(Constants.PAY_SUCCESS)) {
                String qrCode = response.getQrCode();
                String outTradeNo = response.getOutTradeNo();
                //创建未扫码订单
                payService.createNotSweepCodeOrder(outTradeNo, userReservationUuId, userId, amount);
                //生成二维码，30分钟内必须支付完成
                QrCodeDto qrCodeDto = new QrCodeDto(qrCode, outTradeNo, userReservationUuId, PayStatusConstants.WAIT_PAY);
                stringRedisTemplate.opsForValue().set("二维码" + userReservationUuId, response.getQrCode(), 30, TimeUnit.MINUTES);
                return ApiResponse.successResponse(qrCodeDto);
            } else {
                return ApiResponse.commonResponse(400, response.getMsg(), null);
            }
        }
    }

    @ApiOperation(value = "追踪订单")
    @PostMapping("/tradeOrder")
    public ResponseEntity<ApiResponse> tradeOrder(@ApiParam(required = true) @RequestParam String outTradeNo) {
        AlipayTradeQueryResponse trade = aliPayUtil.getTrade(outTradeNo);
        if (trade.getCode().equals(Constants.PAY_SUCCESS)) {
            if (trade.getTradeStatus().equals(PayStatusConstants.TRADE_SUCCESS)) {
                String userReservationUuId = orderDetailService.getOrderDetailByOutTradeNo(outTradeNo).getUserReservationUuId();
                payService.paySuccess(outTradeNo, userReservationUuId);
            }
            else if(trade.getTradeStatus().equals(PayStatusConstants.WAIT_BUYER_PAY)){
                payService.waitPay(outTradeNo);
            }
        }
        return ApiResponse.successResponse(trade);
    }

    @ApiOperation(value = "获取支付状态")
    @PostMapping("/getPayStatus")
    public ResponseEntity<ApiResponse> getPayStatus(
                                                    @ApiParam(required = true) @RequestParam String userReservationUuId) {
        boolean userReservationTimeOut = payService.isUserReservationTimeOut(userReservationUuId);
        OrderDetail order = orderDetailService.getOrderDetailByUserReservationUuId(userReservationUuId);
        if (order == null) {
            if (userReservationTimeOut) {
                payService.makeUserReservationTimeOut(userReservationUuId);
                return ApiResponse.successResponse(PayStatusConstants.PAY_TIMEOUT);
            }
            return ApiResponse.successResponse(-1);
        } else {
            if (userReservationTimeOut) {
                timeOutPay(order, userReservationUuId);
                return ApiResponse.successResponse(PayStatusConstants.PAY_TIMEOUT);
            } else if (payService.isPayTimeOut(userReservationUuId)) {
                timeOutPay(order, userReservationUuId);
                return ApiResponse.successResponse(PayStatusConstants.PAY_TIMEOUT);
            } else {
                return ApiResponse.successResponse(order.getStatus());
            }
        }
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
        //就诊UuId
        String userReservationUuId = params.get("userReservationUuId");
        //商户流水号
        String outTradeNo = params.get("out_trade_no");

        //根据订单状态进行操作
        switch (tradeStatus) {
            case PayStatusConstants.WAIT_BUYER_PAY:
                payService.waitPay(outTradeNo);
                break;
            case PayStatusConstants.TRADE_SUCCESS:
                payService.paySuccess(outTradeNo, userReservationUuId);
                break;
        }
    }

    private void timeOutPay(OrderDetail order, String userReservationUuId) {
        if (!order.getStatus().equals(PayStatusConstants.PAY_TIMEOUT)) {
            //未扫码，支付宝还未生成对应订单，无需关闭订单，仅更新数据库
            if (order.getStatus().equals(PayStatusConstants.NOT_SWEEP_CODE)) {
                payService.makeUserReservationTimeOut(userReservationUuId);
            }
            //已扫码，需要关闭订单
            else {
                if (aliPayUtil.getTrade(order.getOutTradeNo()).getTradeStatus().equals(PayStatusConstants.WAIT_BUYER_PAY)) {
                    aliPayUtil.closePay(order.getOutTradeNo(), userReservationUuId);
                }
                payService.makeUserReservationTimeOut(userReservationUuId);
            }
        }
    }
}
