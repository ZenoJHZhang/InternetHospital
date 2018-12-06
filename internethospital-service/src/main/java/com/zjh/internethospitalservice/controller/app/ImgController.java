package com.zjh.internethospitalservice.controller.app;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

    @PostMapping("/listIndexImg")
    @ApiOperation(value = "获得首页轮播图")
    public List<String> listIndexImg() {

        return null;
    }
}
