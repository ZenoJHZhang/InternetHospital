package com.zjh.internethospitalapi.common.constants;

/**
 * 普通常量类
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/26 09:47
 */
public final class Constants {
    private Constants() {

    }
    /**
     * 常规名词类
     */
    public static final String DEPARTMENT = "department";
    public static final String EXPERT = "expert";
    public static final String TRUE = "1";
    public static final String FALSE = "0";

    /**
     * pattern 正则表达式
     */
    public static final String PHONE_PATTERN = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$";
    public static final String PASSWORD_PATTERN = "^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])).{8,16}$";
    public static final String ID_CARD_PATTERN = "^[1-9]\\d{5}(18|19|20)\\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]";
    public static final String REAL_NAME_PATTERN = "^[\\u4E00-\\u9FA5\\uf900-\\ufa2d·s]{2,6}";

    /**
     * 请求首页轮播图uri，不进行拦截
     */
    public static final String GET_INDEX_CAROUSEL_URI = "/img/listIndexCarousel";

    /**
     * 排班时间类
     */
    public static final String MORNING = "上午";
    public static final String AFTERNOON = "下午";
    public static final String NIGHT = "晚上";
    public static final String MORNING_HAS = "morningHas";
    public static final String AFTERNOON_HAS = "afternoonHas";
    public static final String NIGHT_HAS = "nightHas";

    /**
     * 图片上传服务器基地址
     */
    public static final String IMG_UPLOAD_BASE_URL = "C:/image/";

    /**
     * 从服务器获取图片基地址
     */
    public static final String IMG_DOWNLOAD_BASE_URL = "https://www.woniuyiliao.cn/image/";

    /**
     * 图片二级文件夹名字
     * <p>
     * index：首页轮播图
     * netTreatmentRoom：网络诊室页面轮播图
     * banner：顶端 1920*350 图
     * department：诊室图
     * doctor：医生头像
     * userReservation：用户就诊描述图片
     */
    public static final String IMG_TYPE_INDEX = "index";
    public static final String IMG_TYPE_NET_TREATMENT_ROOM = "netTreatmentRoom";
    public static final String IMH_TYPE_USER_RESERVATION = "userReservation";
    public static final String IMG_TYPE_DEPARMENT = "department";

}
