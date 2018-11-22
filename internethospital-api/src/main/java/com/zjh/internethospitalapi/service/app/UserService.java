package com.zjh.internethospitalapi.service.app;

import com.zjh.internethospitalapi.entity.User;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/21 15:50
 */
public interface UserService {
    /**
     * 用户登录
     * @param phone
     * @param password
     * @return
     */
    String userLogin(String phone,String password);

    /**
     * 用户注册，仅需 phone ，password
     * @param phone
     * @param password
     * @return
     */
    Integer userRegister(String phone, String password);

    /**
     * 判断用户手机号是否重复 true: 重复 false：不重复
     * @param phone
     * @return
     */
    boolean isSameUserPhone(String phone);
}
