package com.zjh.internethospitalservice.controller.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.common.Constants;
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
@Api(tags = "用户相关API")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @ApiOperation(value = "用户登录，返回token和phone")
    @GetMapping("/login")
    public ResponseEntity<ApiResponse> userLogin(@RequestParam(value = "phone") @ApiParam(required = true, value = "用户手机号") String phone,
                                                 @RequestParam(value = "password") @ApiParam(required = true, value = "用户密码") String password,
                                                 @RequestParam(value = "roleId") @ApiParam(required = true,value = "权限Id",example = "1") Integer roleId) {
        Integer userId = userService.userLogin(phone, password,roleId);
        JSONObject jsonObject = new JSONObject();
        if (userId == null) {
            return ApiResponse.errorResponse("用户不存在或密码不正确",null);
        } else {
            jsonObject.put("token", JWTUtil.createToken(userId,phone,roleId));
            jsonObject.put("phone", phone);
            return ApiResponse.successResponse(jsonObject);
        }
    }

    @ApiOperation(value = "用户注册")
    @PostMapping("/register")
    public ResponseEntity<ApiResponse> userRegister(@RequestParam(value = "phone") @ApiParam(required = true, value = "用户手机号") String phone,
                                                    @RequestParam(value = "password") @ApiParam(required = true, value = "用户密码") String password,
                                                    @RequestParam(value = "roleId") @ApiParam(required = true, value = "用户权限Id",example = "1") Integer roleId) {


        String passwordPattern = Constants.PASSWORD_PATTERN;
        String phonePattern = Constants.PHONE_PATTERN;
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
        boolean isSameFlag = userService.isSameUserPhone(phone, roleId);
        if (isSameFlag) {
            return ApiResponse.errorResponse( "手机号已注册",result);
        } else {
            result = userService.userRegister(phone, password);
            return ApiResponse.successResponse(result);
        }
    }
}
