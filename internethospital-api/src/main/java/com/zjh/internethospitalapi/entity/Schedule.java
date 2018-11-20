package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Schedule {
    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "hospital_id")
    private String hospitalId;

    /**
     * 科室ID
     */
    @Column(name = "department_id")
    private Integer departmentId;

    /**
     * 医生ID
     */
    @Column(name = "doctor_id")
    private Integer doctorId;

    /**
     * 挂号费用
     */
    private String price;

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
     * 上午号源
     */
    @Column(name = "morning_number")
    private Integer morningNumber;

    /**
     * 下午号源
     */
    @Column(name = "afternoon_number")
    private Integer afternoonNumber;

    /**
     * 晚上号源
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
     * 状态0为已删除1为已创建
     */
    private Boolean status;

    /**
     * 是否是自由排班 ‘1’普通排班  ‘2’自由排班
     */
    private String type;

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
     * 晚上是否为自由排班1是0否
     */
    @Column(name = "nig_free_type")
    private String nigFreeType;

    /**
     * 下午是否为自由排班1是0否
     */
    @Column(name = "aft_free_type")
    private String aftFreeType;

    /**
     * 早上是否为自由排班
     */
    @Column(name = "mor_free_type")
    private String morFreeType;

    /**
     * 自由排班早上号源
     */
    @Column(name = "mor_free_num")
    private Integer morFreeNum;

    /**
     * 自由排班早上总号源
     */
    @Column(name = "mor_free_top")
    private Integer morFreeTop;

    /**
     * 自由排班下午号源
     */
    @Column(name = "aft_free_num")
    private Integer aftFreeNum;

    /**
     * 自由排班下午总号源
     */
    @Column(name = "aft_free_top")
    private Integer aftFreeTop;

    /**
     * 自由排班晚上号源
     */
    @Column(name = "nig_free_num")
    private Integer nigFreeNum;

    /**
     * 自由排班晚上总号源
     */
    @Column(name = "nig_free_top")
    private Integer nigFreeTop;

    /**
     * 早上挂号时间
     */
    @Column(name = "free_mor_time")
    private String freeMorTime;

    /**
     * 下午挂号时间
     */
    @Column(name = "free_aft_time")
    private String freeAftTime;

    /**
     * 晚上挂号时间
     */
    @Column(name = "free_nig_time")
    private String freeNigTime;

    /**
     * 获取ID
     *
     * @return id - ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置ID
     *
     * @param id ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return hospital_id
     */
    public String getHospitalId() {
        return hospitalId;
    }

    /**
     * @param hospitalId
     */
    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
    }

    /**
     * 获取科室ID
     *
     * @return department_id - 科室ID
     */
    public Integer getDepartmentId() {
        return departmentId;
    }

    /**
     * 设置科室ID
     *
     * @param departmentId 科室ID
     */
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * 获取医生ID
     *
     * @return doctor_id - 医生ID
     */
    public Integer getDoctorId() {
        return doctorId;
    }

    /**
     * 设置医生ID
     *
     * @param doctorId 医生ID
     */
    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * 获取挂号费用
     *
     * @return price - 挂号费用
     */
    public String getPrice() {
        return price;
    }

    /**
     * 设置挂号费用
     *
     * @param price 挂号费用
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * 获取上午是否有门诊1有0无
     *
     * @return morning_has - 上午是否有门诊1有0无
     */
    public String getMorningHas() {
        return morningHas;
    }

    /**
     * 设置上午是否有门诊1有0无
     *
     * @param morningHas 上午是否有门诊1有0无
     */
    public void setMorningHas(String morningHas) {
        this.morningHas = morningHas;
    }

    /**
     * 获取早上是否停诊 0不停诊 1停诊
     *
     * @return morning_stop - 早上是否停诊 0不停诊 1停诊
     */
    public String getMorningStop() {
        return morningStop;
    }

    /**
     * 设置早上是否停诊 0不停诊 1停诊
     *
     * @param morningStop 早上是否停诊 0不停诊 1停诊
     */
    public void setMorningStop(String morningStop) {
        this.morningStop = morningStop;
    }

    /**
     * 获取中午是否有门诊1有0无
     *
     * @return afternoon_has - 中午是否有门诊1有0无
     */
    public String getAfternoonHas() {
        return afternoonHas;
    }

    /**
     * 设置中午是否有门诊1有0无
     *
     * @param afternoonHas 中午是否有门诊1有0无
     */
    public void setAfternoonHas(String afternoonHas) {
        this.afternoonHas = afternoonHas;
    }

    /**
     * 获取下午是否停诊 0不停诊 1停诊
     *
     * @return afternoon_stop - 下午是否停诊 0不停诊 1停诊
     */
    public String getAfternoonStop() {
        return afternoonStop;
    }

    /**
     * 设置下午是否停诊 0不停诊 1停诊
     *
     * @param afternoonStop 下午是否停诊 0不停诊 1停诊
     */
    public void setAfternoonStop(String afternoonStop) {
        this.afternoonStop = afternoonStop;
    }

    /**
     * 获取晚上是否有门诊1有0无
     *
     * @return night_has - 晚上是否有门诊1有0无
     */
    public String getNightHas() {
        return nightHas;
    }

    /**
     * 设置晚上是否有门诊1有0无
     *
     * @param nightHas 晚上是否有门诊1有0无
     */
    public void setNightHas(String nightHas) {
        this.nightHas = nightHas;
    }

    /**
     * 获取晚上是否停诊 0不停诊 1停诊
     *
     * @return night_stop - 晚上是否停诊 0不停诊 1停诊
     */
    public String getNightStop() {
        return nightStop;
    }

    /**
     * 设置晚上是否停诊 0不停诊 1停诊
     *
     * @param nightStop 晚上是否停诊 0不停诊 1停诊
     */
    public void setNightStop(String nightStop) {
        this.nightStop = nightStop;
    }

    /**
     * 获取上午号源
     *
     * @return morning_number - 上午号源
     */
    public Integer getMorningNumber() {
        return morningNumber;
    }

    /**
     * 设置上午号源
     *
     * @param morningNumber 上午号源
     */
    public void setMorningNumber(Integer morningNumber) {
        this.morningNumber = morningNumber;
    }

    /**
     * 获取下午号源
     *
     * @return afternoon_number - 下午号源
     */
    public Integer getAfternoonNumber() {
        return afternoonNumber;
    }

    /**
     * 设置下午号源
     *
     * @param afternoonNumber 下午号源
     */
    public void setAfternoonNumber(Integer afternoonNumber) {
        this.afternoonNumber = afternoonNumber;
    }

    /**
     * 获取晚上号源
     *
     * @return night_number - 晚上号源
     */
    public Integer getNightNumber() {
        return nightNumber;
    }

    /**
     * 设置晚上号源
     *
     * @param nightNumber 晚上号源
     */
    public void setNightNumber(Integer nightNumber) {
        this.nightNumber = nightNumber;
    }

    /**
     * 获取早上总号源
     *
     * @return morning_total_number - 早上总号源
     */
    public Integer getMorningTotalNumber() {
        return morningTotalNumber;
    }

    /**
     * 设置早上总号源
     *
     * @param morningTotalNumber 早上总号源
     */
    public void setMorningTotalNumber(Integer morningTotalNumber) {
        this.morningTotalNumber = morningTotalNumber;
    }

    /**
     * 获取下午总号源
     *
     * @return afternoon_total_number - 下午总号源
     */
    public Integer getAfternoonTotalNumber() {
        return afternoonTotalNumber;
    }

    /**
     * 设置下午总号源
     *
     * @param afternoonTotalNumber 下午总号源
     */
    public void setAfternoonTotalNumber(Integer afternoonTotalNumber) {
        this.afternoonTotalNumber = afternoonTotalNumber;
    }

    /**
     * 获取晚上总号源
     *
     * @return night_total_number - 晚上总号源
     */
    public Integer getNightTotalNumber() {
        return nightTotalNumber;
    }

    /**
     * 设置晚上总号源
     *
     * @param nightTotalNumber 晚上总号源
     */
    public void setNightTotalNumber(Integer nightTotalNumber) {
        this.nightTotalNumber = nightTotalNumber;
    }

    /**
     * 获取排班时间(2018-05-06)
     *
     * @return schedule_time - 排班时间(2018-05-06)
     */
    public String getScheduleTime() {
        return scheduleTime;
    }

    /**
     * 设置排班时间(2018-05-06)
     *
     * @param scheduleTime 排班时间(2018-05-06)
     */
    public void setScheduleTime(String scheduleTime) {
        this.scheduleTime = scheduleTime;
    }

    /**
     * 获取状态0为已删除1为已创建
     *
     * @return status - 状态0为已删除1为已创建
     */
    public Boolean getStatus() {
        return status;
    }

    /**
     * 设置状态0为已删除1为已创建
     *
     * @param status 状态0为已删除1为已创建
     */
    public void setStatus(Boolean status) {
        this.status = status;
    }

    /**
     * 获取是否是自由排班 ‘1’普通排班  ‘2’自由排班
     *
     * @return type - 是否是自由排班 ‘1’普通排班  ‘2’自由排班
     */
    public String getType() {
        return type;
    }

    /**
     * 设置是否是自由排班 ‘1’普通排班  ‘2’自由排班
     *
     * @param type 是否是自由排班 ‘1’普通排班  ‘2’自由排班
     */
    public void setType(String type) {
        this.type = type;
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

    /**
     * 获取晚上是否为自由排班1是0否
     *
     * @return nig_free_type - 晚上是否为自由排班1是0否
     */
    public String getNigFreeType() {
        return nigFreeType;
    }

    /**
     * 设置晚上是否为自由排班1是0否
     *
     * @param nigFreeType 晚上是否为自由排班1是0否
     */
    public void setNigFreeType(String nigFreeType) {
        this.nigFreeType = nigFreeType;
    }

    /**
     * 获取下午是否为自由排班1是0否
     *
     * @return aft_free_type - 下午是否为自由排班1是0否
     */
    public String getAftFreeType() {
        return aftFreeType;
    }

    /**
     * 设置下午是否为自由排班1是0否
     *
     * @param aftFreeType 下午是否为自由排班1是0否
     */
    public void setAftFreeType(String aftFreeType) {
        this.aftFreeType = aftFreeType;
    }

    /**
     * 获取早上是否为自由排班
     *
     * @return mor_free_type - 早上是否为自由排班
     */
    public String getMorFreeType() {
        return morFreeType;
    }

    /**
     * 设置早上是否为自由排班
     *
     * @param morFreeType 早上是否为自由排班
     */
    public void setMorFreeType(String morFreeType) {
        this.morFreeType = morFreeType;
    }

    /**
     * 获取自由排班早上号源
     *
     * @return mor_free_num - 自由排班早上号源
     */
    public Integer getMorFreeNum() {
        return morFreeNum;
    }

    /**
     * 设置自由排班早上号源
     *
     * @param morFreeNum 自由排班早上号源
     */
    public void setMorFreeNum(Integer morFreeNum) {
        this.morFreeNum = morFreeNum;
    }

    /**
     * 获取自由排班早上总号源
     *
     * @return mor_free_top - 自由排班早上总号源
     */
    public Integer getMorFreeTop() {
        return morFreeTop;
    }

    /**
     * 设置自由排班早上总号源
     *
     * @param morFreeTop 自由排班早上总号源
     */
    public void setMorFreeTop(Integer morFreeTop) {
        this.morFreeTop = morFreeTop;
    }

    /**
     * 获取自由排班下午号源
     *
     * @return aft_free_num - 自由排班下午号源
     */
    public Integer getAftFreeNum() {
        return aftFreeNum;
    }

    /**
     * 设置自由排班下午号源
     *
     * @param aftFreeNum 自由排班下午号源
     */
    public void setAftFreeNum(Integer aftFreeNum) {
        this.aftFreeNum = aftFreeNum;
    }

    /**
     * 获取自由排班下午总号源
     *
     * @return aft_free_top - 自由排班下午总号源
     */
    public Integer getAftFreeTop() {
        return aftFreeTop;
    }

    /**
     * 设置自由排班下午总号源
     *
     * @param aftFreeTop 自由排班下午总号源
     */
    public void setAftFreeTop(Integer aftFreeTop) {
        this.aftFreeTop = aftFreeTop;
    }

    /**
     * 获取自由排班晚上号源
     *
     * @return nig_free_num - 自由排班晚上号源
     */
    public Integer getNigFreeNum() {
        return nigFreeNum;
    }

    /**
     * 设置自由排班晚上号源
     *
     * @param nigFreeNum 自由排班晚上号源
     */
    public void setNigFreeNum(Integer nigFreeNum) {
        this.nigFreeNum = nigFreeNum;
    }

    /**
     * 获取自由排班晚上总号源
     *
     * @return nig_free_top - 自由排班晚上总号源
     */
    public Integer getNigFreeTop() {
        return nigFreeTop;
    }

    /**
     * 设置自由排班晚上总号源
     *
     * @param nigFreeTop 自由排班晚上总号源
     */
    public void setNigFreeTop(Integer nigFreeTop) {
        this.nigFreeTop = nigFreeTop;
    }

    /**
     * 获取早上挂号时间
     *
     * @return free_mor_time - 早上挂号时间
     */
    public String getFreeMorTime() {
        return freeMorTime;
    }

    /**
     * 设置早上挂号时间
     *
     * @param freeMorTime 早上挂号时间
     */
    public void setFreeMorTime(String freeMorTime) {
        this.freeMorTime = freeMorTime;
    }

    /**
     * 获取下午挂号时间
     *
     * @return free_aft_time - 下午挂号时间
     */
    public String getFreeAftTime() {
        return freeAftTime;
    }

    /**
     * 设置下午挂号时间
     *
     * @param freeAftTime 下午挂号时间
     */
    public void setFreeAftTime(String freeAftTime) {
        this.freeAftTime = freeAftTime;
    }

    /**
     * 获取晚上挂号时间
     *
     * @return free_nig_time - 晚上挂号时间
     */
    public String getFreeNigTime() {
        return freeNigTime;
    }

    /**
     * 设置晚上挂号时间
     *
     * @param freeNigTime 晚上挂号时间
     */
    public void setFreeNigTime(String freeNigTime) {
        this.freeNigTime = freeNigTime;
    }
}