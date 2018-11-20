package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Diagnose {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 问诊记录id
     */
    @Column(name = "reservation_id")
    private Integer reservationId;

    /**
     * 主诉
     */
    private String complain;

    /**
     * 现病史
     */
    @Column(name = "present_history")
    private String presentHistory;

    /**
     * 既往史
     */
    @Column(name = "past_history")
    private String pastHistory;

    /**
     * 过敏史
     */
    @Column(name = "allergic_history")
    private String allergicHistory;

    /**
     * 初步诊断
     */
    @Column(name = "first_diagnose")
    private String firstDiagnose;

    /**
     * 诊断意见
     */
    private String advice;

    @Column(name = "create_time")
    private Date createTime;

    /**
     * 处理
     */
    private String dispose;

    @Column(name = "doc_app")
    private String docApp;

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
     * 获取问诊记录id
     *
     * @return reservation_id - 问诊记录id
     */
    public Integer getReservationId() {
        return reservationId;
    }

    /**
     * 设置问诊记录id
     *
     * @param reservationId 问诊记录id
     */
    public void setReservationId(Integer reservationId) {
        this.reservationId = reservationId;
    }

    /**
     * 获取主诉
     *
     * @return complain - 主诉
     */
    public String getComplain() {
        return complain;
    }

    /**
     * 设置主诉
     *
     * @param complain 主诉
     */
    public void setComplain(String complain) {
        this.complain = complain;
    }

    /**
     * 获取现病史
     *
     * @return present_history - 现病史
     */
    public String getPresentHistory() {
        return presentHistory;
    }

    /**
     * 设置现病史
     *
     * @param presentHistory 现病史
     */
    public void setPresentHistory(String presentHistory) {
        this.presentHistory = presentHistory;
    }

    /**
     * 获取既往史
     *
     * @return past_history - 既往史
     */
    public String getPastHistory() {
        return pastHistory;
    }

    /**
     * 设置既往史
     *
     * @param pastHistory 既往史
     */
    public void setPastHistory(String pastHistory) {
        this.pastHistory = pastHistory;
    }

    /**
     * 获取过敏史
     *
     * @return allergic_history - 过敏史
     */
    public String getAllergicHistory() {
        return allergicHistory;
    }

    /**
     * 设置过敏史
     *
     * @param allergicHistory 过敏史
     */
    public void setAllergicHistory(String allergicHistory) {
        this.allergicHistory = allergicHistory;
    }

    /**
     * 获取初步诊断
     *
     * @return first_diagnose - 初步诊断
     */
    public String getFirstDiagnose() {
        return firstDiagnose;
    }

    /**
     * 设置初步诊断
     *
     * @param firstDiagnose 初步诊断
     */
    public void setFirstDiagnose(String firstDiagnose) {
        this.firstDiagnose = firstDiagnose;
    }

    /**
     * 获取诊断意见
     *
     * @return advice - 诊断意见
     */
    public String getAdvice() {
        return advice;
    }

    /**
     * 设置诊断意见
     *
     * @param advice 诊断意见
     */
    public void setAdvice(String advice) {
        this.advice = advice;
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
     * 获取处理
     *
     * @return dispose - 处理
     */
    public String getDispose() {
        return dispose;
    }

    /**
     * 设置处理
     *
     * @param dispose 处理
     */
    public void setDispose(String dispose) {
        this.dispose = dispose;
    }

    /**
     * @return doc_app
     */
    public String getDocApp() {
        return docApp;
    }

    /**
     * @param docApp
     */
    public void setDocApp(String docApp) {
        this.docApp = docApp;
    }
}