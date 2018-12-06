package com.zjh.internethospitalapi.dto;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/6 10:15
 */
public class ImgDto {

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

    /**
     *  type/uuid.suffix
     */
    private String path;
}
