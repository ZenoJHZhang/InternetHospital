package com.zjh.internethospitalapi.dto;

import lombok.Data;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/30 16:25
 */
@Data
public class UserReservationDto {

    /**
     * 疾病详情
     */
    private String accentDetail;

    /**
     * 科室id
     */
    private Integer departmentId;

    /**
     * 科室名
     */
    private String departmentName;

    /**
     * 科室类型
     */
    private String deptType;

    /**
     * 医生id
     */
    private Integer doctorId;

    /**
     * 医生名字
     */
    private String doctorName;

    private Integer hospitalId;

    private Integer patientId;

    private String price;

    private Integer scheduleDoctorId;

    /**
     * 就诊日期 数据库里的 clinic_date
     */
    private String scheduleTime;

    /**
     * 预约时间段 上午  下午 晚上',
     */
    private String timeInterval;

    private String scheduleDepartmentId;

    /**
     * 预约类型 1普通预约 2普通挂号 3 专家预约
     */
    private String type;

}
