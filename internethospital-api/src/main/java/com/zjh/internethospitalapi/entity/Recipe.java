package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 问诊记录id
     */
    private String userReservationUuId;

    /**
     * 开处方的医生id
     */
    @Column(name = "doctor_id")
    private Integer doctorId;

    /**
     * 处方总价
     */
    private String price;

    /**
     * 0未审核，1已审核，2未通过
     */
    private Integer status;

    /**
     * 处方审核用户id（医生管理员id）
     */
    private Integer auditUserId;

    /**
     * 处方未通过原因原因
     */
    private String reason;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "create_time")
    private Date createTime;

    private Integer isDelete;
}