package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/20 17:06
 */
@Data
public class Img {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 图片 uuid
     */
    private String imgUuid;

    /**
     * 图片后缀
     */
    private String suffix;

    /**
     * 图片描述
     */
    private String description;

    /**
     * 类型，0 默认图片 1 用户上传图片
     */
    private String type;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;
}
