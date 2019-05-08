package com.zjh.internethospitalapi.service.pay;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Refund;
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

    /**
     * 拒绝退款
     * @param refund 退款信息
     */
    void refuseRefund(Refund refund);

    /**
     * 同意退款
     * @param refund 退款信息
     * @param refundCorrelation 退款订单信息
     */
    void agreeRefund(Refund refund,RefundCorrelation refundCorrelation);

    /**
     * 根据就诊状态获取退款信息
     * @param status 就诊状态 -1 6 7 8 9
     * @param pageNo 页码
     * @param pageSize 页容量
     * @return PageInfo
     */
    PageInfo<Refund> listRefundByStatus(Integer status,Integer pageNo,Integer pageSize);
}
