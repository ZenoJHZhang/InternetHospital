package com.zjh.internethospitalservice.service.app;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.dto.UserDto;
import com.zjh.internethospitalapi.entity.User;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalservice.mapper.UserMapper;
import com.zjh.internethospitalservice.util.PasswordUtil;
import org.springframework.beans.BeanUtils;
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
    public User userLogin(String phone, String password) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("phone", phone);
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
            String newMd5Password = PasswordUtil.generate(password);
            user.setPassword(newMd5Password);
            userMapper.updateByPrimaryKeySelective(user);
        }
        return user;
    }

    @Override
    public void userRegister(String phone, String password,Integer roleId) {
        String md5Password = PasswordUtil.generate(password);
        User user = new User();
        user.setPhone(phone);
        user.setPassword(md5Password);
        user.setRoleId(roleId);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        Integer result = userMapper.insert(user);
        if (result != 1){
            throw new InternetHospitalException(ExceptionConstants.USER_INSERT_FAIL);
        }
    }

    @Override
    public void isSameIdCard(String idCard) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("idCard", idCard);
        User user = userMapper.selectOneByExample(example);
        if (user != null){
            throw new InternetHospitalException(ExceptionConstants.SAME_USER_ID_CARD);
        }
    }

    @Override
    public boolean isSameUserPhone(String phone) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("phone", phone);
        User user = userMapper.selectOneByExample(example);
        return user != null;
    }

    @Override
    public UserDto getUserInfo(String phone) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("phone", phone);
        User user = userMapper.selectOneByExample(example);
        if(user == null){
            throw new InternetHospitalException(ExceptionConstants.USER_NOT_EXIST);
        }
        UserDto userDto = new UserDto();
        BeanUtils.copyProperties(user,userDto);
        return userDto;
    }
}
