package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 手机号(管理员用户名)
     */
    private String phone;

    /**
     * 密码
     */
    private String password;

    /**
     * 管理员类型（0：医生管理员 ；1：用户管理员）
     */
    private Integer type;

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
     * 获取手机号(管理员用户名)
     *
     * @return phone - 手机号(管理员用户名)
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置手机号(管理员用户名)
     *
     * @param phone 手机号(管理员用户名)
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取管理员类型（0：医生管理员 ；1：用户管理员）
     *
     * @return type - 管理员类型（0：医生管理员 ；1：用户管理员）
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置管理员类型（0：医生管理员 ；1：用户管理员）
     *
     * @param type 管理员类型（0：医生管理员 ；1：用户管理员）
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取身份证号
     *
     * @return id_card - 身份证号
     */
    public String getIdCard() {
        return idCard;
    }

    /**
     * 设置身份证号
     *
     * @param idCard 身份证号
     */
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    /**
     * 获取真实姓名
     *
     * @return real_name - 真实姓名
     */
    public String getRealName() {
        return realName;
    }

    /**
     * 设置真实姓名
     *
     * @param realName 真实姓名
     */
    public void setRealName(String realName) {
        this.realName = realName;
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