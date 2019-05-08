package com.zjh.internethospitalapi.service.pay;

import com.zjh.internethospitalapi.entity.UserReservation;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 20:37
 */
public interface PayService {

    /**
     * 新增未扫码订单
     * @param outTradeNo 商户流水号
     * @param userReservationUuId 就诊uuid
     * @param userId 用户id
     * @param payment  金额
     */
    void createNotSweepCodeOrder(String outTradeNo, String userReservationUuId, Integer userId, String payment);

    /**
     * 支付订单成功,进行挂号
     */
    void paySuccess(String outTradeNo,String userReservationUuId);

    /**
     * 判断就诊记录是否超时，超时状态变为2
     * @param userReservationUuId 就诊记录UuId
     * @return true 超时 false 不超时
     */
    boolean isUserReservationTimeOut(String userReservationUuId);

    /**
     * 就诊超时 状态变为2
     * 有订单产生的话 订单变为超时 7
     * 调用支付宝api关闭订单 close
     * @param userReservationUuId uuId
     */
    void makeUserReservationTimeOut(String userReservationUuId);

    /**
     * 更新订单为待支付状态
     * @param outTradeNo
     */
    void waitPay(String outTradeNo);

    /**
     * 支付超时判断 二维码是否有效
     * @param userReservationUuId
     * @return true 支付超时 false 未超时
     */
    boolean isPayTimeOut(String userReservationUuId);

    /**
     * 退款
     * @param outTradeNo 商户流水号
     * @param refundAmount 退款金额
     */
    void refundPay(String outTradeNo,String refundAmount);
}
