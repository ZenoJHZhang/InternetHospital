package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Doctor {
    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 所属医院ID
     */
    @Column(name = "hospital_id")
    private Integer hospitalId;

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
    @Column(name = "doctor_idcard")
    private String doctorIdcard;

    /**
     * 手机号(登录账号)
     */
    private String phone;

    /**
     * 用户登录密码
     */
    private String password;

    /**
     * 医生职称（医师-医师）
     */
    @Column(name = "doctor_title")
    private String doctorTitle;

    /**
     * 医生头像uuid
     */
    @Column(name = "doctor_img_id")
    private String doctorImgId;

    /**
     * 擅长
     */
    private String goodat;

    /**
     * 医生所属科室数量
     */
    @Column(name = "dept_num")
    private String deptNum;

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
     * 获取id
     *
     * @return id - id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取所属医院ID
     *
     * @return hospital_id - 所属医院ID
     */
    public Integer getHospitalId() {
        return hospitalId;
    }

    /**
     * 设置所属医院ID
     *
     * @param hospitalId 所属医院ID
     */
    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    /**
     * 获取医生工号
     *
     * @return doctor_number - 医生工号
     */
    public String getDoctorNumber() {
        return doctorNumber;
    }

    /**
     * 设置医生工号
     *
     * @param doctorNumber 医生工号
     */
    public void setDoctorNumber(String doctorNumber) {
        this.doctorNumber = doctorNumber;
    }

    /**
     * 获取医生真实姓名
     *
     * @return doctor_name - 医生真实姓名
     */
    public String getDoctorName() {
        return doctorName;
    }

    /**
     * 设置医生真实姓名
     *
     * @param doctorName 医生真实姓名
     */
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    /**
     * 获取医生身份证
     *
     * @return doctor_idcard - 医生身份证
     */
    public String getDoctorIdcard() {
        return doctorIdcard;
    }

    /**
     * 设置医生身份证
     *
     * @param doctorIdcard 医生身份证
     */
    public void setDoctorIdcard(String doctorIdcard) {
        this.doctorIdcard = doctorIdcard;
    }

    /**
     * 获取手机号(登录账号)
     *
     * @return phone - 手机号(登录账号)
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置手机号(登录账号)
     *
     * @param phone 手机号(登录账号)
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取用户登录密码
     *
     * @return password - 用户登录密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置用户登录密码
     *
     * @param password 用户登录密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取医生职称（医师-医师）
     *
     * @return doctor_title - 医生职称（医师-医师）
     */
    public String getDoctorTitle() {
        return doctorTitle;
    }

    /**
     * 设置医生职称（医师-医师）
     *
     * @param doctorTitle 医生职称（医师-医师）
     */
    public void setDoctorTitle(String doctorTitle) {
        this.doctorTitle = doctorTitle;
    }

    /**
     * 获取医生头像uuid
     *
     * @return doctor_img_id - 医生头像uuid
     */
    public String getDoctorImgId() {
        return doctorImgId;
    }

    /**
     * 设置医生头像uuid
     *
     * @param doctorImgId 医生头像uuid
     */
    public void setDoctorImgId(String doctorImgId) {
        this.doctorImgId = doctorImgId;
    }

    /**
     * 获取擅长
     *
     * @return goodat - 擅长
     */
    public String getGoodat() {
        return goodat;
    }

    /**
     * 设置擅长
     *
     * @param goodat 擅长
     */
    public void setGoodat(String goodat) {
        this.goodat = goodat;
    }

    /**
     * 获取医生所属科室数量
     *
     * @return dept_num - 医生所属科室数量
     */
    public String getDeptNum() {
        return deptNum;
    }

    /**
     * 设置医生所属科室数量
     *
     * @param deptNum 医生所属科室数量
     */
    public void setDeptNum(String deptNum) {
        this.deptNum = deptNum;
    }

    /**
     * 获取排序  越大越前面
     *
     * @return sort - 排序  越大越前面
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * 设置排序  越大越前面
     *
     * @param sort 排序  越大越前面
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 获取医生星级
     *
     * @return star_level - 医生星级
     */
    public Integer getStarLevel() {
        return starLevel;
    }

    /**
     * 设置医生星级
     *
     * @param starLevel 医生星级
     */
    public void setStarLevel(Integer starLevel) {
        this.starLevel = starLevel;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取更新时间
     *
     * @return update_time - 更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更新时间
     *
     * @param updateTime 更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}