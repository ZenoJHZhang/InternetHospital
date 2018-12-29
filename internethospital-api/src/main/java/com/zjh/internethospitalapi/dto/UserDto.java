package com.zjh.internethospitalapi.dto;

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
 * @date: 2018/12/29 13:52
 */
public class UserDto {
    /**
     * id
     */
    private Integer id;

    /**
     * 手机号（用户登录名）
     */
    private String phone;

    /**
     * 身份证
     */
    private String idCard;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 0 ：女 ；1： 男
     */
    private Integer sex;

    /**
     * 用户权限id
     */
    private Integer roleId;
}
