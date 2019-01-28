package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
@Table(name = "recipe_detail")
public class RecipeDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 对应处方id
     */
    @Column(name = "recipe_id")
    private Integer recipeId;

    /**
     * 对应药品id
     */
    @Column(name = "medical_id")
    private Integer medicalId;

    /**
     * 处方名称
     */
    private String name;

    /**
     * 药品数量
     */
    private String amount;

    /**
     * 剂量（每次服用量）
     */
    private String dosage;

    @Column(name = "dosage_unit")
    private String dosageUnit;

    /**
     * 用药频次
     */
    private String times;

    /**
     * 天数
     */
    private String day;

    /**
     * 用法
     */
    private String method;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;
}