package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Table(name = "season_time")
@Data
public class SeasonTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 医院ID
     */
    @Column(name = "hospital_id")
    private Integer hospitalId;

    /**
     * 名称
     */
    private String name;

    /**
     * 类型 0：夏令时 1：冬令时
     */
    private Integer type;

    /**
     * 开始日期
     */
    @Column(name = "start_date")
    private String startDate;

    /**
     * 结束日期
     */
    @Column(name = "end_date")
    private String endDate;

    /**
     * 早上开始时间
     */
    private String morningStart;

    /**
     * 早上结束时间
     */
    private String morningEnd;

    /**
     * 下午开始时间
     */
    private String afternoonStart;

    /**
     * 下午结束时间
     */
    private String afternoonEnd;

    /**
     * 晚上开始时间
     */
    private String nightStart;

    /**
     * 晚上结束时间
     */
    private String nightEnd;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

}