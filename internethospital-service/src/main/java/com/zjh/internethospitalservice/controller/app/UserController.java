package com.zjh.internethospitalservice.controller.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.util.DigestUtils;
import org.springframework.util.PatternMatchUtils;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedInputStream;
import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/21 15:49
 */
@RestController
@RequestMapping("/user")
@Api(tags = "用户API")
public class UserController {
    @Autowired
    UserService userService;

    @ApiOperation(value = "用户登录，返回token和phone")
    @GetMapping("/login")
    public ResponseEntity<ApiResponse> userLogin(@RequestParam(value = "phone") @ApiParam(required = true, value = "用户手机号") String phone,
                                                 @RequestParam(value = "password") @ApiParam(required = true, value = "用户密码") String password){
        boolean isCorrectUser = userService.userLogin(phone,password);
        JSONObject jsonObject = new JSONObject();
        if (!isCorrectUser) {
            return ApiResponse.loginFail("用户不存在或密码不正确");
        } else {
            jsonObject.put("token", JWTUtil.createToken(phone));
            jsonObject.put("phone", phone);
            return ApiResponse.successResponse(jsonObject);
        }
    }

    @ApiOperation(value = "用户注册")
    @PostMapping("/register")
    public ResponseEntity<ApiResponse> userRegister(@RequestParam(value = "phone") @ApiParam(required = true, value = "用户手机号") String phone,
                                                    @RequestParam(value = "password") @ApiParam(required = true, value = "用户密码") String password,
                                                    @RequestParam(value = "roleId") @ApiParam(required = true, value = "用户权限Id") Integer roleId) {


        String passwordPattern = "^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])).{8,16}$";
        String phonePattern = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$";
        boolean isPasswordMatch = Pattern.matches(passwordPattern, password);
        boolean isPhoneMatch = Pattern.matches(phonePattern, phone);
        if (!isPasswordMatch) {
            return ApiResponse.commonResponse(400, "密码必须是强密码", null);
        }
        if (!isPhoneMatch) {
            return ApiResponse.commonResponse(400, "手机号格式错误", null);
        }
        int result = 0;
        /**
         * true : 重复 ; false：未重复
         */
        boolean isSameFlag = userService.isSameUserPhone(phone,roleId);
        if (isSameFlag) {
            return ApiResponse.commonResponse(400, "手机号已注册", result);
        } else {
            result = userService.userRegister(phone, password);
            return ApiResponse.successResponse(result);
        }
    }
}
