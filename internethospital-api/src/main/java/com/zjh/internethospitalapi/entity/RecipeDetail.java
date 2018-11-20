package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

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
     * 获取对应处方id
     *
     * @return recipe_id - 对应处方id
     */
    public Integer getRecipeId() {
        return recipeId;
    }

    /**
     * 设置对应处方id
     *
     * @param recipeId 对应处方id
     */
    public void setRecipeId(Integer recipeId) {
        this.recipeId = recipeId;
    }

    /**
     * 获取对应药品id
     *
     * @return medical_id - 对应药品id
     */
    public Integer getMedicalId() {
        return medicalId;
    }

    /**
     * 设置对应药品id
     *
     * @param medicalId 对应药品id
     */
    public void setMedicalId(Integer medicalId) {
        this.medicalId = medicalId;
    }

    /**
     * 获取处方名称
     *
     * @return name - 处方名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置处方名称
     *
     * @param name 处方名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取药品数量
     *
     * @return amount - 药品数量
     */
    public String getAmount() {
        return amount;
    }

    /**
     * 设置药品数量
     *
     * @param amount 药品数量
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * 获取剂量（每次服用量）
     *
     * @return dosage - 剂量（每次服用量）
     */
    public String getDosage() {
        return dosage;
    }

    /**
     * 设置剂量（每次服用量）
     *
     * @param dosage 剂量（每次服用量）
     */
    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    /**
     * @return dosage_unit
     */
    public String getDosageUnit() {
        return dosageUnit;
    }

    /**
     * @param dosageUnit
     */
    public void setDosageUnit(String dosageUnit) {
        this.dosageUnit = dosageUnit;
    }

    /**
     * 获取用药频次
     *
     * @return times - 用药频次
     */
    public String getTimes() {
        return times;
    }

    /**
     * 设置用药频次
     *
     * @param times 用药频次
     */
    public void setTimes(String times) {
        this.times = times;
    }

    /**
     * 获取天数
     *
     * @return day - 天数
     */
    public String getDay() {
        return day;
    }

    /**
     * 设置天数
     *
     * @param day 天数
     */
    public void setDay(String day) {
        this.day = day;
    }

    /**
     * 获取用法
     *
     * @return method - 用法
     */
    public String getMethod() {
        return method;
    }

    /**
     * 设置用法
     *
     * @param method 用法
     */
    public void setMethod(String method) {
        this.method = method;
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
     * @return update_time
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * @param updateTime
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}