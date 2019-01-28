package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
public class Medical {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 药品名字
     */
    private String name;

    /**
     * 药品单位
     */
    private String unit;

    /**
     * 药品类型
     */
    private Integer type;

    /**
     * 药品单价
     */
    private Long price;

    /**
     * 规格
     */
    private String norms;

    /**
     * 产地
     */
    private String origin;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;
}