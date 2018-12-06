package com.zjh.internethospitalapi.common;

/**
 * 常量类
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/26 09:47
 */
public final class Constants {
    private Constants(){

    }
    public static final String MORNING = "上午";
    public static final String AFTERNOON = "下午";
    public static final String NIGHT = "晚上";
    public static final String MORNING_HAS = "morningHas";
    public static final String AFTERNOON_HAS = "afternoonHas";
    public static final String NIGHT_HAS = "nightHas";

    /**
     * 表示正确，拥有等义
     */
    public static final String IS_Ture  = "1";

    /**
     * 图片基地址
     */
    public static final String IMG_BASE_URL = "C:/img/";
    /**
     * 图片二级文件夹名字
     *
     * index：首页轮播图
     * netTreatRoom：网络诊室页面轮播图
     * banner：顶端 1920*350 图
     * department：诊室图
     * doctor：医生头像
     * userReservation：用户就诊描述图片
     */
    public static final String IMG_TYPE_INDEX = "index";

}
