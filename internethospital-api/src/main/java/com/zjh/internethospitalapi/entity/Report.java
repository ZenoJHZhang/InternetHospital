package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
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

    private Date updateTime;
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
}