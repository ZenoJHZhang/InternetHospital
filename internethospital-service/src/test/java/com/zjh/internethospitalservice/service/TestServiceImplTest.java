package com.zjh.internethospitalservice.service;

import com.zjh.internethospitalapi.service.test.TestService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/6 15:06
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class TestServiceImplTest {
    @Autowired
    TestService testService;

    @Test
    public void test1() {
        testService.test();
    }
}