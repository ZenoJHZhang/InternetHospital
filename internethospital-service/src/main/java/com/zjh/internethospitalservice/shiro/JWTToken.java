package com.zjh.internethospitalservice.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * Token
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 15:00
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
