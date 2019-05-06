package com.zjh.internethospitalservice.service.pay;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.OrderDetail;
import com.zjh.internethospitalapi.service.pay.OrderDetailService;
import com.zjh.internethospitalservice.mapper.OrderDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 12:33
 */
@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {


    private final OrderDetailMapper orderDetailMapper;

    @Autowired
    public OrderDetailServiceImpl(OrderDetailMapper orderDetailMapper) {
        this.orderDetailMapper = orderDetailMapper;
    }

    @Override
    public void updateOrderDetail(OrderDetail orderDetail) {
        orderDetail.setUpdateTime(new Date());
        orderDetailMapper.updateByPrimaryKeySelective(orderDetail);
    }

    @Override
    public void insertOrderDetail(OrderDetail orderDetail) {
        orderDetail.setUpdateTime(new Date());
        orderDetail.setCreateTime(new Date());
        orderDetailMapper.insertSelective(orderDetail);
    }

    @Override
    public void updateOrderDetailByOutTradeNo(String outTradeNo, OrderDetail orderDetail) {
        OrderDetail order = getOrderDetailByOutTradeNo(outTradeNo);
        if (order == null) {
            throw new InternetHospitalException(ExceptionConstants.ORDER_NOT_EXIST);
        }
        Integer orderId = order.getId();
        orderDetail.setId(orderId);
        orderDetail.setUpdateTime(new Date());
        orderDetailMapper.updateByPrimaryKeySelective(orderDetail);
    }

    @Override
    public OrderDetail getOrderDetailByOutTradeNo(String outTradeNo) {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOutTradeNo(outTradeNo);
        orderDetail.setIsDelete(0);
        orderDetail = orderDetailMapper.selectOne(orderDetail);
        if (orderDetail == null) {
            return null;
        } else {
            return orderDetail;
        }
    }

    @Override
    public OrderDetail getOrderDetailByUserReservationUuId(String userReservationUuId) {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setUserReservationUuId(userReservationUuId);
        orderDetail.setIsDelete(0);
        return orderDetailMapper.selectOne(orderDetail);
    }
}
