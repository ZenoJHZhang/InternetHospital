package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class User {
    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 手机号（用户登录名）
     */
    private String phone;

    /**
     * 密码
     */
    private String password;

    /**
     * 身份证
     */
    @Column(name = "id_card")
    private String idCard;

    /**
     * 真实姓名
     */
    @Column(name = "real_name")
    private String realName;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 0 ：男 ；1： 女
     */
    private Integer sex;

    /**
     * 用户权限id
     */
    private Integer roleId;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;
}