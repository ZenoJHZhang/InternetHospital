package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.service.management.ManagementScheduleDepartmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.LinkedList;
import java.util.List;

import static org.junit.Assert.*;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/30 10:02
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ManagementScheduleDepartmentServiceImplTest {

    @Autowired
    ManagementScheduleDepartmentService managementScheduleDepartmentService;


    @Test
    public void setScheduleDepartmentStart()
    {
        List<Integer> list = new LinkedList<>();
        list.add(2);
        list.add(5);
        list.add(4);
        list.sort((t1,t2) -> t1 - t2);
        for (Integer u:list
             ) {
            System.out.println(u);
        }
    }
}