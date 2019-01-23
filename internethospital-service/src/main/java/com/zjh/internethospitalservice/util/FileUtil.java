package com.zjh.internethospitalservice.util;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.service.img.ImgService;
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

    public static ResponseEntity<ApiResponse> uploadFile(MultipartFile file, String imgType, String description) {
        String fileOriginalFilename = file.getOriginalFilename();
        String suffix = fileOriginalFilename.substring(fileOriginalFilename.lastIndexOf(".") + 1);
        String uuid = UUID.randomUUID().toString();
        String uuidName = uuid + "." + suffix;
        String filePath = Constants.IMG_UPLOAD_BASE_URL + imgType +
                "/";
        File dest = new File(filePath, uuidName);
        Img img = new Img();
        img.setImgUuid(uuid);
        img.setType(imgType);
        img.setSuffix(suffix);
        img.setDescription(description);
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("文件上传失败");
        }
        imgService.insertIndexCarousel(img);
        return ApiResponse.successResponse(img);
    }

    public static ResponseEntity<ApiResponse> deleteFile(Integer id) {
        boolean deleteFlag = false;
        Img img = imgService.selectImgById(id);
        int result = 0;
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
        if (deleteFlag) {
            imgService.deleteImgById(id);
        }
        return ApiResponse.successResponse(result);
    }
}
