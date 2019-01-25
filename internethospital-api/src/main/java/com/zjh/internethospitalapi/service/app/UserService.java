package com.zjh.internethospitalapi.service.app;

import com.zjh.internethospitalapi.dto.UserDto;
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
     * @return user
     */
    User userLogin(String phone, String password);

    /**
     * 用户注册
     * @param phone
     * @param password
     * @param roleId
     * @return
     */
    Integer userRegister(String phone, String password , Integer roleId);

    /**
     * 判断是否有重复身份证号
     * @param idCard 身份证号
     */
    void isSameIdCard(String idCard);

    /**
     * 判断是否有用户手机号重复,无论权限
     * true: 重复 false：不重复
     * @param phone
     * @return
     */
    boolean isSameUserPhone(String phone);

    /**
     * 通过手机号获取非敏感信息
     * @param phone 手机号
     * @return
     */
    UserDto getUserInfo(String phone);

    /**
     * 根据userId删除用户
     * @param userId 用户id
     */
    void deleteUser(Integer userId);
}
