package com.zjh.internethospitalservice.controller;

import com.zjh.internethospitalapi.service.test.TestService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/6 15:49
 */
@RestController
public class TestController {
    @Autowired
    TestService testService;
    @PostMapping("/test")
    public ResponseEntity<ApiResponse> test(@RequestParam(value = "name") String name){
        return ApiResponse.successResponse(name);
    }
}
