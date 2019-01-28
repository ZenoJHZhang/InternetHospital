package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 对应的就诊记录id
     */
    @Column(name = "reservation_id")
    private Integer reservationId;

    /**
     * 订单状态
     */
    private Integer status;

    /**
     * 订单金额
     */
    private Long payment;

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