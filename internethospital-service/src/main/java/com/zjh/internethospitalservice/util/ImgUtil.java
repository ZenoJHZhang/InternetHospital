package com.zjh.internethospitalservice.util;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.Img;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/10 14:06
 */
public class ImgUtil {

    /**
     * 生成从服务器上获取图片完整路径
     *
     * @param img
     * @return
     */
    public static String imgPathGenerate(Img img) {
        StringBuilder imgPath = new StringBuilder();
        imgPath.append(Constants.IMG_DOWNLOAD_BASE_URL).append(img.getType()).append("/")
                .append(img.getImgUuid()).append(".").append(img.getSuffix());
        return imgPath.toString();
    }

}
