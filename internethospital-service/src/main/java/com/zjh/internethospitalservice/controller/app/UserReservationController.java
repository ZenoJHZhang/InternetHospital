package com.zjh.internethospitalservice.controller.app;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:30
 */
@RestController
@RequestMapping("/userReservation")
@Api(tags = "用户就诊记录API")
public class UserReservationController {

    @PostMapping("/insertReservationImg")
    public String insertReservationImg(@RequestParam(value = "file") MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = "E:\\temp";
        File dest = new File(filePath,fileName);
        file.transferTo(dest);
        return null;
    }

}
