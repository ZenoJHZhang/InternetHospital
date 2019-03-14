package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Table(name = "schedule_department")
public class ScheduleDepartment {
    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 科室ID
     */
    @Column(name = "department_id")
    private Integer departmentId;

    /**
     * 上午是否有门诊1有0无
     */
    @Column(name = "morning_has")
    private String morningHas;

    /**
     * 早上是否停诊 0不停诊 1停诊
     */
    @Column(name = "morning_stop")
    private String morningStop;

    /**
     * 中午是否有门诊1有0无
     */
    @Column(name = "afternoon_has")
    private String afternoonHas;

    /**
     * 下午是否停诊 0不停诊 1停诊
     */
    @Column(name = "afternoon_stop")
    private String afternoonStop;

    /**
     * 晚上是否有门诊1有0无
     */
    @Column(name = "night_has")
    private String nightHas;

    /**
     * 晚上是否停诊 0不停诊 1停诊
     */
    @Column(name = "night_stop")
    private String nightStop;

    /**
     * 科室上午号源
     */
    @Column(name = "morning_number")
    private Integer morningNumber;

    /**
     * 科室下午号源
     */
    @Column(name = "afternoon_number")
    private Integer afternoonNumber;

    /**
     * 科室晚上号源
     */
    @Column(name = "night_number")
    private Integer nightNumber;

    /**
     * 早上总号源
     */
    @Column(name = "morning_total_number")
    private Integer morningTotalNumber;

    /**
     * 下午总号源
     */
    @Column(name = "afternoon_total_number")
    private Integer afternoonTotalNumber;

    /**
     * 晚上总号源
     */
    @Column(name = "night_total_number")
    private Integer nightTotalNumber;

    /**
     * 排班时间(2018-05-06)
     */
    @Column(name = "schedule_time")
    private String scheduleTime;

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

    private Integer isDelete;

    /**
     * 0 排班未开始 ；1 排班正在进行，无法删除 ;2 排班已结束
     * <p>
     * 两种情况会使排班开始 1：今天的排班会在0点自动开始 2：有第一个患者挂号的情况下，排班也会开始（用于避免预约排班被修改）
     * 排班过期即结束
     */
    private Integer isStart;

}