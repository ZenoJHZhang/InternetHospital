package com.zjh.internethospitalapi.dto;

import lombok.Data;

/**
 * 当前时段的医生排班
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/24 14:36
 */
@Data
public class ScheduleDoctorDto {
    String scheduleTime;

    String timeInterval;

    Integer totalNumber;

    Integer scheduleDoctorId;
}
