package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class Diagnose {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 问诊记录uuid
     */
    private String userReservationUuId;

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

    private Date updateTime;
    
    /**
     * 处理
     */
    private String dispose;

    private Integer isDelete;
}