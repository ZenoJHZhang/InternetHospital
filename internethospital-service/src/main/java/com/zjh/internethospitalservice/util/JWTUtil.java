package com.zjh.internethospitalservice.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import io.swagger.models.auth.In;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * JWT工具类
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 15:00
 */
public class JWTUtil {
    /**
     * 过期时间 24 小时
     */
    private static final long EXPIRE_TIME = 60 * 24 * 60 * 1000;
    /**
     * 密钥
     */
    private static final String SECRET = "WNYL+ZJH";

    /**
     * 生成 token, 24小时后过期
     *
     * @param userId
     * @param phone 手机号
     * @return 加密的token
     */
    public static String createToken(Integer userId,String phone,Integer roleId) {
        Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
        Algorithm algorithm = Algorithm.HMAC256(SECRET);
        // 附带username信息
        return JWT.create()
                .withClaim("userId",userId)
                .withClaim("phone", phone)
                .withClaim("roleId",roleId)
                //到期时间
                .withExpiresAt(date)
                //创建一个新的JWT，并使用给定的算法进行标记
                .sign(algorithm);
    }

    /**
     * 校验 token 是否正确
     *
     * @param userId
     * @param token    密钥
     * @param phone 手机号
     * @return 是否正确
     */
    public static boolean verify(String token,Integer userId, String phone, Integer roleId) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(SECRET);
            //在token中附带了username信息
            JWTVerifier verifier = JWT.require(algorithm)
                    .withClaim("userId",userId)
                    .withClaim("phone", phone)
                    .withClaim("roleId",roleId)
                    .build();
            //验证 token
            verifier.verify(token);
            return true;
        } catch (Exception exception) {
            return false;
        }
    }

    /**
     * 获得token中的信息，无需secret解密也能获得
     *
     * @return token中包含的手机号
     */
    public static String getPhone(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("phone").asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    /**
     * 获得token中的信息，无需secret解密也能获得
     *
     * @return token中包含的权限id
     */
    public static Integer getRoleId(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("roleId").asInt();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    /**
     * 获得token中的信息，无需secret解密也能获得
     *
     * @return userId
     */
    public static Integer getUserId(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("userId").asInt();
        } catch (JWTDecodeException e) {
            return null;
        }
    }
}
