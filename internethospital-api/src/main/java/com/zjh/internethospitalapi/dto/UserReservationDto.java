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

    private String accentDetail;

    private String accentVisit;

    private Integer departmentId;

    private String departmentName;

    private String deptType;

    private Integer doctorId;

    private String doctorName;

    private Integer hospitalId;

    private Integer patientId;

    private String price;

    private Integer scheduleDoctorId;

    private String scheduleTime;

    private String timeInterval;

    private String scheduleDepartmentId;

}
