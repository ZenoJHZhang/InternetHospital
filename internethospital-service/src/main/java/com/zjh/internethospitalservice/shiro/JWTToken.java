package com.zjh.internethospitalservice.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 *
 * @Author 张江浩
 * @Description token
 * @Date 2018-04-09
 * @Time 16:54
 */
public class JWTToken implements AuthenticationToken {
    private String token;

    public JWTToken(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
