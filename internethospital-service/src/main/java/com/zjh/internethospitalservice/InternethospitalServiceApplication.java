package com.zjh.internethospitalservice;

import com.spring4all.swagger.EnableSwagger2Doc;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan(basePackages = "com.zjh.internethospitalservice.mapper")
@EnableSwagger2Doc
@EnableAspectJAutoProxy
@EnableScheduling
public class InternethospitalServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(InternethospitalServiceApplication.class, args);
    }
}
