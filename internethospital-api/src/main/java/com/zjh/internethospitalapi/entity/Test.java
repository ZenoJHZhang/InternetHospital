package com.zjh.internethospitalapi.entity;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/6 14:50
 */
@Data
public class Test {
    @Id
    @GeneratedValue(generator = "JDBC")
    Integer id;
    String name;
}
