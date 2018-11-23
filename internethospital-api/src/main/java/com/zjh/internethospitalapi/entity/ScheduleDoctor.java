package com.zjh.internethospitalapi.entity;

import javax.persistence.*;
import java.util.Date;

@Table(name = "schedule_doctor")
public class ScheduleDoctor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 科室排班id
     */
    @Column(name = "schedule_department_id")
    private Integer scheduleDepartmentId;

    /**
     * 医生id
     */
    @Column(name = "doctor_id")
    private Integer doctorId;

    @Column(name = "doctor_morning_has")
    private String doctorMorningHas;

    @Column(name = "doctor_afternoon_has")
    private String doctorAfternoonHas;

    @Column(name = "doctor_night_has")
    private String doctorNightHas;

    @Column(name = "doctor_schedule_time")
    private String doctorScheduleTime;

    @Column(name = "doctor_morning_number")
    private Integer doctorMorningNumber;

    @Column(name = "doctor_afternoon_number")
    private Integer doctorAfternoonNumber;

    @Column(name = "doctor_night_number")
    private Integer doctorNightNumber;

    @Column(name = "doctor_morning_total_number")
    private Integer doctorMorningTotalNumber;

    @Column(name = "doctor_afternoon_total_number")
    private Integer doctorAfternoonTotalNumber;

    @Column(name = "doctor_night_total_number")
    private Integer doctorNightTotalNumber;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

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
     * 获取科室排班id
     *
     * @return schedule_department_id - 科室排班id
     */
    public Integer getScheduleDepartmentId() {
        return scheduleDepartmentId;
    }

    /**
     * 设置科室排班id
     *
     * @param scheduleDepartmentId 科室排班id
     */
    public void setScheduleDepartmentId(Integer scheduleDepartmentId) {
        this.scheduleDepartmentId = scheduleDepartmentId;
    }

    /**
     * 获取医生id
     *
     * @return doctor_id - 医生id
     */
    public Integer getDoctorId() {
        return doctorId;
    }

    /**
     * 设置医生id
     *
     * @param doctorId 医生id
     */
    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * @return doctor_morning_has
     */
    public String getDoctorMorningHas() {
        return doctorMorningHas;
    }

    /**
     * @param doctorMorningHas
     */
    public void setDoctorMorningHas(String doctorMorningHas) {
        this.doctorMorningHas = doctorMorningHas;
    }

    /**
     * @return doctor_afternoon_has
     */
    public String getDoctorAfternoonHas() {
        return doctorAfternoonHas;
    }

    /**
     * @param doctorAfternoonHas
     */
    public void setDoctorAfternoonHas(String doctorAfternoonHas) {
        this.doctorAfternoonHas = doctorAfternoonHas;
    }

    /**
     * @return doctor_night_has
     */
    public String getDoctorNightHas() {
        return doctorNightHas;
    }

    /**
     * @param doctorNightHas
     */
    public void setDoctorNightHas(String doctorNightHas) {
        this.doctorNightHas = doctorNightHas;
    }

    /**
     * @return doctor_schedule_time
     */
    public String getDoctorScheduleTime() {
        return doctorScheduleTime;
    }

    /**
     * @param doctorScheduleTime
     */
    public void setDoctorScheduleTime(String doctorScheduleTime) {
        this.doctorScheduleTime = doctorScheduleTime;
    }

    /**
     * @return doctor_morning_number
     */
    public Integer getDoctorMorningNumber() {
        return doctorMorningNumber;
    }

    /**
     * @param doctorMorningNumber
     */
    public void setDoctorMorningNumber(Integer doctorMorningNumber) {
        this.doctorMorningNumber = doctorMorningNumber;
    }

    /**
     * @return doctor_afternoon_number
     */
    public Integer getDoctorAfternoonNumber() {
        return doctorAfternoonNumber;
    }

    /**
     * @param doctorAfternoonNumber
     */
    public void setDoctorAfternoonNumber(Integer doctorAfternoonNumber) {
        this.doctorAfternoonNumber = doctorAfternoonNumber;
    }

    /**
     * @return doctor_night_number
     */
    public Integer getDoctorNightNumber() {
        return doctorNightNumber;
    }

    /**
     * @param doctorNightNumber
     */
    public void setDoctorNightNumber(Integer doctorNightNumber) {
        this.doctorNightNumber = doctorNightNumber;
    }

    /**
     * @return doctor_morning_total_number
     */
    public Integer getDoctorMorningTotalNumber() {
        return doctorMorningTotalNumber;
    }

    /**
     * @param doctorMorningTotalNumber
     */
    public void setDoctorMorningTotalNumber(Integer doctorMorningTotalNumber) {
        this.doctorMorningTotalNumber = doctorMorningTotalNumber;
    }

    /**
     * @return doctor_afternoon_total_number
     */
    public Integer getDoctorAfternoonTotalNumber() {
        return doctorAfternoonTotalNumber;
    }

    /**
     * @param doctorAfternoonTotalNumber
     */
    public void setDoctorAfternoonTotalNumber(Integer doctorAfternoonTotalNumber) {
        this.doctorAfternoonTotalNumber = doctorAfternoonTotalNumber;
    }

    /**
     * @return doctor_night_total_number
     */
    public Integer getDoctorNightTotalNumber() {
        return doctorNightTotalNumber;
    }

    /**
     * @param doctorNightTotalNumber
     */
    public void setDoctorNightTotalNumber(Integer doctorNightTotalNumber) {
        this.doctorNightTotalNumber = doctorNightTotalNumber;
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