package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

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

    /**
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取对应的就诊记录id
     *
     * @return reservation_id - 对应的就诊记录id
     */
    public Integer getReservationId() {
        return reservationId;
    }

    /**
     * 设置对应的就诊记录id
     *
     * @param reservationId 对应的就诊记录id
     */
    public void setReservationId(Integer reservationId) {
        this.reservationId = reservationId;
    }

    /**
     * 获取订单状态
     *
     * @return status - 订单状态
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置订单状态
     *
     * @param status 订单状态
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取订单金额
     *
     * @return payment - 订单金额
     */
    public Long getPayment() {
        return payment;
    }

    /**
     * 设置订单金额
     *
     * @param payment 订单金额
     */
    public void setPayment(Long payment) {
        this.payment = payment;
    }

    /**
     * 获取订单完成时间
     *
     * @return end_time - 订单完成时间
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * 设置订单完成时间
     *
     * @param endTime 订单完成时间
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return update_time
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * @param updateTime
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}