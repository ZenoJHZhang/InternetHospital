package com.zjh.internethospitalapi.service.img;

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
     * 添加图片
     * @param img
     * @return imgId
     */
    Integer insertImg(Img img);

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
    void deleteImgById(Integer imgId);

    /**
     * 获取用户就诊病情图片信息
     * @param userReservationUuId
     * @return
     */
    List<Img> listUserReservationImg(String userReservationUuId);


}
