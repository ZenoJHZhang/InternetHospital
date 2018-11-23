package com.zjh.internethospitalapi.entity;

import javax.persistence.*;
import java.util.Date;

@Table(name = "user_reservation")
public class UserReservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 就诊人id
     */
    @Column(name = "patient_id")
    private Integer patientId;

    /**
     * 医院id
     */
    @Column(name = "hospital_id")
    private Integer hospitalId;

    /**
     * 排班ID
     */
    @Column(name = "schedule_id")
    private Integer scheduleId;

    /**
     * 患者姓名
     */
    @Column(name = "patient_name")
    private String patientName;

    /**
     * 电话号码
     */
    private String phone;

    /**
     * 身份证
     */
    @Column(name = "id_card")
    private String idCard;

    /**
     *  预约类型 1普通预约  2 专家预约 3普通挂号 4专家挂号
     */
    private String type;

    /**
     * 医生id
     */
    @Column(name = "doctor_id")
    private String doctorId;

    /**
     * 医生姓名
     */
    @Column(name = "doctor_name")
    private String doctorName;

    /**
     * 科室id
     */
    @Column(name = "depart_id")
    private Integer departId;

    /**
     * 科室名称
     */
    @Column(name = "depart_name")
    private String departName;

    /**
     * 就诊序号(该科室总的就诊序号)
     */
    @Column(name = "reg_no")
    private String regNo;

    /**
     * 就诊时间
     */
    @Column(name = "clinic_time")
    private String clinicTime;

    /**
     * 就诊日期
     */
    @Column(name = "clinic_date")
    private String clinicDate;

    /**
     * 问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）
     */
    private String status;

    /**
     * 预约时间 1 上午 2 下午 3 晚上
     */
    @Column(name = "time_type")
    private String timeType;

    /**
     * 取号返回的错误信息（预约/挂号）
     */
    @Column(name = "erro_msg")
    private String erroMsg;

    /**
     * 病情描述图片id
     */
    @Column(name = "img_id")
    private String imgId;

    /**
     * 是否被点击查看0未被，1已被点击
     */
    @Column(name = "is_click")
    private String isClick;

    /**
     * 是否评价，0未评价，1已评价
     */
    @Column(name = "is_evaluate")
    private String isEvaluate;

    /**
     * 挂号费支付状态
     */
    @Column(name = "clinic_pay_status")
    private String clinicPayStatus;

    /**
     * 处方支付状态 0未支付 1已支付
     */
    @Column(name = "recipe_pay_status")
    private String recipePayStatus;

    /**
     * 挂号费
     */
    @Column(name = "clinic_price")
    private Long clinicPrice;

    /**
     * 问诊包含的处方单数量
     */
    @Column(name = "recipe_number")
    private Integer recipeNumber;

    /**
     * 处方费（所有处方的总费用）
     */
    @Column(name = "recipe_price")
    private Long recipePrice;

    /**
     * 总费用(挂号处方)
     */
    @Column(name = "total_price")
    private String totalPrice;

    /**
     * 处方是否审核  0未审核，1已审核
     */
    @Column(name = "is_audit")
    private String isAudit;

    /**
     * 处方审核状态 1不通过 2已通过
     */
    @Column(name = "audit_status")
    private String auditStatus;

    /**
     * 是否可以编辑处方 1可以 0不可以
     */
    @Column(name = "is_read")
    private String isRead;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 处方审核不通过的原因
     */
    private String reason;

    /**
     * 医生设置过号的原因
     */
    @Column(name = "reason_skip")
    private String reasonSkip;

    /**
     * 是否为复诊患者,0不是1是
     */
    @Column(name = "is_return_visit")
    private String isReturnVisit;

    /**
     * 叫号时间
     */
    @Column(name = "call_number_time")
    private Date callNumberTime;

    /**
     * 问诊结束时间
     */
    @Column(name = "finish_time")
    private Date finishTime;

    /**
     * 1拒绝退款，0未拒绝
     */
    private String repulse;

    /**
     * 取消就诊原因
     */
    @Column(name = "cancel_reason")
    private String cancelReason;

    /**
     * 订单id
     */
    @Column(name = "order_id")
    private String orderId;

    /**
     * 患者年龄
     */
    private String age;

    /**
     * 性别1男2女
     */
    private String sex;

    /**
     * 是否第一次进入候诊间 0不是 1是
     */
    @Column(name = "first_waitroom")
    private String firstWaitroom;

    /**
     * 诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）
     */
    @Column(name = "clinic_type")
    private String clinicType;

    /**
     * 病情描述
     */
    @Column(name = "condition_desc")
    private String conditionDesc;

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
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取就诊人id
     *
     * @return patient_id - 就诊人id
     */
    public Integer getPatientId() {
        return patientId;
    }

    /**
     * 设置就诊人id
     *
     * @param patientId 就诊人id
     */
    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    /**
     * 获取医院id
     *
     * @return hospital_id - 医院id
     */
    public Integer getHospitalId() {
        return hospitalId;
    }

    /**
     * 设置医院id
     *
     * @param hospitalId 医院id
     */
    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    /**
     * 获取排班ID
     *
     * @return schedule_id - 排班ID
     */
    public Integer getScheduleId() {
        return scheduleId;
    }

    /**
     * 设置排班ID
     *
     * @param scheduleId 排班ID
     */
    public void setScheduleId(Integer scheduleId) {
        this.scheduleId = scheduleId;
    }

    /**
     * 获取患者姓名
     *
     * @return patient_name - 患者姓名
     */
    public String getPatientName() {
        return patientName;
    }

    /**
     * 设置患者姓名
     *
     * @param patientName 患者姓名
     */
    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    /**
     * 获取电话号码
     *
     * @return phone - 电话号码
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置电话号码
     *
     * @param phone 电话号码
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取身份证
     *
     * @return id_card - 身份证
     */
    public String getIdCard() {
        return idCard;
    }

    /**
     * 设置身份证
     *
     * @param idCard 身份证
     */
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    /**
     * 获取 预约类型 1普通预约  2 专家预约 3普通挂号 4专家挂号
     *
     * @return type -  预约类型 1普通预约  2 专家预约 3普通挂号 4专家挂号
     */
    public String getType() {
        return type;
    }

    /**
     * 设置 预约类型 1普通预约  2 专家预约 3普通挂号 4专家挂号
     *
     * @param type  预约类型 1普通预约  2 专家预约 3普通挂号 4专家挂号
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取医生id
     *
     * @return doctor_id - 医生id
     */
    public String getDoctorId() {
        return doctorId;
    }

    /**
     * 设置医生id
     *
     * @param doctorId 医生id
     */
    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * 获取医生姓名
     *
     * @return doctor_name - 医生姓名
     */
    public String getDoctorName() {
        return doctorName;
    }

    /**
     * 设置医生姓名
     *
     * @param doctorName 医生姓名
     */
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    /**
     * 获取科室id
     *
     * @return depart_id - 科室id
     */
    public Integer getDepartId() {
        return departId;
    }

    /**
     * 设置科室id
     *
     * @param departId 科室id
     */
    public void setDepartId(Integer departId) {
        this.departId = departId;
    }

    /**
     * 获取科室名称
     *
     * @return depart_name - 科室名称
     */
    public String getDepartName() {
        return departName;
    }

    /**
     * 设置科室名称
     *
     * @param departName 科室名称
     */
    public void setDepartName(String departName) {
        this.departName = departName;
    }

    /**
     * 获取就诊序号(该科室总的就诊序号)
     *
     * @return reg_no - 就诊序号(该科室总的就诊序号)
     */
    public String getRegNo() {
        return regNo;
    }

    /**
     * 设置就诊序号(该科室总的就诊序号)
     *
     * @param regNo 就诊序号(该科室总的就诊序号)
     */
    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    /**
     * 获取就诊时间
     *
     * @return clinic_time - 就诊时间
     */
    public String getClinicTime() {
        return clinicTime;
    }

    /**
     * 设置就诊时间
     *
     * @param clinicTime 就诊时间
     */
    public void setClinicTime(String clinicTime) {
        this.clinicTime = clinicTime;
    }

    /**
     * 获取就诊日期
     *
     * @return clinic_date - 就诊日期
     */
    public String getClinicDate() {
        return clinicDate;
    }

    /**
     * 设置就诊日期
     *
     * @param clinicDate 就诊日期
     */
    public void setClinicDate(String clinicDate) {
        this.clinicDate = clinicDate;
    }

    /**
     * 获取问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）
     *
     * @return status - 问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）
     *
     * @param status 问诊状态 1已预约未支付 2用户取消 3超时支付取消 4已付款等待视频 5已付款已过号 6申请退款中 7已退款 8拒绝退款 9退款中 10完成就诊待评价 11已评价 12就诊中 13同意退款 14历史未就诊 15未审方 16审方通过（患者未查看待取药） 17未通过 18患者已查看（待取药）
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取预约时间 1 上午 2 下午 3 晚上
     *
     * @return time_type - 预约时间 1 上午 2 下午 3 晚上
     */
    public String getTimeType() {
        return timeType;
    }

    /**
     * 设置预约时间 1 上午 2 下午 3 晚上
     *
     * @param timeType 预约时间 1 上午 2 下午 3 晚上
     */
    public void setTimeType(String timeType) {
        this.timeType = timeType;
    }

    /**
     * 获取取号返回的错误信息（预约/挂号）
     *
     * @return erro_msg - 取号返回的错误信息（预约/挂号）
     */
    public String getErroMsg() {
        return erroMsg;
    }

    /**
     * 设置取号返回的错误信息（预约/挂号）
     *
     * @param erroMsg 取号返回的错误信息（预约/挂号）
     */
    public void setErroMsg(String erroMsg) {
        this.erroMsg = erroMsg;
    }

    /**
     * 获取病情描述图片id
     *
     * @return img_id - 病情描述图片id
     */
    public String getImgId() {
        return imgId;
    }

    /**
     * 设置病情描述图片id
     *
     * @param imgId 病情描述图片id
     */
    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    /**
     * 获取是否被点击查看0未被，1已被点击
     *
     * @return is_click - 是否被点击查看0未被，1已被点击
     */
    public String getIsClick() {
        return isClick;
    }

    /**
     * 设置是否被点击查看0未被，1已被点击
     *
     * @param isClick 是否被点击查看0未被，1已被点击
     */
    public void setIsClick(String isClick) {
        this.isClick = isClick;
    }

    /**
     * 获取是否评价，0未评价，1已评价
     *
     * @return is_evaluate - 是否评价，0未评价，1已评价
     */
    public String getIsEvaluate() {
        return isEvaluate;
    }

    /**
     * 设置是否评价，0未评价，1已评价
     *
     * @param isEvaluate 是否评价，0未评价，1已评价
     */
    public void setIsEvaluate(String isEvaluate) {
        this.isEvaluate = isEvaluate;
    }

    /**
     * 获取挂号费支付状态
     *
     * @return clinic_pay_status - 挂号费支付状态
     */
    public String getClinicPayStatus() {
        return clinicPayStatus;
    }

    /**
     * 设置挂号费支付状态
     *
     * @param clinicPayStatus 挂号费支付状态
     */
    public void setClinicPayStatus(String clinicPayStatus) {
        this.clinicPayStatus = clinicPayStatus;
    }

    /**
     * 获取处方支付状态 0未支付 1已支付
     *
     * @return recipe_pay_status - 处方支付状态 0未支付 1已支付
     */
    public String getRecipePayStatus() {
        return recipePayStatus;
    }

    /**
     * 设置处方支付状态 0未支付 1已支付
     *
     * @param recipePayStatus 处方支付状态 0未支付 1已支付
     */
    public void setRecipePayStatus(String recipePayStatus) {
        this.recipePayStatus = recipePayStatus;
    }

    /**
     * 获取挂号费
     *
     * @return clinic_price - 挂号费
     */
    public Long getClinicPrice() {
        return clinicPrice;
    }

    /**
     * 设置挂号费
     *
     * @param clinicPrice 挂号费
     */
    public void setClinicPrice(Long clinicPrice) {
        this.clinicPrice = clinicPrice;
    }

    /**
     * 获取问诊包含的处方单数量
     *
     * @return recipe_number - 问诊包含的处方单数量
     */
    public Integer getRecipeNumber() {
        return recipeNumber;
    }

    /**
     * 设置问诊包含的处方单数量
     *
     * @param recipeNumber 问诊包含的处方单数量
     */
    public void setRecipeNumber(Integer recipeNumber) {
        this.recipeNumber = recipeNumber;
    }

    /**
     * 获取处方费（所有处方的总费用）
     *
     * @return recipe_price - 处方费（所有处方的总费用）
     */
    public Long getRecipePrice() {
        return recipePrice;
    }

    /**
     * 设置处方费（所有处方的总费用）
     *
     * @param recipePrice 处方费（所有处方的总费用）
     */
    public void setRecipePrice(Long recipePrice) {
        this.recipePrice = recipePrice;
    }

    /**
     * 获取总费用(挂号处方)
     *
     * @return total_price - 总费用(挂号处方)
     */
    public String getTotalPrice() {
        return totalPrice;
    }

    /**
     * 设置总费用(挂号处方)
     *
     * @param totalPrice 总费用(挂号处方)
     */
    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    /**
     * 获取处方是否审核  0未审核，1已审核
     *
     * @return is_audit - 处方是否审核  0未审核，1已审核
     */
    public String getIsAudit() {
        return isAudit;
    }

    /**
     * 设置处方是否审核  0未审核，1已审核
     *
     * @param isAudit 处方是否审核  0未审核，1已审核
     */
    public void setIsAudit(String isAudit) {
        this.isAudit = isAudit;
    }

    /**
     * 获取处方审核状态 1不通过 2已通过
     *
     * @return audit_status - 处方审核状态 1不通过 2已通过
     */
    public String getAuditStatus() {
        return auditStatus;
    }

    /**
     * 设置处方审核状态 1不通过 2已通过
     *
     * @param auditStatus 处方审核状态 1不通过 2已通过
     */
    public void setAuditStatus(String auditStatus) {
        this.auditStatus = auditStatus;
    }

    /**
     * 获取是否可以编辑处方 1可以 0不可以
     *
     * @return is_read - 是否可以编辑处方 1可以 0不可以
     */
    public String getIsRead() {
        return isRead;
    }

    /**
     * 设置是否可以编辑处方 1可以 0不可以
     *
     * @param isRead 是否可以编辑处方 1可以 0不可以
     */
    public void setIsRead(String isRead) {
        this.isRead = isRead;
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
     * 获取处方审核不通过的原因
     *
     * @return reason - 处方审核不通过的原因
     */
    public String getReason() {
        return reason;
    }

    /**
     * 设置处方审核不通过的原因
     *
     * @param reason 处方审核不通过的原因
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * 获取医生设置过号的原因
     *
     * @return reason_skip - 医生设置过号的原因
     */
    public String getReasonSkip() {
        return reasonSkip;
    }

    /**
     * 设置医生设置过号的原因
     *
     * @param reasonSkip 医生设置过号的原因
     */
    public void setReasonSkip(String reasonSkip) {
        this.reasonSkip = reasonSkip;
    }

    /**
     * 获取是否为复诊患者,0不是1是
     *
     * @return is_return_visit - 是否为复诊患者,0不是1是
     */
    public String getIsReturnVisit() {
        return isReturnVisit;
    }

    /**
     * 设置是否为复诊患者,0不是1是
     *
     * @param isReturnVisit 是否为复诊患者,0不是1是
     */
    public void setIsReturnVisit(String isReturnVisit) {
        this.isReturnVisit = isReturnVisit;
    }

    /**
     * 获取叫号时间
     *
     * @return call_number_time - 叫号时间
     */
    public Date getCallNumberTime() {
        return callNumberTime;
    }

    /**
     * 设置叫号时间
     *
     * @param callNumberTime 叫号时间
     */
    public void setCallNumberTime(Date callNumberTime) {
        this.callNumberTime = callNumberTime;
    }

    /**
     * 获取问诊结束时间
     *
     * @return finish_time - 问诊结束时间
     */
    public Date getFinishTime() {
        return finishTime;
    }

    /**
     * 设置问诊结束时间
     *
     * @param finishTime 问诊结束时间
     */
    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    /**
     * 获取1拒绝退款，0未拒绝
     *
     * @return repulse - 1拒绝退款，0未拒绝
     */
    public String getRepulse() {
        return repulse;
    }

    /**
     * 设置1拒绝退款，0未拒绝
     *
     * @param repulse 1拒绝退款，0未拒绝
     */
    public void setRepulse(String repulse) {
        this.repulse = repulse;
    }

    /**
     * 获取取消就诊原因
     *
     * @return cancel_reason - 取消就诊原因
     */
    public String getCancelReason() {
        return cancelReason;
    }

    /**
     * 设置取消就诊原因
     *
     * @param cancelReason 取消就诊原因
     */
    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }

    /**
     * 获取订单id
     *
     * @return order_id - 订单id
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 设置订单id
     *
     * @param orderId 订单id
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * 获取患者年龄
     *
     * @return age - 患者年龄
     */
    public String getAge() {
        return age;
    }

    /**
     * 设置患者年龄
     *
     * @param age 患者年龄
     */
    public void setAge(String age) {
        this.age = age;
    }

    /**
     * 获取性别1男2女
     *
     * @return sex - 性别1男2女
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置性别1男2女
     *
     * @param sex 性别1男2女
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * 获取是否第一次进入候诊间 0不是 1是
     *
     * @return first_waitroom - 是否第一次进入候诊间 0不是 1是
     */
    public String getFirstWaitroom() {
        return firstWaitroom;
    }

    /**
     * 设置是否第一次进入候诊间 0不是 1是
     *
     * @param firstWaitroom 是否第一次进入候诊间 0不是 1是
     */
    public void setFirstWaitroom(String firstWaitroom) {
        this.firstWaitroom = firstWaitroom;
    }

    /**
     * 获取诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）
     *
     * @return clinic_type - 诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）
     */
    public String getClinicType() {
        return clinicType;
    }

    /**
     * 设置诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）
     *
     * @param clinicType 诊断意见（0：医师诊断 ，1：药师诊断，2：门诊诊断）
     */
    public void setClinicType(String clinicType) {
        this.clinicType = clinicType;
    }

    /**
     * 获取病情描述
     *
     * @return condition_desc - 病情描述
     */
    public String getConditionDesc() {
        return conditionDesc;
    }

    /**
     * 设置病情描述
     *
     * @param conditionDesc 病情描述
     */
    public void setConditionDesc(String conditionDesc) {
        this.conditionDesc = conditionDesc;
    }
}