package com.zjh.internethospitalapi.dto;

import lombok.Data;

import java.util.List;

/**
 * 当日医生排班
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/24 14:53
 */
@Data
public class TodayScheduleDoctorDto {
    //持有当日三个时段的医生排班信息
    List<ScheduleDoctorDto> scheduleDoctorDtoList;

    //具体是哪个医生
    Integer doctorId;

    String doctorName;
}
