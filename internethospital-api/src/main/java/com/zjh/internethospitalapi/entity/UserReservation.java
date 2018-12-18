package com.zjh.internethospitalapi.entity;

import lombok.Data;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.code.IdentityDialect;

import javax.persistence.*;
import java.util.Date;

@Data
@Table(name = "user_reservation")
public class UserReservation {
    @Id
    @KeySql(dialect = IdentityDialect.MYSQL)
    private Integer id;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 就诊人id
     */
    @Column(name = "patient_id")
    private Integer patientId;

    /**
     * 患者姓名
     */
    @Column(name = "patient_name")
    private String patientName;

    /**
     * 医院id
     */
    @Column(name = "hospital_id")
    private Integer hospitalId;

    /**
     * 排班医生id
     */
    @Column(name = "schedule_doctor_id")
    private Integer scheduleDoctorId;
    /**
     * 排班科室id
     */
    private Integer scheduleDepartmentId;
    /**
     *  预约类型 1普通挂号 2普通预约 3 专家预约
     */
    private Integer type;

    /**
     * 医生id
     */
    @Column(name = "doctor_id")
    private Integer doctorId;

    /**
     * 医生姓名
     */
    @Column(name = "doctor_name")
    private String doctorName;

    /**
     * 科室id
     */
    private Integer departmentId;

    /**
     * 科室名称
     */
    private String departmentName;

    /**
     * 就诊序号(对应医生就诊序号)
     */
    @Column(name = "reg_no")
    private Integer regNo;

    /**
     * 就诊时间,根据令时得出（12:00-18:00）
     */
    @Column(name = "clinic_time")
    private String clinicTime;

    /**
     * 就诊日期
     */
    @Column(name = "clinic_date")
    private String clinicDate;

    /**
     * 预约时间段 上午  下午 晚上
     */
    private String timeInterval;

    /**
     * 问诊开始时间
     */
    @Column(name = "start_time")
    private Date startTime;

    /**
     * 问诊结束时间
     */
    @Column(name = "finish_time")
    private Date finishTime;

    /**
     * 问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）
     */
    private String status;

    /**
     * 取号返回的错误信息（预约/挂号）
     */
    private String errorMsg;

    /**
     * 是否被点击查看0未被，1已被点击
     */
    @Column(name = "is_click")
    private String isClick;

    /**
     * 是否评价，0未评价，1已评价
     */
    @Column(name = "is_evaluate")
    private String isEvaluate;

    /**
     * 挂号费支付状态
     */
    @Column(name = "clinic_pay_status")
    private String clinicPayStatus;

    /**
     * 处方支付状态 0未支付 1已支付
     */
    @Column(name = "recipe_pay_status")
    private String recipePayStatus;

    /**
     * 挂号费
     */
    @Column(name = "clinic_price")
    private String clinicPrice;

    /**
     * 问诊包含的处方单数量
     */
    @Column(name = "recipe_number")
    private Integer recipeNumber;

    /**
     * 处方费（所有处方的总费用）
     */
    @Column(name = "recipe_price")
    private String recipePrice;

    /**
     * 总费用(挂号处方)
     */
    @Column(name = "total_price")
    private String totalPrice;

    /**
     * 处方是否审核  0未审核，1已审核
     */
    @Column(name = "is_audit")
    private String isAudit;

    /**
     * 处方审核状态 1不通过 2已通过
     */
    @Column(name = "audit_status")
    private String auditStatus;

    /**
     * 是否可以编辑处方 1可以 0不可以
     */
    @Column(name = "is_read")
    private String isRead;

    /**
     * 处方审核不通过的原因
     */
    private String examineFailReason;

    /**
     * 医生设置过号的原因
     */
    private String skipReason;

    /**
     * 是否为复诊患者,0不是1是
     */
    @Column(name = "is_return_visit")
    private String isReturnVisit;

    /**
     * 叫号时间
     */
    @Column(name = "call_number_time")
    private Date callNumberTime;

    /**
     * 1拒绝退款，0未拒绝
     */
    private String repulse;

    /**
     * 取消就诊原因
     */
    @Column(name = "cancel_reason")
    private String cancelReason;

    /**
     * 订单id
     */
    @Column(name = "order_id")
    private String orderId;

    /**
     * 是否第一次进入候诊间 0不是 1是
     */
    @Column(name = "first_waitroom")
    private String firstWaitroom;

    /**
     * 诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）
     */
    @Column(name = "clinic_type")
    private String clinicType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 病情描述
     */
    @Column(name = "condition_desc")
    private String conditionDesc;
}