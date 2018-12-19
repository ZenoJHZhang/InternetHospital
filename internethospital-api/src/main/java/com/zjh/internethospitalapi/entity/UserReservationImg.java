package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Table(name = "user_reservation_img")
@Data
public class UserReservationImg {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "user_reservation_id")
    private Integer userReservationId;

    @Column(name = "img_id")
    private Integer imgId;

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
}