package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Refund {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "hospital_id")
    private String hospitalId;

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
     * @return hospital_id
     */
    public String getHospitalId() {
        return hospitalId;
    }

    /**
     * @param hospitalId
     */
    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
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
     * 获取医生id
     *
     * @return doctor_id - 医生id
     */
    public String getDoctorId() {
        return doctorId;
    }

    /**
     * 设置医生id
     *
     * @param doctorId 医生id
     */
    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * 获取用户退款原因
     *
     * @return reason - 用户退款原因
     */
    public String getReason() {
        return reason;
    }

    /**
     * 设置用户退款原因
     *
     * @param reason 用户退款原因
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * 获取原因说明
     *
     * @return state - 原因说明
     */
    public String getState() {
        return state;
    }

    /**
     * 设置原因说明
     *
     * @param state 原因说明
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * 获取拒绝
     *
     * @return refuse - 拒绝
     */
    public String getRefuse() {
        return refuse;
    }

    /**
     * 设置拒绝
     *
     * @param refuse 拒绝
     */
    public void setRefuse(String refuse) {
        this.refuse = refuse;
    }

    /**
     * 获取申请退款金额
     *
     * @return price - 申请退款金额
     */
    public String getPrice() {
        return price;
    }

    /**
     * 设置申请退款金额
     *
     * @param price 申请退款金额
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * 获取同意退款金额
     *
     * @return agree_price - 同意退款金额
     */
    public String getAgreePrice() {
        return agreePrice;
    }

    /**
     * 设置同意退款金额
     *
     * @param agreePrice 同意退款金额
     */
    public void setAgreePrice(String agreePrice) {
        this.agreePrice = agreePrice;
    }

    /**
     * 获取患者姓名
     *
     * @return patient_name - 患者姓名
     */
    public String getPatientName() {
        return patientName;
    }

    /**
     * 设置患者姓名
     *
     * @param patientName 患者姓名
     */
    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    /**
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取科室名称
     *
     * @return dept_name - 科室名称
     */
    public String getDeptName() {
        return deptName;
    }

    /**
     * 设置科室名称
     *
     * @param deptName 科室名称
     */
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    /**
     * 获取医生名称
     *
     * @return doctor_name - 医生名称
     */
    public String getDoctorName() {
        return doctorName;
    }

    /**
     * 设置医生名称
     *
     * @param doctorName 医生名称
     */
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    /**
     * 获取就诊日期
     *
     * @return clinic_date - 就诊日期
     */
    public String getClinicDate() {
        return clinicDate;
    }

    /**
     * 设置就诊日期
     *
     * @param clinicDate 就诊日期
     */
    public void setClinicDate(String clinicDate) {
        this.clinicDate = clinicDate;
    }

    /**
     * 获取就诊时间
     *
     * @return clinic_time - 就诊时间
     */
    public String getClinicTime() {
        return clinicTime;
    }

    /**
     * 设置就诊时间
     *
     * @param clinicTime 就诊时间
     */
    public void setClinicTime(String clinicTime) {
        this.clinicTime = clinicTime;
    }

    /**
     * 获取预约时间 1 上午 2 下午 3 晚上
     *
     * @return time_type - 预约时间 1 上午 2 下午 3 晚上
     */
    public String getTimeType() {
        return timeType;
    }

    /**
     * 设置预约时间 1 上午 2 下午 3 晚上
     *
     * @param timeType 预约时间 1 上午 2 下午 3 晚上
     */
    public void setTimeType(String timeType) {
        this.timeType = timeType;
    }

    /**
     * 获取退款备注
     *
     * @return remark - 退款备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置退款备注
     *
     * @param remark 退款备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
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
     * 获取退款类型
     *
     * @return type - 退款类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置退款类型
     *
     * @param type 退款类型
     */
    public void setType(String type) {
        this.type = type;
    }
}