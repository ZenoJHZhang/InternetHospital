package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class Refund {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 问诊记录ID
     */
    @Column(name = "reservation_id")
    private Integer reservationId;

    /**
     * 医生id
     */
    @Column(name = "doctor_id")
    private String doctorId;

    /**
     * 用户退款原因
     */
    private String reason;

    /**
     * 原因说明
     */
    private String state;

    /**
     * 拒绝
     */
    private String refuse;

    /**
     * 申请退款金额
     */
    private String price;

    /**
     * 同意退款金额
     */
    @Column(name = "agree_price")
    private String agreePrice;

    /**
     * 患者姓名
     */
    @Column(name = "patient_name")
    private String patientName;

    private String phone;

    /**
     * 科室名称
     */
    @Column(name = "dept_name")
    private String deptName;

    /**
     * 医生名称
     */
    @Column(name = "doctor_name")
    private String doctorName;

    /**
     * 就诊日期
     */
    @Column(name = "clinic_date")
    private String clinicDate;

    /**
     * 就诊时间
     */
    @Column(name = "clinic_time")
    private String clinicTime;

    /**
     * 预约时间 1 上午 2 下午 3 晚上
     */
    @Column(name = "time_type")
    private String timeType;

    /**
     * 退款备注
     */
    private String remark;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "create_time")
    private Date createTime;

    /**
     * 退款类型
     */
    private String type;
}