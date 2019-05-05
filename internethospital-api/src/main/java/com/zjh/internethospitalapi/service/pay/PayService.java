package com.zjh.internethospitalapi.service.pay;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 20:37
 */
public interface PayService {

    /**
     * 新增订单
     * @param outTradeNo 商户流水号
     * @param userReservationUuId 就诊uuid
     * @param userId 用户id
     * @param payment  金额
     */
    void createWaitPay(String outTradeNo,String userReservationUuId,Integer userId,String payment);

    /**
     * 支付订单成功
     */
    void paySuccess(String outTradeNo,String userReservationUuId);

}
