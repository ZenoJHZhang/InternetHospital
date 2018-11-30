package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalservice.controller.base.ApiResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/23 09:47
 */
@RestController
public class IndexController {
    @RequestMapping(value = "/unauthorized/*")
    public ResponseEntity<ApiResponse> unauthorized() {
        return ApiResponse.failAuthentication("token认证失败");
    }
}
