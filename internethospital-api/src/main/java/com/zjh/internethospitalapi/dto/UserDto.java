package com.zjh.internethospitalapi.dto;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/29 13:52
 */
@Data
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

    /**
     * 用户权限描述数组（仅配和前端管理使用，其实里面只有一个权限内容）
     * 设计为一个账号仅能有一种权限
     * 且不同权限，同一手机号是不能注册的
     */
    private List<String> roles;
}
