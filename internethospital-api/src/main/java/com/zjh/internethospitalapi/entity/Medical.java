package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

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
     * 获取药品名字
     *
     * @return name - 药品名字
     */
    public String getName() {
        return name;
    }

    /**
     * 设置药品名字
     *
     * @param name 药品名字
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取药品单位
     *
     * @return unit - 药品单位
     */
    public String getUnit() {
        return unit;
    }

    /**
     * 设置药品单位
     *
     * @param unit 药品单位
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * 获取药品类型
     *
     * @return type - 药品类型
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置药品类型
     *
     * @param type 药品类型
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取药品单价
     *
     * @return price - 药品单价
     */
    public Long getPrice() {
        return price;
    }

    /**
     * 设置药品单价
     *
     * @param price 药品单价
     */
    public void setPrice(Long price) {
        this.price = price;
    }

    /**
     * 获取规格
     *
     * @return norms - 规格
     */
    public String getNorms() {
        return norms;
    }

    /**
     * 设置规格
     *
     * @param norms 规格
     */
    public void setNorms(String norms) {
        this.norms = norms;
    }

    /**
     * 获取产地
     *
     * @return origin - 产地
     */
    public String getOrigin() {
        return origin;
    }

    /**
     * 设置产地
     *
     * @param origin 产地
     */
    public void setOrigin(String origin) {
        this.origin = origin;
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