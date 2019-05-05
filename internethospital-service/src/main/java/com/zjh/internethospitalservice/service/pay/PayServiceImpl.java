package com.zjh.internethospitalservice.service.pay;

import com.zjh.internethospitalapi.common.constants.PayStatusConstants;
import com.zjh.internethospitalapi.entity.OrderDetail;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalapi.service.pay.OrderDetailService;
import com.zjh.internethospitalapi.service.pay.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 20:38
 */
@Service("payService")
public class PayServiceImpl implements PayService {

    private final OrderDetailService orderDetailService;
    private final UserReservationService userReservationService;

    @Autowired
    public PayServiceImpl(OrderDetailService orderDetailService, UserReservationService userReservationService) {
        this.orderDetailService = orderDetailService;
        this.userReservationService = userReservationService;
    }

    @Override
    public void paySuccess(String outTradeNo, String userReservationUuId) {
        //更新订单信息
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setEndTime(new Date());
        orderDetail.setStatus(PayStatusConstants.PAY_SUCCESS);
        orderDetailService.updateOrderDetailByOutTradeNo(outTradeNo, orderDetail);
        //更新就诊信息
        UserReservation userReservation = new UserReservation();
        //已付款等待视频
        userReservation.setStatus(4);
        //挂号费支付状态修改
        userReservation.setClinicPayStatus("1");
        userReservation.setUuId(userReservationUuId);
        userReservationService.updateUserReservationSelective(userReservation);
    }

    @Override
    public void createWaitPay(String outTradeNo, String userReservationUuId, Integer userId,String payment) {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOutTradeNo(outTradeNo);
        orderDetail.setStatus(PayStatusConstants.WAIT_PAY);
        orderDetail.setUserId(userId);
        orderDetail.setUserReservationUuId(userReservationUuId);
        orderDetail.setPayment(payment);
        orderDetailService.insertOrderDetail(orderDetail);
    }
}
