package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalapi.service.app.ImgService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/5 16:20
 */
@RestController
@RequestMapping("/img")
@Api(tags = "图片相关API")
public class ImgController {

    private final ImgService imgService;

    @Autowired
    public ImgController(ImgService imgService) {
        this.imgService = imgService;
    }

    @GetMapping("/listIndexImg")
    @ApiOperation(value = "获得首页轮播图")
    public ResponseEntity<ApiResponse> listIndexImg() {
        return ApiResponse.successResponse(imgService.listIndexCarousel());
    }
}
