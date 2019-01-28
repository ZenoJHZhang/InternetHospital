package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Table(name = "user_reservation_status")
@Data
public class UserReservationStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "state_name")
    private String stateName;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;
}