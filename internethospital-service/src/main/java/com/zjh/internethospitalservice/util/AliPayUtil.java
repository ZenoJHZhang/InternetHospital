package com.zjh.internethospitalservice.util;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.*;
import com.alipay.api.request.*;
import com.alipay.api.response.*;
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

    /**
     * 关闭订单
     * @param outTradeNo 商户流水号
     */
    public void closePay(String outTradeNo){
        if (alipayClient == null) {
            alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, publicKey, signType);
        }
        AlipayTradeCloseRequest request = new AlipayTradeCloseRequest();
        AlipayTradeCloseModel model = new AlipayTradeCloseModel();
        model.setOutTradeNo(outTradeNo);
        request.setBizModel(model);
        try {
            AlipayTradeCloseResponse response = alipayClient.execute(request);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
    }

    /**
     * 退款
     * @param outTradeNo 商户订单号
     * @param refundAmount 退款金额
     * @return AlipayTradeRefundResponse
     */
    public AlipayTradeRefundResponse refundPay(String outTradeNo,String refundAmount){
        if (alipayClient == null) {
            alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, publicKey, signType);
        }
        AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
        AlipayTradeRefundModel model  = new AlipayTradeRefundModel();
        model.setOutTradeNo(outTradeNo);
        model.setRefundAmount(refundAmount);
        request.setBizModel(model);
        try {
            AlipayTradeRefundResponse response = alipayClient.execute(request);
            return response;
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    }
}
