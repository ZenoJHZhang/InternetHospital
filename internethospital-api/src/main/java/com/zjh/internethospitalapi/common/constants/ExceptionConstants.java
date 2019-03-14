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
    public static final String SAME_SCHEDULE_DOCTOR = "当日、该时段此医生此排班情况已存在，请更改排班时段或更改此时段号源总数，谢谢。";
    public static final String SAME_SCHEDULE_DEPARTMENT = "当日、该时段此科室此排班情况已存在，请更改排班时段或更改此时段号源总数，谢谢。";
    public static final String SCHEDULE_DEPARTMENT_NOT_EXIST ="科室排班不存在";
    public static final String SCHEDULE_DOCTOR_NOT_EXIST = "医生排班不存在";
    public static final String DELETE_SCHEDULE_DEPARTMENT_FAIL = "删除科室排班失败，请稍后再试";
    public static final String DELETE_SCHEDULE_DOCTOR_FAIL = "删除医生排班失败，请稍后再试";
    public static final String SEND_SHORT_MESSAGE_FAIL = "发送短信失败，请稍后再试";
    public static final String PATIENT_UPDATE_FAIL = "就诊人更新失败，请稍后再试";
    public static final String DEPARTMENT_TYPE_ERROR = "科室类型错误";
    public static final String HAS_SCHEDULE_DOCTOR_IN_SCHEDULE_DEPARTMENT ="删除专家科室排班失败：" +
            "当日，此专家科室内仍有专家医生排班;请删除专家排班后再次尝试，谢谢。";
    public static final String SAME_USER_PHONE = "手机号已注册";
    public static final String SAME_USER_ID_CARD = "很抱歉，此身份证号已被注册";
    public static final String INSERT_DOCTOR_FAIL = "添加医生失败，请稍后再试";
    public static final String SAME_DOCTOR ="重复医生信息，请修改后再试";
    public static final String UPDATE_DOCTOR_FAIL = "更新医生信息失败，请稍后再试";
    public static final String DELETE_DOCTOR_FAIL = "删除医生失败，请稍后再试";
    public static final String INSERT_DEPARTMENT_FAIL = "添加科室失败，请稍后再试";
    public static final String UPDATE_DEPARTMENT_FAIL = "更新科室失败，请稍后再试";
    public static final String DELETE_DEPARTMENT_FAIL = "删除科室失败，请稍后再试";
    public static final String DEPARTMENT_HAS_NO_DOCTOR = "科室内无医生，请先添加医生再排班";
    public static final String NOT_EXPERT_DEPARTMENT = "此科室非专家科室";
    public static final String NOT_EXPERT_SCHEDULE_DOCTOR = "此医生排班非专家医生排班";
    public static final String INSERT_DOCTOR_INTO_DEPARTMENT_FAIL = "为医生添加科室失败，请稍后再试";
    public static final String DOCTOR_ALREADY_IN_DEPARTMENT = "科室已存在该医生，请修改需要添加医生的科室，避免重复添加";
    public static final String DOCTOR_HAS_SCHEDULE = "删除医生失败，此医生仍有排班工作，请删除此医生排班后，再删除医生";
    public static final String DELETE_USER_FAIL = "删除用户失败，请稍后再试";
    public static final String PATIENT_NOT_EXIST = "病人不存在";
    public static final String SCHEDULE_DEPARTMENT_HAS_STARTED = "此科室排班已开始，无法删除";
    public static final String SCHEDULE_DOCTOR_HAS_STARTED = "此医生排班已开始，无法删除";
    public static final String SAME_MEDICAL = "此药品已在库中";
    public static final String UPDATE_MEDICAL_FAIL = "更新药品失败，请稍后再试";
    public static final String INSERT_MEDICAL_FAIL = "添加药品失败，请稍后再试";
    public static final String DELETE_MEDICAL_FAIL = "删除药品失败，请稍后再试";
    public static final String MEDICAL_NOT_EXIST = "药品不存在";
    public static final String DEPARTMENT_HAS_STARTING_SCHEDULE = "科室内有未结束的排班，更新失败";
    public static final String SAME_DEPARTMENT = "重复科室信息，请修改后再试";
}
