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
     * 问诊记录uuId
     */
    private String userReservationUuId;

    /**
     * 医生id
     */
    @Column(name = "doctor_id")
    private Integer doctorId;

    /**
     * 用户退款原因
     */
    private String reason;

    /**
     * 拒绝退款原因
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
     * 预约时间
     */
    private String timeInterval;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "create_time")
    private Date createTime;

    private Integer isDelete;

    @Transient
    private String refundStatusName;

    @Transient
    private String clinicPrice;
}