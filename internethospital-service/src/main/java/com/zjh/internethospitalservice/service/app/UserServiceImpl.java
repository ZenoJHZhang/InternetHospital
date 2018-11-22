package com.zjh.internethospitalservice.service.app;

import com.zjh.internethospitalapi.entity.User;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalservice.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/21 15:54
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public String userLogin(String phone, String password) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("phone",phone).andEqualTo("password",password);
        User user = userMapper.selectOneByExample(example);
        if (user == null){
            return null;
        }
        else{
            return  user.getPassword();
        }
    }

    @Override
    public Integer userRegister(String phone, String password) {
        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);
        return userMapper.insert(user);
    }

    @Override
    public boolean isSameUserPhone(String phone) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("phone",phone);
        User user = userMapper.selectOneByExample(example);
        return user != null;
    }
}
