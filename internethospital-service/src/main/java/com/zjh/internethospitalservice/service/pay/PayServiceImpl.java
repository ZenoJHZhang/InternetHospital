package com.zjh.internethospitalservice.service.pay;

import com.zjh.internethospitalapi.common.constants.PayStatusConstants;
import com.zjh.internethospitalapi.entity.OrderDetail;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalapi.service.pay.OrderDetailService;
import com.zjh.internethospitalapi.service.pay.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
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
    private final StringRedisTemplate stringRedisTemplate;

    @Autowired
    public PayServiceImpl(OrderDetailService orderDetailService, UserReservationService userReservationService, StringRedisTemplate stringRedisTemplate) {
        this.orderDetailService = orderDetailService;
        this.userReservationService = userReservationService;
        this.stringRedisTemplate = stringRedisTemplate;
    }

    @Override
    public boolean isUserReservationTimeOut(String userReservationUuId) {
        UserReservation userReservation = userReservationService.getUserReservationByUuId(userReservationUuId);
        Integer type = userReservation.getType();
        if (type.equals(1)){
            String s = stringRedisTemplate.opsForValue().get("当天挂号" + userReservationUuId);
            return s == null;
        }
        else {
            String scheduleTime = stringRedisTemplate.opsForValue().get("预约" + userReservationUuId);
            if (scheduleTime != null){
                LocalDate parse = LocalDate.parse(scheduleTime);
                int i = parse.minusDays(1).compareTo(LocalDate.now());
                if(i < 0){
                    stringRedisTemplate.delete("预约" + userReservationUuId);
                }
                return i < 0;
            }
            else {
                return true;
            }
        }
    }

    @Override
    public void makeUserReservationTimeOut(String userReservationUuId) {
        UserReservation userReservation = userReservationService.getUserReservationByUuId(userReservationUuId);
        userReservation.setStatus(2);
        userReservation.setUpdateTime(new Date());
        userReservationService.updateUserReservationSelective(userReservation);
        if (userReservation.getType().equals(1)){
            stringRedisTemplate.delete("当天挂号"+userReservationUuId);
        }
        else {
            stringRedisTemplate.delete("预约"+userReservationUuId);
        }
        OrderDetail orderDetail = orderDetailService.getOrderDetailByUserReservationUuId(userReservationUuId);
        if (orderDetail != null){
            orderDetail.setStatus(PayStatusConstants.PAY_TIMEOUT);
            orderDetailService.updateOrderDetail(orderDetail);
        }
    }

    @Override
    public void paySuccess(String outTradeNo, String userReservationUuId) {
        //更新订单信息
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setEndTime(new Date());
        orderDetail.setStatus(PayStatusConstants.PAY_SUCCESS);
        orderDetailService.updateOrderDetailByOutTradeNo(outTradeNo, orderDetail);

        //更新就诊信息
        UserReservation userReservation = userReservationService.getUserReservationByUuId(userReservationUuId);
        //已付款等待视频
        userReservation.setStatus(4);
        //挂号费支付状态修改
        userReservation.setClinicPayStatus("1");

        //专家科室排班更新，并更新regNo
        if(userReservation.getType().equals(3)){
           userReservationService.appointmentExpert(userReservation);
        }
        //普通科室排班更新，并更新regNo
        else {
            userReservationService.appointmentNormal(userReservation,userReservation.getScheduleDepartmentId());
        }

        userReservationService.updateUserReservationSelective(userReservation);
    }

    @Override
    public void createNotSweepCodeOrder(String outTradeNo, String userReservationUuId, Integer userId, String payment) {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOutTradeNo(outTradeNo);
        orderDetail.setStatus(PayStatusConstants.NOT_SWEEP_CODE);
        orderDetail.setUserId(userId);
        orderDetail.setUserReservationUuId(userReservationUuId);
        orderDetail.setPayment(payment);
        orderDetailService.insertOrderDetail(orderDetail);
    }

    @Override
    public void waitPay(String outTradeNo) {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setStatus(PayStatusConstants.WAIT_PAY);
        orderDetailService.updateOrderDetailByOutTradeNo(outTradeNo, orderDetail);
    }

    @Override
    public boolean isPayTimeOut(String userReservationUuId) {
        String s = stringRedisTemplate.opsForValue().get("二维码" + userReservationUuId);
        return s == null;
    }
}
