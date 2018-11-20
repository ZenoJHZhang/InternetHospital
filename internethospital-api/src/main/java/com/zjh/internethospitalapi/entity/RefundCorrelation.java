package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "refund_correlation")
public class RefundCorrelation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 问诊记录ID
     */
    @Column(name = "reservation_id")
    private Integer reservationId;

    /**
     * 退款类型,1.微信。2.支付宝
     */
    @Column(name = "pay_type")
    private String payType;

    /**
     * 退款状态：1退款中  2退款成功  3退款失败
     */
    @Column(name = "pay_status")
    private String payStatus;

    /**
     * 价格
     */
    @Column(name = "total_payment")
    private String totalPayment;

    /**
     * 订单号
     */
    @Column(name = "order_id")
    private String orderId;

    /**
     * 支付宝或微信的流水号
     */
    @Column(name = "trade_no")
    private String tradeNo;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 是否删除 0.删除  1.未删除'
     */
    @Column(name = "is_delete")
    private String isDelete;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取问诊记录ID
     *
     * @return reservation_id - 问诊记录ID
     */
    public Integer getReservationId() {
        return reservationId;
    }

    /**
     * 设置问诊记录ID
     *
     * @param reservationId 问诊记录ID
     */
    public void setReservationId(Integer reservationId) {
        this.reservationId = reservationId;
    }

    /**
     * 获取退款类型,1.微信。2.支付宝
     *
     * @return pay_type - 退款类型,1.微信。2.支付宝
     */
    public String getPayType() {
        return payType;
    }

    /**
     * 设置退款类型,1.微信。2.支付宝
     *
     * @param payType 退款类型,1.微信。2.支付宝
     */
    public void setPayType(String payType) {
        this.payType = payType;
    }

    /**
     * 获取退款状态：1退款中  2退款成功  3退款失败
     *
     * @return pay_status - 退款状态：1退款中  2退款成功  3退款失败
     */
    public String getPayStatus() {
        return payStatus;
    }

    /**
     * 设置退款状态：1退款中  2退款成功  3退款失败
     *
     * @param payStatus 退款状态：1退款中  2退款成功  3退款失败
     */
    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    /**
     * 获取价格
     *
     * @return total_payment - 价格
     */
    public String getTotalPayment() {
        return totalPayment;
    }

    /**
     * 设置价格
     *
     * @param totalPayment 价格
     */
    public void setTotalPayment(String totalPayment) {
        this.totalPayment = totalPayment;
    }

    /**
     * 获取订单号
     *
     * @return order_id - 订单号
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 设置订单号
     *
     * @param orderId 订单号
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * 获取支付宝或微信的流水号
     *
     * @return trade_no - 支付宝或微信的流水号
     */
    public String getTradeNo() {
        return tradeNo;
    }

    /**
     * 设置支付宝或微信的流水号
     *
     * @param tradeNo 支付宝或微信的流水号
     */
    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
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

    /**
     * 获取是否删除 0.删除  1.未删除'
     *
     * @return is_delete - 是否删除 0.删除  1.未删除'
     */
    public String getIsDelete() {
        return isDelete;
    }

    /**
     * 设置是否删除 0.删除  1.未删除'
     *
     * @param isDelete 是否删除 0.删除  1.未删除'
     */
    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}