package com.zjh.internethospitalapi.service.app;

import com.zjh.internethospitalapi.entity.Img;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/6 10:14
 */
public interface ImgService {

    /**
     * 获取首页轮播图
     * @return
     */
    List<Img> listIndexCarousel();

    /**
     * 添加首页轮播图
     * @param img
     * @return
     */
    Integer insertIndexCarousel(Img img);

    /**
     * 获得网络诊室页面轮播图
     * @return
     */
    List<Img> listNetTreatmentRoomCarousel();

    /**
     * 通过id选择图片
     * @param imgId
     * @return
     */
    Img selectImgById(Integer imgId);

    /**
     * 通过id删除图片
     * @param imgId
     * @return
     */
    Integer deleteImgById(Integer imgId);
}
