package com.zjh.internethospitalservice.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * Created with IntelliJ IDEA
 *
 * @Author 张江浩
 * @Description JWT 工具类
 * @Date 2018-11-21
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
     * 生成 token, 5min后过期
     *
     * @param phone 手机号
     * @return 加密的token
     */
    public static String createToken(String phone) {
        Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
        Algorithm algorithm = Algorithm.HMAC256(SECRET);
        // 附带username信息
        return JWT.create()
                .withClaim("phone", phone)
                //到期时间
                .withExpiresAt(date)
                //创建一个新的JWT，并使用给定的算法进行标记
                .sign(algorithm);
    }

    /**
     * 校验 token 是否正确
     *
     * @param token    密钥
     * @param phone 手机号
     * @return 是否正确
     */
    public static boolean verify(String token, String phone) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(SECRET);
            //在token中附带了username信息
            JWTVerifier verifier = JWT.require(algorithm)
                    .withClaim("phone", phone)
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
     * @return token中包含的用户名
     */
    public static String getUsername(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("phone").asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }
}
