package com.zjh.internethospitalservice.util;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.service.img.ImgService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/14 09:13
 */
@Component
@Slf4j
public class FileUtil {

    private static ImgService imgService;

    @Autowired
    private FileUtil(ImgService imgService) {
        FileUtil.imgService = imgService;
    }

    public static ResponseEntity<ApiResponse> uploadFile(MultipartFile file, String imgType, String description)  {
        String fileOriginalFilename = file.getOriginalFilename();
        String suffix = fileOriginalFilename.substring(fileOriginalFilename.lastIndexOf(".") + 1);
        String uuid = UUID.randomUUID().toString();
        String uuidName = uuid + "." + suffix;
        String filePath = Constants.IMG_UPLOAD_BASE_URL + imgType +
                "/";
        File dest = new File(filePath, uuidName);
        Img img = makeImgDetail(uuid,imgType,suffix,description);
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            log.error(e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
        imgService.insertImg(img);
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

    /**
     * base64转图片并保存
     * @param imgStr base64
     * @param imgType 图片类型
     * @param description 图片描述
     * @return 图片在数据库内的id
     */
    public static Integer enCodingBase64(String imgStr, String imgType, String description) throws IOException {
        imgStr = imgStr.replace("data:image/png;base64,","");
        BASE64Decoder decoder = new BASE64Decoder();
        String suffix = "png";
        String uuid = UUID.randomUUID().toString();
        String uuidName = uuid + "." + suffix;
        String filePath = Constants.IMG_UPLOAD_BASE_URL + imgType +
                "/"+uuidName;
        byte[] b = decoder.decodeBuffer(imgStr);
        for(int i=0;i<b.length;++i)
        {
            if(b[i]<0)
            {//调整异常数据
                b[i]+=256;
            }
        }
        OutputStream out = new FileOutputStream(filePath);
        out.write(b);
        out.flush();
        out.close();
        Img img = makeImgDetail(uuid,imgType,suffix,description);
        return imgService.insertImg(img);
    }

    private static Img makeImgDetail(String uuid,String imgType,String suffix,String description){
        Img img = new Img();
        img.setImgUuid(uuid);
        img.setType(imgType);
        img.setSuffix(suffix);
        img.setDescription(description);
        return img;
    }
}
