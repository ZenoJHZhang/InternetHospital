package com.zjh.internethospitalapi.entity;

import lombok.Data;
import org.springframework.transaction.annotation.Transactional;

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

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    @Transient
    private Doctor doctor;
    /**
     * 特定时段所剩号源
     */
    @Transient
    private Integer timeIntervalNumber;
    @Transient
    private Department department;
}