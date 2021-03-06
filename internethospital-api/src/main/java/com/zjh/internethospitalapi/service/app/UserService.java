package com.zjh.internethospitalapi.service.app;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/21 15:50
 */
public interface UserService {
    /**
     * 用户登录,返回是否正确登录
     * required:roleId = 1
     * @param phone
     * @param password
     * @return
     */
    boolean userLogin(String phone,String password);

    /**
     * 普通用户注册，仅需 phone ，password
     * 注册后 roleId = 1
     * @param phone
     * @param password
     * @return
     */
    Integer userRegister(String phone, String password);

    /**
     * 判断相同权限下，是否有用户手机号重复
     * true: 重复 false：不重复
     * @param phone
     * @param roleId
     * @return
     */
    boolean isSameUserPhone(String phone,Integer roleId);
}
