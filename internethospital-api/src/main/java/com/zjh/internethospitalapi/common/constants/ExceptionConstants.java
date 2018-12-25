package com.zjh.internethospitalapi.common.constants;

/**
 * 错误抛出常量类
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/14 09:55
 */
public class ExceptionConstants {
    private ExceptionConstants(){

    }
    public static final String IMG_NOT_EXIST = "图片不存在";
    public static final String USER_RESERVATION_INSERT_FAIL = "提交就诊申请失败，请稍后再试";
    public static final String IMG_INSERT_FAIL = "图片上传失败";
    public static final String IMG_DELETE_FAIL = "图片删除失败";
    public static final String PATIENT_DELETE_FAIL = "就诊人删除失败，请稍后再试";
    public static final String USER_INSERT_FAIL = "注册失败，请稍后再试";
    public static final String USER_RESERVATION_NOT_EXIST = "就诊详情不存在";
    public static final String UPDATE_SCHEDULE_DOCTOR_FAIL = "更新医生排班失败,请稍微再试";
    public static final String UPDATE_USER_RESERVATION_FAIL = "更新就诊信息失败,请稍后再试";
}
