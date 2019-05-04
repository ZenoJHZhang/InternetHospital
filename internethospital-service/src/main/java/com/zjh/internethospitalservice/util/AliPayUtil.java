package com.zjh.internethospitalservice.util;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.*;
import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.request.*;
import com.alipay.api.response.*;
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

    public AlipayTradePrecreateResponse preCreatePay(String amount){
        if (alipayClient==null){
            alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, publicKey, signType);
        }
        AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();
        AlipayTradePrecreateModel model = new AlipayTradePrecreateModel();
        model.setBody("问诊费");
        model.setSubject("蜗牛医疗");
        model.setTotalAmount(amount);
        model.setSellerId("2088102177938345");
        model.setOutTradeNo(UUID.randomUUID().toString());
        request.setBizModel(model);
        try {
            AlipayTradePrecreateResponse response = alipayClient.execute(request);
            return response;
        } catch (AlipayApiException e) {
            e.printStackTrace();
            return null;
        }
    }

    public  AlipayTradeQueryResponse getPayStatus(String outTradeNo){
        if (alipayClient==null){
            alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, publicKey, signType);
        }
        AlipayTradeQueryRequest  request = new AlipayTradeQueryRequest();
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
}
