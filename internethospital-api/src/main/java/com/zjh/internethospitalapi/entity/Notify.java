package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class Notify {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态
     */
    private String type;

    /**
     * 通知内容
     */
    private String content;

    /**
     * 通知数据，如排班消息的医生id，医院动态的地址等
     */
    @Column(name = "content_data")
    private String contentData;

    /**
     * 状态0未查看。1已查看  
     */
    private String status;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;
}