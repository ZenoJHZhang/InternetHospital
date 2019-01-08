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
    public static final String USER_NOT_EXIST = "很抱歉，查询的用户不存在";
    public static final String DOCTOR_NOT_EXIST = "医生不存在";
    public static final String DEPARTMENT_NOT_EXIST = "科室不存在";
    public static final String INSERT_SCHEDULE_DOCTOR_FAIL = "添加医生排班失败,请稍后再试";
    public static final String INSERT_SCHEDULE_DEPARTMENT_FAIL = "添加科室排班失败,请稍后再试";
    public static final String UPDATE_SCHEDULE_DEPARTMENT_FAIL = "更新科室排班失败,请稍后再试";
    public static final String ERROR_TIME_INTERVAL ="排班时段不存在";
    public static final String SAME_SCHEDULE_DOCTOR = "当日、该时段此医生已排班，请勿重复排班";
    public static final String SAME_SCHEDULE_DEPARTMENT = "当日、该时段此科室已排班，请勿重复排班";
    public static final String SCHEDULE_DEPARTMENT_NOT_EXIST ="科室排班不存在";
    public static final String SCHEDULE_DOCTOR_NOT_EXIST = "医生排班不存在";
    public static final String DELETE_SCHEDULE_DEPARTMENT_FAIL = "删除科室排班失败，请稍后再试";
    public static final String DELETE_SCHEDULE_DOCTOR_FAIL = "删除医生排班失败，请稍后再试";
    public static final String SEND_SHORT_MESSAGE_FAIL = "发送短信失败，请稍后再试";
}
