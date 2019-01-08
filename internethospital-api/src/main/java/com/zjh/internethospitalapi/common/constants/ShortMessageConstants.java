package com.zjh.internethospitalapi.common.constants;

/**
 * 腾讯云短信配置常量
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/8 16:34
 */
public class ShortMessageConstants {

    private ShortMessageConstants(){

    }

    public static final int  APP_ID = 1400174092;
    public static final String APP_KEY = "e20df0818b509f8ccf2bf115838403c5";
    public static final String SMS_SIGN = "张江浩个人作品展示";

    /**
     * 模板id
     */
    public static final int APPOINTMENT_SUCCESS_TEMPLATE_ID = 257503;
    //到号提醒短信模板id
    public static final int CALL_ACTIVE_TEMPLATE_ID = 257500;
}
