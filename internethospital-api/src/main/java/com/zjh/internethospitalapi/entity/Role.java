package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Data
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 权限
     */
    private String role;

    /**
     * 权限描述
     */
    private String description;

    private Date createTime;

    private Date updateTime;

    private Integer isDelete;
}