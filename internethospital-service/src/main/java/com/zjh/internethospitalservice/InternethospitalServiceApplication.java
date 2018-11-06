package com.zjh.internethospitalservice;

import com.spring4all.swagger.EnableSwagger2Doc;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan(basePackages = "com.zjh.internethospitalservice.mapper")
@EnableSwagger2Doc
public class InternethospitalServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(InternethospitalServiceApplication.class, args);
    }
}
