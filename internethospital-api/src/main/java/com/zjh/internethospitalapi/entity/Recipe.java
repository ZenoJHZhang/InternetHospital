package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "hospital_id")
    private Integer hospitalId;

    /**
     * 问诊记录id
     */
    @Column(name = "reservation_id")
    private Integer reservationId;

    /**
     * 开处方的医生id
     */
    @Column(name = "doctor_id")
    private Integer doctorId;

    /**
     * 处方名称
     */
    private String name;

    /**
     * 处方总价
     */
    private Long price;

    /**
     * 0未审核，1已审核，2未通过
     */
    private Integer status;

    /**
     * 处方审核医生id
     */
    @Column(name = "audit_doctor_id")
    private Integer auditDoctorId;

    /**
     * 处方未通过原因原因
     */
    private String reason;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "create_time")
    private Date createTime;

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
    public Integer getHospitalId() {
        return hospitalId;
    }

    /**
     * @param hospitalId
     */
    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
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
     * 获取开处方的医生id
     *
     * @return doctor_id - 开处方的医生id
     */
    public Integer getDoctorId() {
        return doctorId;
    }

    /**
     * 设置开处方的医生id
     *
     * @param doctorId 开处方的医生id
     */
    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * 获取处方名称
     *
     * @return name - 处方名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置处方名称
     *
     * @param name 处方名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取处方总价
     *
     * @return price - 处方总价
     */
    public Long getPrice() {
        return price;
    }

    /**
     * 设置处方总价
     *
     * @param price 处方总价
     */
    public void setPrice(Long price) {
        this.price = price;
    }

    /**
     * 获取0未审核，1已审核，2未通过
     *
     * @return status - 0未审核，1已审核，2未通过
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置0未审核，1已审核，2未通过
     *
     * @param status 0未审核，1已审核，2未通过
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取处方审核医生id
     *
     * @return audit_doctor_id - 处方审核医生id
     */
    public Integer getAuditDoctorId() {
        return auditDoctorId;
    }

    /**
     * 设置处方审核医生id
     *
     * @param auditDoctorId 处方审核医生id
     */
    public void setAuditDoctorId(Integer auditDoctorId) {
        this.auditDoctorId = auditDoctorId;
    }

    /**
     * 获取处方未通过原因原因
     *
     * @return reason - 处方未通过原因原因
     */
    public String getReason() {
        return reason;
    }

    /**
     * 设置处方未通过原因原因
     *
     * @param reason 处方未通过原因原因
     */
    public void setReason(String reason) {
        this.reason = reason;
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
}