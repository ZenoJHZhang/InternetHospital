package com.zjh.internethospitalapi.service.pay;

import com.zjh.internethospitalapi.entity.RefundCorrelation;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 14:52
 */
public interface RefundService {

    /**
     * 通过订单id获取退款详情
     * @param outTradeNo 订单商户流水号
     * @return RefundCorrelation
     */
    RefundCorrelation getRefundCorrelationByOutTradeNo(String outTradeNo);
}
