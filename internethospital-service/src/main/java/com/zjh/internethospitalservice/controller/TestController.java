package com.zjh.internethospitalservice.controller;

import com.zjh.internethospitalapi.service.test.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
    @GetMapping("/test")
    public void test(){
        testService.test();
    }
}
