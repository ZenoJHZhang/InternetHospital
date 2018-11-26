package com.zjh.internethospitalapi.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department {
    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 医院ID
     */
    @Column(name = "hospital_id")
    private String hospitalId;

    /**
     * 科室编号
     */
    @Column(name = "department_number")
    private String departmentNumber;

    /**
     * 科室名称
     */
    @Column(name = "department_name")
    private String departmentName;

    /**
     * 科室电话
     */
    private String phone;

    /**
     * 科室图片id
     */
    private String img_id;

    /**
     * 科室人数
     */
    @Column(name = "count_of_people")
    private String countOfPeople;

    /**
     * 上午是否可挂号1为可以0为不可以
     */
    @Column(name = "morning_is_order")
    private String morningIsOrder;

    /**
     * 上午号源数
     */
    @Column(name = "morning_source")
    private Integer morningSource;

    /**
     * 下午是否可挂号1为可以0为不可以
     */
    @Column(name = "afternoon_is_order")
    private String afternoonIsOrder;

    /**
     * 下午号源数
     */
    @Column(name = "afternoon_source")
    private Integer afternoonSource;

    /**
     * 晚上是否可挂号1为可以0为不可以
     */
    @Column(name = "night_is_order")
    private String nightIsOrder;

    /**
     * 晚上号源数
     */
    @Column(name = "night_source")
    private Integer nightSource;

    /**
     * 科室挂号价格
     */
    private String price;

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
     * 科室类型1为专家科室0为普通科室
     */
    @Column(name = "dept_type")
    private String deptType;

    /**
     * 排序  越大越前面
     */
    private Integer sort;

    /**
     * 科室介绍
     */
    private String introduce;
}