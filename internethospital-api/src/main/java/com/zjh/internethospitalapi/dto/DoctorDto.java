package com.zjh.internethospitalapi.dto;

import lombok.Data;
/**
 * 医生dto，去除密码，身份证号等敏感信息
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 14:53
 */
@Data
public class DoctorDto {
    /**
     * id
     */
    private Integer id;

    /**
     * 医生工号
     */
    private String doctorNumber;

    /**
     * 医生真实姓名
     */
    private String doctorName;


    /**
     * 手机号(登录账号)
     */
    private String phone;

    /**
     * 医生职称（医师-医师）
     */
    private String doctorTitle;

    /**
     * 医生头像id
     */
    private String imgId;

    /**
     * 擅长
     */
    private String goodAt;

    /**
     * 医生所属科室数量
     */
    private String deptNum;

    /**
     * 排序  越大越前面
     */
    private Integer sort;

    /**
     * 医生星级
     */
    private String starLevel;

    /**
     * 图片地址
     */
    private String imgPath;
}
