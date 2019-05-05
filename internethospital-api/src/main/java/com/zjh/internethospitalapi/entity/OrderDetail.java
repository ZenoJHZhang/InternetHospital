package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class OrderDetail {
    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * 商户订单号
     */
    private String outTradeNo;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private Integer userId;
    /**
     * 对应的就诊记录uuId
     */
    private String userReservationUuId;

    /**
     * 订单状态
     */
    private Integer status;

    /**
     * 订单金额
     */
    private String payment;

    /**
     * 订单完成时间
     */
    @Column(name = "end_time")
    private Date endTime;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;
}