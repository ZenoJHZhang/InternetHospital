package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalapi.common.Constants;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.service.app.ImgService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

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

    @PostMapping("/insertIndexImg")
    @ApiOperation(value = "添加首页轮播图")
    public ResponseEntity<ApiResponse> insertIndexImg(@RequestParam(value = "file") MultipartFile file) {
        String fileOriginalFilename = file.getOriginalFilename();
        String suffix = fileOriginalFilename.substring(fileOriginalFilename.lastIndexOf(".") + 1);
        String uuid = UUID.randomUUID().toString();
        String uuidName = uuid+"."+suffix;
        StringBuilder filePath = new StringBuilder();
        Integer insertResult ;
        filePath.append(Constants.IMG_UPLOAD_BASE_URL).append(Constants.IMG_TYPE_INDEX)
                .append("/");
        Img img = new Img();
        img.setImgUuid(uuid);
        img.setType(Constants.IMG_TYPE_INDEX);
        img.setSuffix(suffix);
        img.setDescription("首页轮播图");
        File dest = new File(filePath.toString(),uuidName);
        try {
            file.transferTo(dest);
            insertResult = imgService.insertIndexCarousel(img);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("文件上传失败");
        }
        if (insertResult == 1){
            return ApiResponse.successResponse("文件上传成功");
        }
        else {
            return ApiResponse.commonResponse(500,"文件上传失败",insertResult);
        }
    }
}
