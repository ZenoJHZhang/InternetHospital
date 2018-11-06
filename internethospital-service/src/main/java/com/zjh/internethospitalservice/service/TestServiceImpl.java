package com.zjh.internethospitalservice.service;

import com.zjh.internethospitalapi.service.test.TestService;
import com.zjh.internethospitalservice.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/6 15:01
 */
@Service("testService")
public class TestServiceImpl implements TestService {
    @Autowired
    TestMapper testMapper;
    @Override
    public void test() {
        System.out.println(testMapper.selectAll());
    }
}
