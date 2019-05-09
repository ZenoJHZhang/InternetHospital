package com.zjh.internethospitalapi.entity;

import com.zjh.internethospitalapi.dto.DoctorDto;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
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
     * 科室id
     */
    @Column(name = "department_id")
    private Integer departmentId;
    /**
     * 科室名
     */
    private String departmentName;
    /**
     * 医生id
     */
    @Column(name = "doctor_id")
    private Integer doctorId;

    private String doctorName;
    @Column(name = "doctor_morning_has")
    private String doctorMorningHas;

    @Column(name = "doctor_afternoon_has")
    private String doctorAfternoonHas;

    @Column(name = "doctor_night_has")
    private String doctorNightHas;

    private String scheduleTime;

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

    private Integer type;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;

    /**
     * 0 排班未开始 ；1 排班正在进行，无法删除 ;2 排班已结束
     * <p>
     * 两种情况会使排班开始 1：今天的排班会在0点自动开始 2：有第一个患者挂号的情况下，排班也会开始（用于避免预约排班被修改）
     * 排班过期即结束
     */
    private Integer isMorningStart;
    private Integer isAfternoonStart;
    private Integer isNightStart;

    /**
     * 特定时段所剩号源
     */
    @Transient
    private Integer timeIntervalNumber;
    @Transient
    private Department department;
    @Transient
    private DoctorDto doctorDto;

}