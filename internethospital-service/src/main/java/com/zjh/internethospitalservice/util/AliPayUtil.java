package com.zjh.internethospitalservice.util;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.*;
import com.alipay.api.request.*;
import com.alipay.api.response.*;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.PayStatusConstants;
import com.zjh.internethospitalapi.entity.RefundCorrelation;
import com.zjh.internethospitalapi.service.pay.RefundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/2 16:36
 */
@Component
public class AliPayUtil {

    @Value("${aliPay.privateKey}")
    private String privateKey;
    @Value("${aliPay.publicKey}")
    private String publicKey;
    @Value("${aliPay.appId}")
    private String appId;
    @Value("${aliPay.format}")
    private String format;
    @Value("${aliPay.charset}")
    private String charset;
    @Value("${aliPay.signType}")
    private String signType;
    @Value("${aliPay.serveUrl}")
    private String serverUrl;

    private AlipayClient alipayClient;

    private RefundService refundService;

    @Autowired
    public AliPayUtil(RefundService refundService) {
        this.refundService = refundService;
    }

    /**
     * 创建订单,当天关闭订单
     *
     * @param amount 金额总数
     * @return AlipayTradePrecreateResponse
     */
    public AlipayTradePrecreateResponse preCreatePay(String amount,String userReservationUuId) {
        if (alipayClient == null) {
            alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, publicKey, signType);
        }
        AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();
        request.setNotifyUrl("https://www.woniuyiliao.cn/api/pay/payNotify?userReservationUuId="+userReservationUuId);
        AlipayTradePrecreateModel model = new AlipayTradePrecreateModel();
        model.setSubject("蜗牛医疗");
        model.setTotalAmount(amount);
        model.setSellerId("2088102177938345");
        model.setOutTradeNo(UUID.randomUUID().toString());
        model.setTimeoutExpress("1d");
        request.setBizModel(model);
        try {
            AlipayTradePrecreateResponse response = alipayClient.execute(request);
            return response;
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查询订单
     *
     * @param outTradeNo
     * @return AlipayTradeQueryResponse
     */
    public AlipayTradeQueryResponse getTrade(String outTradeNo) {
        if (alipayClient == null) {
            alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, publicKey, signType);
        }
        AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
        AlipayTradeQueryModel model = new AlipayTradeQueryModel();
        model.setOutTradeNo(outTradeNo);
        request.setBizModel(model);
        try {
            AlipayTradeQueryResponse response = alipayClient.execute(request);
            return response;
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    }

    public AlipayTradeCloseResponse closePay(String outTradeNo,String userReservationUuId){
        if (alipayClient == null) {
            alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, publicKey, signType);
        }
        AlipayTradeCloseRequest request = new AlipayTradeCloseRequest();
        AlipayTradeCloseModel model = new AlipayTradeCloseModel();
        model.setOutTradeNo(outTradeNo);
        request.setBizModel(model);
        try {
            AlipayTradeCloseResponse response = alipayClient.execute(request);
            return response;
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 将支付宝api返回的订单状态转化为支付状态
     *
     * @param outTradeNo
     * @return 支付状态
     */
    public Integer generatePayStatus(String outTradeNo) {
        AlipayTradeQueryResponse response = getTrade(outTradeNo);
        if (response.getCode().equals(Constants.PAY_SUCCESS)){
            String tradeStatus = getTrade(outTradeNo).getTradeStatus();
            switch (tradeStatus) {
                case PayStatusConstants.TRADE_SUCCESS:
                    return PayStatusConstants.PAY_SUCCESS;
                case PayStatusConstants.TRADE_CLOSED:
                    RefundCorrelation refundCorrelation = refundService.getRefundCorrelationByOutTradeNo(outTradeNo);
                    //退款信息不为空，说明处于退款中
                    if (refundCorrelation != null) {
                        //退款中
                        if (refundCorrelation.getRefundStatus().equals("1")) {
                            return PayStatusConstants.WANT_REFUND;
                        }
                        //已退款
                        else if (refundCorrelation.getRefundStatus().equals("2")) {
                            return PayStatusConstants.HAS_REFUND;
                        }
                        //退款失败或拒绝退款
                        else {
                            return PayStatusConstants.REFUSE_REFUND;
                        }
                    }
                    //否则为支付超时
                    else {
                        return PayStatusConstants.PAY_TIMEOUT;
                    }
                case PayStatusConstants.TRADE_FINISHED:
                    return PayStatusConstants.PAY_FINISH;
                case PayStatusConstants.WAIT_BUYER_PAY:
                    return PayStatusConstants.WAIT_PAY;
                default:
                    return null;
            }
        }else {
            return -1;
        }
    }
}
