package com.zjh.internethospitalapi.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "user_reservation")
public class UserReservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "visit_id")
    private String visitId;

    /**
     * 用户中心id
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 常用就诊人id
     */
    @Column(name = "patient_id")
    private Integer patientId;

    /**
     * 医院id
     */
    @Column(name = "hospital_id")
    private String hospitalId;

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
     * 就诊卡
     */
    @Column(name = "treatment_card")
    private String treatmentCard;

    /**
     *  预约类型 1普通预约  2 专家预约 3普通挂号 4专家挂号
     */
    private String type;

    /**
     * 医生工号
     */
    @Column(name = "doctor_number")
    private String doctorNumber;

    /**
     * 医生姓名
     */
    @Column(name = "doctor_name")
    private String doctorName;

    /**
     * 科室id
     */
    @Column(name = "dept_id")
    private Integer deptId;

    /**
     * 科室名称
     */
    @Column(name = "dept_name")
    private String deptName;

    /**
     * 就诊序号
     */
    @Column(name = "reg_no")
    private String regNo;

    /**
     * 预约Id
     */
    @Column(name = "reg_id")
    private String regId;

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
     * 金额
     */
    private String fee;

    /**
     * 就诊地址
     */
    @Column(name = "reg_address")
    private String regAddress;

    /**
     * 取号返回的错误信息（预约/挂号）
     */
    @Column(name = "erro_msg")
    private String erroMsg;

    /**
     * 问诊来源 1web端 2android 3ios
     */
    private String source;

    /**
     * 附件ID
     */
    @Column(name = "file_id")
    private String fileId;

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
     * 检验预约状态 0未预约1已预约
     */
    @Column(name = "jy_status")
    private String jyStatus;

    /**
     * 检查预约状态 0未预约1已预约
     */
    @Column(name = "jc_status")
    private String jcStatus;

    /**
     * 处方支付状态 0未支付 1已支付
     */
    @Column(name = "cf_pay_status")
    private String cfPayStatus;

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
     * 总费用(医嘱检查检验)
     */
    private String totalfee;

    /**
     * 处方审核不通过的原因
     */
    private String reason;

    /**
     * ca图片地址
     */
    @Column(name = "ca_url")
    private String caUrl;

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
     * emr系统患者id
     */
    @Column(name = "emr_pid")
    private Integer emrPid;

    /**
     * 管理员是否已点击。0未点击，1已点击（四川）
     */
    @Column(name = "is_click_admin")
    private String isClickAdmin;

    private String remark;

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
     * 诊疗价格(张同泰医院专有)
     */
    @Column(name = "treatment_price")
    private BigDecimal treatmentPrice;

    /**
     * 咨询费(张同泰医院专有)
     */
    @Column(name = "consulting_price")
    private BigDecimal consultingPrice;

    /**
     * 挂号费
     */
    @Column(name = "clinic_price")
    private BigDecimal clinicPrice;

    /**
     * 医院的排班id
     */
    @Column(name = "his_schedule_id")
    private String hisScheduleId;

    /**
     * 医院的分时id
     */
    @Column(name = "his_time_id")
    private String hisTimeId;

    /**
     * 医院的数字订单id
     */
    @Column(name = "order_number")
    private String orderNumber;

    /**
     * 是否为自由排班
     */
    @Column(name = "is_free_type")
    private String isFreeType;

    /**
     * 挂号流水号
     */
    @Column(name = "order_flow")
    private String orderFlow;

    /**
     * 快速问诊医生回复
     */
    @Column(name = "doctor_reply")
    private String doctorReply;

    /**
     * 患者年龄
     */
    private String age;

    /**
     * 性别1男2女
     */
    private String sex;

    /**
     * 诊断类型 1门诊诊断  2药师门诊 3诊断意见
     */
    @Column(name = "clinic_type")
    private String clinicType;

    /**
     * 科室问卷系统发送位置 0无 1挂号前 2挂号后
     */
    @Column(name = "dept_survey_type")
    private String deptSurveyType;

    /**
     * 问卷库问卷系统发送位置 0无 1挂号前 2挂号后
     */
    @Column(name = "lib_survey_type")
    private String libSurveyType;

    /**
     * HIS交易唯一流水号
     */
    @Column(name = "his_pay_flow_no")
    private String hisPayFlowNo;

    /**
     * 是否第一次进入候诊间 0不是 1是
     */
    @Column(name = "first_waitroom")
    private String firstWaitroom;

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
     * @return visit_id
     */
    public String getVisitId() {
        return visitId;
    }

    /**
     * @param visitId
     */
    public void setVisitId(String visitId) {
        this.visitId = visitId;
    }

    /**
     * 获取用户中心id
     *
     * @return user_id - 用户中心id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置用户中心id
     *
     * @param userId 用户中心id
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 获取常用就诊人id
     *
     * @return patient_id - 常用就诊人id
     */
    public Integer getPatientId() {
        return patientId;
    }

    /**
     * 设置常用就诊人id
     *
     * @param patientId 常用就诊人id
     */
    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    /**
     * 获取医院id
     *
     * @return hospital_id - 医院id
     */
    public String getHospitalId() {
        return hospitalId;
    }

    /**
     * 设置医院id
     *
     * @param hospitalId 医院id
     */
    public void setHospitalId(String hospitalId) {
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
     * 获取就诊卡
     *
     * @return treatment_card - 就诊卡
     */
    public String getTreatmentCard() {
        return treatmentCard;
    }

    /**
     * 设置就诊卡
     *
     * @param treatmentCard 就诊卡
     */
    public void setTreatmentCard(String treatmentCard) {
        this.treatmentCard = treatmentCard;
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
     * @return dept_id - 科室id
     */
    public Integer getDeptId() {
        return deptId;
    }

    /**
     * 设置科室id
     *
     * @param deptId 科室id
     */
    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    /**
     * 获取科室名称
     *
     * @return dept_name - 科室名称
     */
    public String getDeptName() {
        return deptName;
    }

    /**
     * 设置科室名称
     *
     * @param deptName 科室名称
     */
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    /**
     * 获取就诊序号
     *
     * @return reg_no - 就诊序号
     */
    public String getRegNo() {
        return regNo;
    }

    /**
     * 设置就诊序号
     *
     * @param regNo 就诊序号
     */
    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    /**
     * 获取预约Id
     *
     * @return reg_id - 预约Id
     */
    public String getRegId() {
        return regId;
    }

    /**
     * 设置预约Id
     *
     * @param regId 预约Id
     */
    public void setRegId(String regId) {
        this.regId = regId;
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
     * 获取金额
     *
     * @return fee - 金额
     */
    public String getFee() {
        return fee;
    }

    /**
     * 设置金额
     *
     * @param fee 金额
     */
    public void setFee(String fee) {
        this.fee = fee;
    }

    /**
     * 获取就诊地址
     *
     * @return reg_address - 就诊地址
     */
    public String getRegAddress() {
        return regAddress;
    }

    /**
     * 设置就诊地址
     *
     * @param regAddress 就诊地址
     */
    public void setRegAddress(String regAddress) {
        this.regAddress = regAddress;
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
     * 获取问诊来源 1web端 2android 3ios
     *
     * @return source - 问诊来源 1web端 2android 3ios
     */
    public String getSource() {
        return source;
    }

    /**
     * 设置问诊来源 1web端 2android 3ios
     *
     * @param source 问诊来源 1web端 2android 3ios
     */
    public void setSource(String source) {
        this.source = source;
    }

    /**
     * 获取附件ID
     *
     * @return file_id - 附件ID
     */
    public String getFileId() {
        return fileId;
    }

    /**
     * 设置附件ID
     *
     * @param fileId 附件ID
     */
    public void setFileId(String fileId) {
        this.fileId = fileId;
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
     * 获取检验预约状态 0未预约1已预约
     *
     * @return jy_status - 检验预约状态 0未预约1已预约
     */
    public String getJyStatus() {
        return jyStatus;
    }

    /**
     * 设置检验预约状态 0未预约1已预约
     *
     * @param jyStatus 检验预约状态 0未预约1已预约
     */
    public void setJyStatus(String jyStatus) {
        this.jyStatus = jyStatus;
    }

    /**
     * 获取检查预约状态 0未预约1已预约
     *
     * @return jc_status - 检查预约状态 0未预约1已预约
     */
    public String getJcStatus() {
        return jcStatus;
    }

    /**
     * 设置检查预约状态 0未预约1已预约
     *
     * @param jcStatus 检查预约状态 0未预约1已预约
     */
    public void setJcStatus(String jcStatus) {
        this.jcStatus = jcStatus;
    }

    /**
     * 获取处方支付状态 0未支付 1已支付
     *
     * @return cf_pay_status - 处方支付状态 0未支付 1已支付
     */
    public String getCfPayStatus() {
        return cfPayStatus;
    }

    /**
     * 设置处方支付状态 0未支付 1已支付
     *
     * @param cfPayStatus 处方支付状态 0未支付 1已支付
     */
    public void setCfPayStatus(String cfPayStatus) {
        this.cfPayStatus = cfPayStatus;
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
     * 获取总费用(医嘱检查检验)
     *
     * @return totalfee - 总费用(医嘱检查检验)
     */
    public String getTotalfee() {
        return totalfee;
    }

    /**
     * 设置总费用(医嘱检查检验)
     *
     * @param totalfee 总费用(医嘱检查检验)
     */
    public void setTotalfee(String totalfee) {
        this.totalfee = totalfee;
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
     * 获取ca图片地址
     *
     * @return ca_url - ca图片地址
     */
    public String getCaUrl() {
        return caUrl;
    }

    /**
     * 设置ca图片地址
     *
     * @param caUrl ca图片地址
     */
    public void setCaUrl(String caUrl) {
        this.caUrl = caUrl;
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
     * 获取emr系统患者id
     *
     * @return emr_pid - emr系统患者id
     */
    public Integer getEmrPid() {
        return emrPid;
    }

    /**
     * 设置emr系统患者id
     *
     * @param emrPid emr系统患者id
     */
    public void setEmrPid(Integer emrPid) {
        this.emrPid = emrPid;
    }

    /**
     * 获取管理员是否已点击。0未点击，1已点击（四川）
     *
     * @return is_click_admin - 管理员是否已点击。0未点击，1已点击（四川）
     */
    public String getIsClickAdmin() {
        return isClickAdmin;
    }

    /**
     * 设置管理员是否已点击。0未点击，1已点击（四川）
     *
     * @param isClickAdmin 管理员是否已点击。0未点击，1已点击（四川）
     */
    public void setIsClickAdmin(String isClickAdmin) {
        this.isClickAdmin = isClickAdmin;
    }

    /**
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark;
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
     * 获取诊疗价格(张同泰医院专有)
     *
     * @return treatment_price - 诊疗价格(张同泰医院专有)
     */
    public BigDecimal getTreatmentPrice() {
        return treatmentPrice;
    }

    /**
     * 设置诊疗价格(张同泰医院专有)
     *
     * @param treatmentPrice 诊疗价格(张同泰医院专有)
     */
    public void setTreatmentPrice(BigDecimal treatmentPrice) {
        this.treatmentPrice = treatmentPrice;
    }

    /**
     * 获取咨询费(张同泰医院专有)
     *
     * @return consulting_price - 咨询费(张同泰医院专有)
     */
    public BigDecimal getConsultingPrice() {
        return consultingPrice;
    }

    /**
     * 设置咨询费(张同泰医院专有)
     *
     * @param consultingPrice 咨询费(张同泰医院专有)
     */
    public void setConsultingPrice(BigDecimal consultingPrice) {
        this.consultingPrice = consultingPrice;
    }

    /**
     * 获取挂号费
     *
     * @return clinic_price - 挂号费
     */
    public BigDecimal getClinicPrice() {
        return clinicPrice;
    }

    /**
     * 设置挂号费
     *
     * @param clinicPrice 挂号费
     */
    public void setClinicPrice(BigDecimal clinicPrice) {
        this.clinicPrice = clinicPrice;
    }

    /**
     * 获取医院的排班id
     *
     * @return his_schedule_id - 医院的排班id
     */
    public String getHisScheduleId() {
        return hisScheduleId;
    }

    /**
     * 设置医院的排班id
     *
     * @param hisScheduleId 医院的排班id
     */
    public void setHisScheduleId(String hisScheduleId) {
        this.hisScheduleId = hisScheduleId;
    }

    /**
     * 获取医院的分时id
     *
     * @return his_time_id - 医院的分时id
     */
    public String getHisTimeId() {
        return hisTimeId;
    }

    /**
     * 设置医院的分时id
     *
     * @param hisTimeId 医院的分时id
     */
    public void setHisTimeId(String hisTimeId) {
        this.hisTimeId = hisTimeId;
    }

    /**
     * 获取医院的数字订单id
     *
     * @return order_number - 医院的数字订单id
     */
    public String getOrderNumber() {
        return orderNumber;
    }

    /**
     * 设置医院的数字订单id
     *
     * @param orderNumber 医院的数字订单id
     */
    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    /**
     * 获取是否为自由排班
     *
     * @return is_free_type - 是否为自由排班
     */
    public String getIsFreeType() {
        return isFreeType;
    }

    /**
     * 设置是否为自由排班
     *
     * @param isFreeType 是否为自由排班
     */
    public void setIsFreeType(String isFreeType) {
        this.isFreeType = isFreeType;
    }

    /**
     * 获取挂号流水号
     *
     * @return order_flow - 挂号流水号
     */
    public String getOrderFlow() {
        return orderFlow;
    }

    /**
     * 设置挂号流水号
     *
     * @param orderFlow 挂号流水号
     */
    public void setOrderFlow(String orderFlow) {
        this.orderFlow = orderFlow;
    }

    /**
     * 获取快速问诊医生回复
     *
     * @return doctor_reply - 快速问诊医生回复
     */
    public String getDoctorReply() {
        return doctorReply;
    }

    /**
     * 设置快速问诊医生回复
     *
     * @param doctorReply 快速问诊医生回复
     */
    public void setDoctorReply(String doctorReply) {
        this.doctorReply = doctorReply;
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
     * 获取诊断类型 1门诊诊断  2药师门诊 3诊断意见
     *
     * @return clinic_type - 诊断类型 1门诊诊断  2药师门诊 3诊断意见
     */
    public String getClinicType() {
        return clinicType;
    }

    /**
     * 设置诊断类型 1门诊诊断  2药师门诊 3诊断意见
     *
     * @param clinicType 诊断类型 1门诊诊断  2药师门诊 3诊断意见
     */
    public void setClinicType(String clinicType) {
        this.clinicType = clinicType;
    }

    /**
     * 获取科室问卷系统发送位置 0无 1挂号前 2挂号后
     *
     * @return dept_survey_type - 科室问卷系统发送位置 0无 1挂号前 2挂号后
     */
    public String getDeptSurveyType() {
        return deptSurveyType;
    }

    /**
     * 设置科室问卷系统发送位置 0无 1挂号前 2挂号后
     *
     * @param deptSurveyType 科室问卷系统发送位置 0无 1挂号前 2挂号后
     */
    public void setDeptSurveyType(String deptSurveyType) {
        this.deptSurveyType = deptSurveyType;
    }

    /**
     * 获取问卷库问卷系统发送位置 0无 1挂号前 2挂号后
     *
     * @return lib_survey_type - 问卷库问卷系统发送位置 0无 1挂号前 2挂号后
     */
    public String getLibSurveyType() {
        return libSurveyType;
    }

    /**
     * 设置问卷库问卷系统发送位置 0无 1挂号前 2挂号后
     *
     * @param libSurveyType 问卷库问卷系统发送位置 0无 1挂号前 2挂号后
     */
    public void setLibSurveyType(String libSurveyType) {
        this.libSurveyType = libSurveyType;
    }

    /**
     * 获取HIS交易唯一流水号
     *
     * @return his_pay_flow_no - HIS交易唯一流水号
     */
    public String getHisPayFlowNo() {
        return hisPayFlowNo;
    }

    /**
     * 设置HIS交易唯一流水号
     *
     * @param hisPayFlowNo HIS交易唯一流水号
     */
    public void setHisPayFlowNo(String hisPayFlowNo) {
        this.hisPayFlowNo = hisPayFlowNo;
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