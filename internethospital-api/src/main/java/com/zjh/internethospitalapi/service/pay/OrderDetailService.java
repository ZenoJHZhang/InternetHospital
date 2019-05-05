package com.zjh.internethospitalapi.service.pay;

import com.zjh.internethospitalapi.entity.OrderDetail;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 12:34
 */
public interface OrderDetailService {
    /**
     * 更新订单
     * @param orderDetail 订单
     */
    void updateOrderDetail(OrderDetail orderDetail);

    /**
     * 新增订单
     * @param orderDetail 订单
     */
    void insertOrderDetail(OrderDetail orderDetail);

    /**
     * 根据UuId获取订单
     * @param userReservationUuId 就诊UuId
     * @return OrderDetail
     */
    OrderDetail getOrderDetailByUserReservationUuId(String userReservationUuId);

    /**
     * 根据商户流水号更新
     * @param outTradeNo 商户流水号
     */
    void updateOrderDetailByOutTradeNo(String outTradeNo,OrderDetail orderDetail);

    /**
     * 根据商户流水号获取订单信息
     * @param outTradeNo 商户流水号
     * @return OrderDetail
     */
    OrderDetail getOrderDetailByOutTradeNo(String outTradeNo);
}
