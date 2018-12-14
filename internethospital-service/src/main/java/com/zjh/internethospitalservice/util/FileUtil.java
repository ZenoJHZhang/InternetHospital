package com.zjh.internethospitalservice.util;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.service.app.ImgService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/14 09:13
 */
@Component
public class FileUtil {

    private static ImgService imgService;

    @Autowired
    private FileUtil(ImgService imgService) {
        FileUtil.imgService = imgService;
    }

    public static ResponseEntity<ApiResponse> uploadFile(MultipartFile file, String imgType,String description) {
        String fileOriginalFilename = file.getOriginalFilename();
        String suffix = fileOriginalFilename.substring(fileOriginalFilename.lastIndexOf(".") + 1);
        String uuid = UUID.randomUUID().toString();
        String uuidName = uuid + "." + suffix;
        String filePath = Constants.IMG_UPLOAD_BASE_URL + imgType +
                "/";
        Integer insertResult ;
        File dest = new File(filePath, uuidName);
        Img img = new Img();
        img.setImgUuid(uuid);
        img.setType(imgType);
        img.setSuffix(suffix);
        img.setDescription(description);
        try {
            file.transferTo(dest);
            insertResult = imgService.insertIndexCarousel(img);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("文件上传失败");
        }
        if (insertResult == 1){
            return ApiResponse.successResponse(img);
        }
        else {
            return ApiResponse.commonResponse(500,"文件上传失败",insertResult);
        }
    }

    public static ResponseEntity<ApiResponse> deleteFile(Integer id) throws Exception {
        boolean deleteFlag = false;
        Img img = imgService.selectImgById(id);
        int  result = 0;
        if (img == null) {
            throw new InternetHospitalException(ExceptionConstants.IMG_NOT_EXIST);
        }
        String imgType = img.getType();
        String suffix = img.getSuffix();
        String imgUuid = img.getImgUuid();
        String uuidName = imgUuid + "." + suffix;
        String filePath = Constants.IMG_UPLOAD_BASE_URL + imgType +
                "/";
        File file = new File(filePath + uuidName);
        if (file.exists()) {
            deleteFlag = file.delete();
        }
        if (deleteFlag){
            result = imgService.deleteImgById(id);
        }
        if (result == 1){
            return ApiResponse.successResponse(result);
        }
        else {
            return ApiResponse.commonResponse(400,"图片删除失败",result);
        }
    }
}
