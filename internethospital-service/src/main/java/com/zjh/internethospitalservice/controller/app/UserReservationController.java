package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

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
    public ResponseEntity<ApiResponse> insertReservationImg(@RequestParam(value = "file") MultipartFile file) {
        String fileName = file.getOriginalFilename();
        String filePath = "C:/img/inde/";
        File dest = new File(filePath,fileName);
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("文件上传失败");
        }
        return ApiResponse.successResponse("文件上传成功");
    }

}
