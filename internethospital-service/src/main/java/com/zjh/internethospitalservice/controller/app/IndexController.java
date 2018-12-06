package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;

/**
 * 鉴权相关API
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 09:47
 */
@RestController
@Api(tags = "鉴权相关API")
public class IndexController {
    @RequestMapping(value = "/unauthorized/*")
    public ResponseEntity<ApiResponse> unauthorized() {
        return ApiResponse.failAuthentication("token认证失败");
    }

    @GetMapping(value = "/authorizationTest")
    @ApiOperation(value = "token认证，防止token被篡改或过期")
    public void authorizationTest(){

    }
}
