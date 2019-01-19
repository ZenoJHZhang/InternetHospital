package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 鉴权相关API
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 09:47
 */
@RestController
@Api(tags = "【鉴权】认证、鉴权相关API")
public class IndexController {
    @RequestMapping(value = "/unauthorized/*")
    public ResponseEntity<ApiResponse> unauthorized() {
        return ApiResponse.failAuthentication();
    }

    @GetMapping(value = "/authenticationTest")
    @ApiOperation(value = "身份认证，防止token被篡改或过期")
    public void authentication(){

    }

    @GetMapping(value = "/userAuthorizationTest")
    @ApiOperation(value = "普通用户权限认证，以便前端路由跳转")
    @RequiresRoles(value = "user")
    public void userAuthorization(){

    }
}
