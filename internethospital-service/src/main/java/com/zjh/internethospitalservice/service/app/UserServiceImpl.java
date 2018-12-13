package com.zjh.internethospitalservice.service.app;

import com.zjh.internethospitalapi.entity.User;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalservice.mapper.UserMapper;
import com.zjh.internethospitalservice.util.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/21 15:54
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public Integer userLogin(String phone, String password, Integer roleId) {
        Integer userId = null;
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("phone", phone).andEqualTo("roleId", roleId);
        /**
         * 获得数据库中原先加盐加密后的密码，进行解码，判断是否正确登录
         */
        User user = userMapper.selectOneByExample(example);
        if (user == null) {
            return null;
        }
        boolean isCorrectUser = PasswordUtil.verify(password, user.getPassword());
        /**
         * 正确的账号，密码；重新生产新的加盐加密后的密码，更新数据库内原先密码
         */
        if (isCorrectUser) {
            userId = user.getId();
            String newMd5Password = PasswordUtil.generate(password);
            user.setPassword(newMd5Password);
            userMapper.updateByPrimaryKeySelective(user);
        }
        return userId;
    }

    @Override
    public Integer userRegister(String phone, String password) {
        String md5Password = PasswordUtil.generate(password);
        User user = new User();
        user.setPhone(phone);
        user.setPassword(md5Password);
        user.setRoleId(1);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        return userMapper.insert(user);
    }

    @Override
    public boolean isSameUserPhone(String phone, Integer roleId) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("phone", phone).andEqualTo("roleId", roleId);
        User user = userMapper.selectOneByExample(example);
        return user != null;
    }
}
