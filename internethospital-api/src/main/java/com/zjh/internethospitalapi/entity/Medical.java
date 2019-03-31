package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
@Data
public class Medical {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 药品名字
     */
    @NotBlank(message = "药品名字不能为空")
    private String name;

    /**
     * 药品单位
     */
    @NotBlank(message = "药品单位不能为空")
    private String unit;

    /**
     * 药品类型
     */
    @NotBlank(message = "药品类型不能为空")
    private String type;

    /**
     * 药品单价
     */
    @NotBlank(message = "药品价格不能为空")
    private String price;

    /**
     * 规格
     */
    @NotBlank(message = "药品规格不能为空")
    private String norms;

    /**
     * 产地
     */
    @NotBlank(message = "药品产地不能为空")
    private String origin;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;

    //为了药方使用
    @Transient
    private String amount;

    @Transient
    private String dosage;

    @Transient
    private String dosageUnit;

    @Transient
    private String times;

    @Transient
    private String day;

    @Transient
    private String method;

    @Transient
    private String userReservationUuid;
}