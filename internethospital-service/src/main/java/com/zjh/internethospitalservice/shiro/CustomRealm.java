package com.zjh.internethospitalservice.shiro;

import com.zjh.internethospitalapi.entity.User;
import com.zjh.internethospitalservice.mapper.RoleMapper;
import com.zjh.internethospitalservice.mapper.UserMapper;
import com.zjh.internethospitalservice.util.JWTUtil;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * 自定义Realm
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 15:00
 */
@Component
public class CustomRealm extends AuthorizingRealm {
    private final UserMapper userMapper;
    private final RoleMapper roleMapper;

    @Autowired
    public CustomRealm(UserMapper userMapper, RoleMapper roleMapper) {
        this.userMapper = userMapper;
        this.roleMapper = roleMapper;
    }

    /**
     * 必须重写此方法，不然会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JWTToken;
    }

    /**
     * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String token = (String) authenticationToken.getCredentials();
        User user = new User();
        // 解密获得phone，用于和数据库进行对比
        Integer userId = JWTUtil.getUserId(token);
        String phone = JWTUtil.getPhone(token);
        Integer roleId = JWTUtil.getRoleId(token);
        user.setPhone(phone);
        user.setRoleId(roleId);
        if (phone == null || !JWTUtil.verify(token, userId, phone, roleId)) {
            throw new AuthenticationException("token认证失败！");
        }
        String password = userMapper.selectOne(user).getPassword();
        if (password == null) {
            throw new AuthenticationException("该用户不存在！");
        }
        return new SimpleAuthenticationInfo(token, token, "customRealm");
    }

    /**
     * 只有当需要检测用户权限的时候才会调用此方法，例如checkRole,checkPermission之类的
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //获得该用户角色
        Integer roleId = JWTUtil.getRoleId(principals.toString());
        String role = roleMapper.selectByPrimaryKey(roleId).getRole();
        Set<String> roleSet = new HashSet<>();
        //需要将 role,封装到 Set 作为 info.setRoles()
        roleSet.add(role);
        //设置该用户拥有的角色和权限
        info.setRoles(roleSet);
        return info;
    }
}
