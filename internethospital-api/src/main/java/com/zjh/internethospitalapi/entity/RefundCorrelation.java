package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
@Table(name = "refund_correlation")
public class RefundCorrelation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 问诊记录uuId
     */
    private String userReservationUuId;

    /**
     * 退款类型,1.微信。2.支付宝
     */
    @Column(name = "pay_type")
    private String payType;

    /**
     * 退款状态：1退款中  2退款成功  3退款失败
     */
    private String refundStatus;

    /**
     * 价格
     */
    @Column(name = "total_payment")
    private String totalPayment;

    /**
     * 订单号
     */
    @Column(name = "order_id")
    private Integer orderId;

    /**
     * 商户交易流水号
     */
    private String outTradeNo;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;

}