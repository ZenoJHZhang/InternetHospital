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
    private Integer imgId;

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
    private Integer deptType;

    /**
     * 排序  越大越前面
     */
    private Integer sort;

    /**
     * 科室介绍
     */
    private String introduce;

    private Integer isDelete;

    /**
     * 图片全路径
     */
    @Transient
    private String imgPath;

    /**
     * 剩余号源数
     */
    @Transient
    private Integer timeExistNumber;
}