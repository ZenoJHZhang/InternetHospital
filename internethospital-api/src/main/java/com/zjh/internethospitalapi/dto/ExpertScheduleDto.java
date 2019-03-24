package com.zjh.internethospitalapi.dto;

import lombok.Data;

import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/24 14:34
 */
@Data
public class ExpertScheduleDto {
    List<TodayScheduleDoctorDto> todayScheduleDoctorDtoList;
}
