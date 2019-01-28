package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户id，关联user表
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 身份证号
     */
    @Column(name = "id_card")
    private String idCard;

    /**
     * 真实姓名
     */
    @Column(name = "real_name")
    private String realName;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 出生日期 19961009
     */
    private String birth;
    /**
     * 性别 0 ：女 ；1： 男
     */
    private Integer sex;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    @Transient
    private Integer age;

    private Integer isDelete;
}