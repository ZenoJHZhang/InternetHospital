package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 问诊记录id
     */
    @Column(name = "reservation_id")
    private Integer reservationId;

    /**
     * 报告单类型 1 检查单，2检验单
     */
    private String type;

    /**
     * 项目名称
     */
    private String name;

    /**
     * 检查时间
     */
    @Column(name = "report_time")
    private String reportTime;

    /**
     * 地点
     */
    private String address;

    /**
     * 备注
     */
    private String remark;

    @Column(name = "create_time")
    private Date createTime;

    /**
     * 费用
     */
    private String price;

    /**
     * 预约时间1
     */
    private String time1;

    /**
     * 预约时间2
     */
    private String time2;

    /**
     * 预约时间3
     */
    private String time3;

    /**
     * 0表示没有预约处理,1表示预约成功,2表示预约失败
     */
    private String status;

    @Column(name = "doc_app")
    private String docApp;

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
     * 获取问诊记录id
     *
     * @return reservation_id - 问诊记录id
     */
    public Integer getReservationId() {
        return reservationId;
    }

    /**
     * 设置问诊记录id
     *
     * @param reservationId 问诊记录id
     */
    public void setReservationId(Integer reservationId) {
        this.reservationId = reservationId;
    }

    /**
     * 获取报告单类型 1 检查单，2检验单
     *
     * @return type - 报告单类型 1 检查单，2检验单
     */
    public String getType() {
        return type;
    }

    /**
     * 设置报告单类型 1 检查单，2检验单
     *
     * @param type 报告单类型 1 检查单，2检验单
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取项目名称
     *
     * @return name - 项目名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置项目名称
     *
     * @param name 项目名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取检查时间
     *
     * @return report_time - 检查时间
     */
    public String getReportTime() {
        return reportTime;
    }

    /**
     * 设置检查时间
     *
     * @param reportTime 检查时间
     */
    public void setReportTime(String reportTime) {
        this.reportTime = reportTime;
    }

    /**
     * 获取地点
     *
     * @return address - 地点
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置地点
     *
     * @param address 地点
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取备注
     *
     * @return remark - 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
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
     * 获取费用
     *
     * @return price - 费用
     */
    public String getPrice() {
        return price;
    }

    /**
     * 设置费用
     *
     * @param price 费用
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * 获取预约时间1
     *
     * @return time1 - 预约时间1
     */
    public String getTime1() {
        return time1;
    }

    /**
     * 设置预约时间1
     *
     * @param time1 预约时间1
     */
    public void setTime1(String time1) {
        this.time1 = time1;
    }

    /**
     * 获取预约时间2
     *
     * @return time2 - 预约时间2
     */
    public String getTime2() {
        return time2;
    }

    /**
     * 设置预约时间2
     *
     * @param time2 预约时间2
     */
    public void setTime2(String time2) {
        this.time2 = time2;
    }

    /**
     * 获取预约时间3
     *
     * @return time3 - 预约时间3
     */
    public String getTime3() {
        return time3;
    }

    /**
     * 设置预约时间3
     *
     * @param time3 预约时间3
     */
    public void setTime3(String time3) {
        this.time3 = time3;
    }

    /**
     * 获取0表示没有预约处理,1表示预约成功,2表示预约失败
     *
     * @return status - 0表示没有预约处理,1表示预约成功,2表示预约失败
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置0表示没有预约处理,1表示预约成功,2表示预约失败
     *
     * @param status 0表示没有预约处理,1表示预约成功,2表示预约失败
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return doc_app
     */
    public String getDocApp() {
        return docApp;
    }

    /**
     * @param docApp
     */
    public void setDocApp(String docApp) {
        this.docApp = docApp;
    }
}