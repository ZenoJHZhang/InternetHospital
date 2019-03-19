package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Data
public class Doctor {
    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户表id
     */
    private Integer userId;

    /**
     * 医生工号
     */
    @Column(name = "doctor_number")
    private String doctorNumber;

    /**
     * 医生真实姓名
     */
    @Column(name = "doctor_name")
    private String doctorName;

    /**
     * 医生身份证
     */
    @Column(name = "doctor_id_card")
    private String doctorIdCard;

    /**
     * 手机号(不一定为登录账号，登录账号为初始注册手机号)
     */
    private String phone;


    /**
     * 医生职称（医师-医师）
     */
    @Column(name = "doctor_title")
    private String doctorTitle;

    /**
     * 医生头像id
     */
    @Column(name = "img_id")
    private Integer imgId;

    /**
     * 擅长
     */
    private String goodAt;

    /**
     * 医生所属科室数量
     */
    @Column(name = "dept_num")
    private Integer deptNum;

    /**
     * 排序  越大越前面
     */
    private Integer sort;

    /**
     * 医生星级
     */
    @Column(name = "star_level")
    private Integer starLevel;

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
     * 0 未删除 1 删除
     */
    private Integer isDelete;

    @Transient
    private String imgPath;

    @Transient
    private List<Department> departmentList;
}