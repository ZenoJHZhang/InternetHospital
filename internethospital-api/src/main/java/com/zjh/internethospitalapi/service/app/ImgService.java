package com.zjh.internethospitalapi.service.app;

import com.zjh.internethospitalapi.entity.Img;

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

}
